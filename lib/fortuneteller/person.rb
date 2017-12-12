module FortuneTeller
  # Representation of a person being simulated with FortuneTeller
  class Person
    attr_reader :gender, :birthday
    def initialize(gender:, birthday:)
      @gender = gender
      @birthday = birthday
    end
  end
end