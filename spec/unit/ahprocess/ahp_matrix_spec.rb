require 'spec_helper'

describe AHProcess::AHPMatrix do
  let(:matrix) do
    [[    1,     3, 7],
     [1.0/3,     1, 5],
     [1.0/7, 1.0/5, 1]]
  end

  subject { described_class.new(matrix) }

  describe '#normalize' do
    let(:expected) do
      described_class.new([[0.67741935483870970, 0.714285714285714300, 0.53846153846153840],
                           [0.22580645161290325, 0.238095238095238080, 0.38461538461538464],
                           [0.09677419354838710, 0.047619047619047616, 0.07692307692307693]])
    end

    it 'normalizes given matrix for AHP method' do
      expect(subject.normalize).to eq(expected)
    end
  end

  describe '#preference_vector' do
    it 'returns preference vector of given matrix for AHP method' do
      expect(subject.preference_vector).to eq(Vector[0.6433888691953208, 0.2828390247745087, 0.07377210603017055])
    end
  end

  describe '#column_sum' do
    it 'returns column sum of given matrix for AHP method' do
      expect(subject.column_sum).to eq(Vector[1.476190476190476, 4.2, 13])
    end
  end

  describe '#lambda_max' do
    it 'returns lambda max for given matrix for AHP method' do
      expect(subject.lambda_max).to eq(3.0967258036382463)
    end
  end

  describe '#consistency_index' do
    it 'returns consistency index of given matrix for AHP method' do
      expect(subject.consistency_index).to eq(0.04836290181912317)
    end
  end

  describe '#consistency_ratio' do
    it 'returns consistency ratio of given matrix for AHP method' do
      expect(subject.consistency_ratio(0.58)).to eq(0.08338431348124685)
    end
  end
end
