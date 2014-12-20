# AHProcess

Ruby gem that provides a way to create Analytic Hierarchy Process decissions with ease.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ahprocess'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ahprocess

## Usage

If you want to make a decision with AHP method just use decide static method of AHProcess:

```ruby
decision_matricies = [[[1, 1.0/5],
                      [5,     1]],
                     [[1,     7],
                      [1.0/7, 1]],
                     [[1,     5],
                      [1.0/5, 1]]]

criteria_matrix = [[    1, 7, 1.0/3],
                   [1.0/7, 1, 1.0/5],
                   [    3, 5,     1]]

no_decisions = 2

AHProcess.decide(decision_matricies, criteria_matrix, no_decisions)
# => [0.6150850856622971, 0.384914914337703]
```

You can also create consistency ratio for your parameters if you want to check if your matricies are consistent.

```ruby
AHProcess.consistency_ratios(decision_matricies, AHProcess::RandomConsistencyIndexTable.index(no_decisions), criteria_matrix)
# => [[0.0, 0.0, 0.0], 0.31263038528636483]
```

## Contributing

1. Fork it ( https://github.com/pinoss/ahprocess/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
