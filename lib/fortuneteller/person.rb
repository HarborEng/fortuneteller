module FortuneTeller
  # Representation of a person being simulated with FortuneTeller
  class Person
    attr_reader :gender, :birthday, :filing_status
    def initialize(gender:, birthday:, filing_status:)
      @gender = gender
      @birthday = birthday
      @filing_status = filing_status
    end
  end
end
