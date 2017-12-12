# rubocop:disable Metrics/AbcSize
module FortuneTeller
  # We use MomentStruct for objects with scheduled changes
  class MomentStruct
    attr_reader :start, :future
    def initialize(**args)
      @start = FortuneTeller::MomentStructBase.new args
      @future = []
    end

    def to_reader
      FortuneTeller::MomentStructReader.new(self)
    end

    def read(date)
      return @start if @future[0][:date] > date
      future_ct = @future.length
      @future.each_with_index do |f, i|
        if (i == (future_ct - 1)) || (@future[(i + 1)][:date] > date)
          return f[:struct]
        end
      end
    end

    def read_for_writing(date)
      i = 0
      while i < @future.length
        future = @future[i]
        return future[:struct] if future[:date] == date
        break if future[:date] > date
        i += 1
      end
      current = (i.zero? ? @start : @future[(i - 1)][:struct])
      @future.insert(i, date: date, struct: current.clone)
      @future[i][:struct]
    end

    def on(date)
      FortuneTeller::MomentStructMoment.new(self, date)
    end

    private

    def insert_at(index, date); end

    def method_missing(name, *args)
      if name.to_s.end_with?('=') || @start.respond_to?(name)
        @start.send(name, *args)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      @start.respond_to?(name) || super
    end
  end

  # An enumerator-like reader for efficient ordered reading
  class MomentStructReader
    def initialize(struct)
      @struct = struct
      @struct_ct = @struct.future.length
      @date = nil
      @next_date = (@struct.future.empty? ? nil : @struct.future[0][:date])
      @i = -1
      @object = @struct.start
    end

    def read(date)
      validate_read(date)
      @date = date
      return @object if @next_date.nil? || (date < @next_date)
      ((@i + 1)..(@struct_ct - 1)).each do |i|
        next_obj = @struct.future[i + 1]
        next unless next_obj.nil? || (next_obj[:date] > @date)
        @next_date = (next_obj.nil? ? nil : next_obj[:date])
        @i = i
        return @object = @struct.future[i][:struct]
      end
    end

    private

    def validate_read(date)
      throw 'Reading backwards' if !@date.nil? && (date < @date)
    end
  end

  # Utility class returned while scheduling with `on`
  class MomentStructMoment
    DESTRUCTIVE = %i[delete_field update].freeze
    def initialize(struct, date)
      @struct = struct
      @date = date
    end

    def method_missing(name, *args)
      if name.to_s.end_with?('=') || DESTRUCTIVE.include?(name)
        @struct.read_for_writing(@date).send(name, *args)
      else
        obj = @struct.read(@date)
        if name.to_s.end_with?('=') || obj.respond_to?(name)
          @struct.read(@date).send(name, *args)
        else
          super
        end
      end
    end

    def respond_to_missing?(name, include_private = false)
      @struct.start.respond_to?(name) || super
    end
  end

  # Underlying structure for method accessible hash
  class MomentStructBase < OpenStruct
    def update(**kargs)
      kargs.each { |k, v| self[k] = v }
    end
  end
end
