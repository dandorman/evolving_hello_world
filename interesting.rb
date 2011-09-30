require File.join(File.dirname(__FILE__), '/lib/string_extensions')

target = "Hello, World!"

GENERATION_SIZE = 20

gene_pool = GENERATION_SIZE.times.inject([]) do |pool, _|
  pool << target.length.times.inject("") { |string, _| string << Random.rand(EvolvingHelloWorld::CHARACTER_RANGE).chr }
end

def gene_pool.random_parent
  self[(Random.rand * Random.rand * (length - 1)).to_i]
end

def gene_pool.display(output)
  each_with_index do |string, index|
    output.puts "%2i: %s" % [index + 1, string]
  end
end

iteration = 0
until gene_pool.first.fitness(target).zero?
  iteration += 1

  gene_pool.sort_by! { |string| string.fitness(target) }
  puts "Iteration ##{iteration}"
  gene_pool.display($stdout)
  gets

  child = String.mutate(gene_pool.random_parent, gene_pool.random_parent)
  gene_pool[-1] = child if child.fitness(target) < gene_pool.last.fitness(target)
end
