module FortuneTeller
  class PlanSetupError < StandardError
    MESSAGES = {
      no_person: 
        "You must add people to your plan before adding components.",
      no_primary_person: 
        "You used add_partner but not add_primary. If you are only simulating one person, use add_primary.",
      plan_finalized:
        "After you run a simulation, you cannot make adjustments to the plan or people.",
      allocation_exists:
        "You can only add one allocation strategy.",
      allocation_unbalanced:
        "Values must add to 10,000 (basis points)."
    }

    def initialize(type)
      super(MESSAGES[type])
    end
  end
end