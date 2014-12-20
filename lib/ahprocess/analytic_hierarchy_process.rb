require 'ahprocess/ahp_matrix'

module AHProcess
  class AnalyticHierarchyProcess
    attr_reader :decision_matricies, :criteria_matrix, :no_decisions

    def initialize(decision_matricies, criteria_matrix = [], no_decisions = 1)
      @no_decisions       = no_decisions
      @criteria_matrix    = AHPMatrix.new(criteria_matrix)
      @decision_matricies = decision_matricies.map { |matrix| AHPMatrix.new(matrix) }
    end

    def decide
      return decision_matricies.map(&:preference_vector).first.to_a if criteria_matrix.empty?

      decision_preference_vectors = decision_matricies.map(&:preference_vector)
      criteria_preference_vector  = criteria_matrix.preference_vector

      (0...no_decisions).map do |decision_index|
        criteria_preference_vector.inner_product(decision_preference_vectors.map { |pv| pv[decision_index] })
      end
    end

    def consistency_ratios(random_consistency_index)
      return [decision_matricies.map { |pv| pv.consistency_ratio(random_consistency_index) }] if criteria_matrix.empty?
      [decision_matricies.map { |pv| pv.consistency_ratio(random_consistency_index) }, criteria_matrix.consistency_ratio(random_consistency_index)]
    end
  end
end
