class RuleApplier
  attr_reader :playground

  RULES = []#[Rules::UnderPopulation, Rules::StayAlive, Rules::OverPopulation, Rules::Reproduction]

  def initialize(playground)
    @playground = playground
  end

  def apply_rules
    RULES.each { |rule| rule.apply_to(playground) }
  end
end
