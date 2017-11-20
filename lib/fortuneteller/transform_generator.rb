module FortuneTeller
  # Base class for FortuneTeller objects that generate transforms
  class TransformGenerator
    attr_reader :holder, :start_date, :end_date

    def initialize(holder: nil, start_date: nil, end_date: nil, **data)
      @holder = holder
      @start_date = start_date
      @end_date = end_date
      @scheduled = []
      @data = MomentStruct.new data
    end

    def method_missing(name, *args)
      if @data.respond_to? name
        @data.send(name, *args)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      @data.respond_to?(name) || super
    end

    def bounded_gen_transforms(from:, to:, plan:)
      return [] if out_of_range?(from: from, to: to)
      from = tighten_from(from)
      to = tighten_to(to)
      gen_transforms(from: from, to: to, plan: plan)
    end

    private

    def state_reader
      @data.to_reader
    end

    def states_in_range(from:, to:)
      @data.read_range(from: from, to: to)
    end

    def out_of_range?(from:, to:)
      return true if !@start_date.nil? && (to < @start_date)
      return true if !@end_date.nil? && (from >= @end_date)
      false
    end

    def tighten_from(from)
      return from if @start_date.nil?
      [from, @start_date].max
    end

    def tighten_to(to)
      return to if @end_date.nil?
      [to, @end_date].min
    end
  end
end
