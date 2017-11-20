module FortuneTeller
  # Simulates personal finances.
  class Simulator
    attr_accessor :primary, :partner, :spending_strategy

    def initialize
      @objects = {}
      @available_keys = ('AA'..'ZZ').to_a
    end

    %i[account job social_security].each do |object_type|
      define_method :"add_#{object_type}" do |object|
        add_object type: object_type, object: object
      end
      define_method :"#{object_type.to_s.pluralize}" do
        retrieve_objects type: object_type
      end
    end

    def calculate_take_home_pay(_date)
      # TODO: make this date dependant
      @objects[:job].each_value.map(&:calculate_take_home_pay).sum
    end

    def simulate
      validate_plan!
      end_date = first_day_of_year((youngest_birthday.year + 101))
      states = [initial_state]
      while states.last.date != end_date
        states << simulate_next_state(states.last)
      end
      puts states.as_json
    end

    def inflating_int(int, start_date = nil)
      FortuneTeller::InflatingInt.new(
        int: int,
        start_date: (start_date.nil? ? Date.today : start_date)
      )
    end

    private

    def simulate_next_state(last)
      end_date = first_day_of_year((last.date.year + 1))
      transforms = static_transforms(from: last.date, to: end_date)
      state = evolve_state(last, transforms, end_date)
      extra = spending_strategy.resolution_transforms(state: state)
      unless extra.empty?
        transforms.concat(extra).sort!
        state = evolve_state(last, transforms, end_date)
      end
      state
    end

    def first_day_of_year(year)
      Date.new(year, 1, 1)
    end

    def evolve_state(state, transforms, to)
      state = state.init_next
      transforms.each { |t| t.apply_to(state) }
      state.pass_time(to: to)
      state
    end

    def static_transforms(from:, to:)
      transforms = []
      %i[job social_security].each do |object_type|
        @objects[object_type].each_value { |o| transforms.push(o) }
      end
      transforms = transforms.map do |x|
        x.bounded_gen_transforms(from: from, to: to, plan: self)
      end
      transforms.reduce([], :concat).sort
    end

    def youngest_birthday
      return @primary.birthday if no_partner?
      [@primary.birthday, @partner.birthday].min
    end

    def no_partner?
      @partner.nil?
    end

    def no_primary?
      @primary.nil?
    end

    def initial_state
      s = FortuneTeller::State.new(start_date: Date.today)
      @objects[:account].each { |k, a| s.add_account(key: k, account: a) }
      s
    end

    def validate_plan!
      throw 'Please assign primary' if no_primary?
    end

    def add_object(type:, object:)
      key = @available_keys.shift
      @objects[type] ||= {}
      @objects[type][key] = object
      key
    end

    def retrieve_objects(type:, holder:)
      @objects[type][holder]
    rescue NoMethodError
      {}
    end
  end
end
