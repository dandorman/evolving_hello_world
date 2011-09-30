module EvolvingHelloWorld
  CHARACTER_RANGE = 32..126
  def CHARACTER_RANGE.constrain(value)
    return value if include?(value)
    value < min ? min : max
  end

  module StringExtensions
    def self.included(base)
      base.class_eval do
        def self.mutate(parent1, parent2)
          child = parent1.dup

          start, stop = Array.new(2) { Random.rand(parent1.length) }.sort
          child[start..stop] = parent2[start..stop]

          child.mutate!
        end
      end
    end

    def mutate!
      index = Random.rand(length)
      self[index] = CHARACTER_RANGE.constrain(self[index].ord + Random.rand(-1..1)).chr
      self
    end

    def mutate
      dup.mutate!
    end

    def fitness(target)
      chars.with_index.inject(0) do |score, (char, index)|
        score += (target[index].ord - char.ord) ** 2
      end
    end
  end
end

class String
  include EvolvingHelloWorld::StringExtensions
end
