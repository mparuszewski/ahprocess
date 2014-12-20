module AHProcess
  module RandomConsistencyIndexTable
    INDEXES = {
      1 =>  0.00,
      2 =>  0.00,
      3  => 0.52,
      4  => 0.89,
      5  => 1.11,
      6  => 1.25,
      7  => 1.35,
      8  => 1.40,
      9  => 1.45,
      10 => 1.49,
      11 => 1.51,
      12 => 1.54,
      13 => 1.56,
      14 => 1.57,
      15 => 1.58
    }.freeze

    def self.index(n)
      raise ArgumentError, "indexes should be between #{INDEXES.keys.first} and #{INDEXES.keys.last}" unless INDEXES.key?(n)
      INDEXES[n]
    end
  end
end
