def uniform_product_random_number
  (Random.rand * Random.rand * 10).floor
end

scores = Hash[(0...10).zip(Array.new(10, 0))]
100_000.times do
  scores[uniform_product_random_number] += 1
end

scores.each do |index, hits|
  puts "#{index}: #{'*' * (hits / 100_000.0 * 100).to_i}"
end
