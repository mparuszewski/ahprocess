require 'matrix'
require 'forwardable'

module AHProcess
  class AHPMatrix
    include Comparable
    extend Forwardable
    def_delegators :@matrix, :row_count, :column_vectors, :row_vectors, :inner_product, :empty?
    attr_reader :matrix

    def initialize(matrix = [])
      @matrix = Matrix[*matrix]
    end

    def <=>(other)
      @matrix <=> other.matrix
    end

    def normalize
      AHPMatrix.new(Matrix.columns(column_vectors.map { |cv| cv / cv.inject(:+).to_f }))
    end

    def preference_vector
      Vector[*(normalize.row_vectors.map { |rv| rv.inject(:+).to_f / rv.size })]
    end

    def column_sum
      Vector[*(column_vectors.map { |v| v.inject(:+) })]
    end

    def lambda_max
      preference_vector.inner_product column_sum
    end

    def consistency_index
      (lambda_max - row_count) / (row_count - 1)
    end

    def consistency_ratio(random_consistency_index)
      consistency_index / random_consistency_index
    end
  end
end