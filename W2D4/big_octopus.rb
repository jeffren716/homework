def quadratic(fishes)
  fishes.each_with_index do |fish1, i|
    max_length = true
    fishes.each_with_index do |fish2, j|
      next if i == j
      max_length = false if fish2.length > fish1.length
    end
    return fish1 if max_length
  end
end

def linear(fishes)
  biggest_fish = fishes.first
  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end
  biggest_fish
end
