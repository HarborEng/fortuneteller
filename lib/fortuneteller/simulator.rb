module FortuneTeller
  # Simulates personal finances.
  class Simulator
    OBJECT_TYPES = %i[account job social_security spending_strategy tax_strategy]
    USER_TYPES = %i[primary partner]

    USER_TYPES.each do |user_type|
      attr_reader user_type
      define_method :"add_#{user_type}" do |**kwargs|
        instance_variable_set(
          :"@#{user_type}", 
          FortuneTeller::Person.new(**kwargs)
        )
      end
    end

    OBJECT_TYPES.each do |object_type|
      attr_reader object_type.to_s.pluralize.to_sym
      define_method :"add_#{object_type}" do |holder=nil, &block|
        generator = "fortune_teller/#{object_type}/generator".classify.constantize
        key = @available_keys.shift
        obj = generator.new(key, @beginning, holder, &block)
        collection = send(object_type.to_s.pluralize.to_sym)[key] = obj
        obj
      end
    end

    def initialize(beginning)
      @beginning = beginning
      @available_keys = ('AA'..'ZZ').to_a
      OBJECT_TYPES.each do |object_type|
        send("#{object_type.to_s.pluralize}=".to_sym, {})
      end
    end

    def calculate_take_home_pay(date)
      jobs.values.each.map{|x| x.plan.to_reader.on(date).calculate_take_home_pay}.sum
    end

    def simulate
      validate_plan!
      end_date = first_day_of_year((youngest_birthday.year + 101))
      states = [initial_state]
      while states.last.date != end_date
        states << simulate_next_state(states.last)
      end
      puts states.as_json if ENV['VERBOSE']

      states
    end

    def inflating_int(int, start_date = nil)
      FortuneTeller::Utils::InflatingInt.new(
        int: int,
        start_date: (start_date.nil? ? @beginning : start_date)
      )
    end

    private

    OBJECT_TYPES.each do |object_type|
      attr_writer object_type.to_s.pluralize.to_sym
    end

    def simulate_next_state(last)
      end_date = first_day_of_year((last.date.year + 1))
      transforms = static_transforms(from: last.date, to: end_date)
      state = evolve_state(last, transforms, end_date)
      # TODO: Force one spending strategy, find a more elegant way to retrieve it
      extra = spending_strategies.values.first.resolution_transforms(state: state)
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

    def static_components
      @static_components ||=
        %i[job social_security].map do |object_type|
          send(object_type.to_s.pluralize.to_sym)
        end
    end

    def static_transforms(from:, to:)
      static_components
        .flat_map(&:values)
        .flat_map do |gen|
          gen.bounded_gen_transforms(from: from, to: to, simulator: self)
        end
        .sort
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
      s = FortuneTeller::State.new(start_date: @beginning)
      accounts.each { |k, a| s.add_account(key: k, account: a) }
      s
    end

    def validate_plan!
      throw 'Please assign primary' if no_primary?
    end
  end
end
