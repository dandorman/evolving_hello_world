require File.join(File.dirname(__FILE__), '/lib/string_extensions')

source = "jiKnp4bqpmAbp"
target = "Hello, World!"

fitness = source.fitness(target)
iteration = 0

until fitness.zero?
  iteration += 1
  mutant = source.mutate
  mutant_fitness = mutant.fitness(target)
  if mutant_fitness < fitness
    fitness = mutant_fitness
    source = mutant
    puts "%5i %5i %14s" % [iteration, fitness, source]
  end
end
