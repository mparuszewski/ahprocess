require 'ahprocess/version'
require 'ahprocess/analytic_hierarchy_process'
require 'ahprocess/random_consistency_index_table'

module AHProcess
  def self.decide(decision_matricies, criteria_matrix = [], no_decisions = 1)
    AnalyticHierarchyProcess.new(decision_matricies, criteria_matrix, no_decisions).decide
  end

  def self.consistency_ratios(decision_matricies, random_consistency_index = 1, criteria_matrix = [])
    AnalyticHierarchyProcess.new(decision_matricies, criteria_matrix).consistency_ratios(random_consistency_index)
  end
end
