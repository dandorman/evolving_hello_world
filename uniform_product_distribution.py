import random

def uniform_product_random_number():
  return int(random.random() * random.random() * 10)

scores = {0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0}
for i in range(0, 100000):
  scores[uniform_product_random_number()] += 1

for index, score in scores.iteritems():
  print index, '*' * int(score / 100000.0 * 100)
