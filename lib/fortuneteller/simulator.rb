module FortuneTeller
  # Simulates personal finances.
  class Simulator
    attr_reader :primary, :partner

    %i[primary partner].each do |user_type|
      define_method :"add_#{user_type}" do |**kwargs|
        instance_variable_set(
          :"@#{user_type}", 
          FortuneTeller::Person.new(**kwargs)
        )
      end
    end

    %i[account].each do |object_type|
      define_method :"add_#{object_type}" do |holder=nil, &block|
        c = "fortune_teller/#{object_type}/generator".classify.constantize
        c.new(holder, &block)
      end
    end

    private

  end
end