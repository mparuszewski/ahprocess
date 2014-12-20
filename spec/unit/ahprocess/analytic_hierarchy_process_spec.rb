require 'spec_helper'

describe AHProcess::AnalyticHierarchyProcess do
  let(:criteria_matrix) do
    [[    1, 7, 1.0/3],
     [1.0/7, 1, 1.0/5],
     [    3, 5,     1]]
  end

  let(:decision_matricies) do
    [[[1, 1.0/5],
      [5,     1]],
     [[1,     7],
      [1.0/7, 1]],
     [[1,     5],
      [1.0/5, 1]]]
  end

  let(:no_decisions) { 2 }

  subject { described_class.new(decision_matricies, criteria_matrix, no_decisions) }

  describe '#decide' do
    it 'returnes decision made with AHP algorithm' do
      expect(subject.decide).to eq([0.6150850856622971, 0.384914914337703])
    end
  end
end
