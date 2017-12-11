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
      attr_accessor object_type.to_s.pluralize.to_sym
      define_method :"add_#{object_type}" do |holder=nil, &block|
        c = "fortune_teller/#{object_type}/generator".classify.constantize
        send(object_type.to_s.pluralize.to_sym).push(c.new(@beginning, holder, &block)).last
      end
    end

    def initialize(beginning)
      @beginning = beginning
      OBJECT_TYPES.each do |object_type|
        send("#{object_type.to_s.pluralize}=".to_sym, [])
      end
    end

    def simulate

    end

    def calculate_take_home_pay(date)
      # TODO: make this date dependant
      jobs.each.map{|x| x.plan.to_reader.on(date).calculate_take_home_pay}.sum
    end

    def inflating_int(int, start_date = nil)
      FortuneTeller::Utils::InflatingInt.new(
        int: int,
        start_date: (start_date.nil? ? @beginning : start_date)
      )
    end

    private

  end
end