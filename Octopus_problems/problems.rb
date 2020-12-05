def biggest_fish(fish)
  biggest = ""
  fish.each do |f|
    biggest = f if f.length > biggest.length
  end
  biggest
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p biggest_fish(fish)

def sluggish_octopus(fish)
  biggest = fish.first
  fish.each do |f1|
    fish.each do |f2|
      biggest = f1 if f1.length >= f2.length && f1.length >= biggest.length
    end
  end
  biggest
end

p sluggish_octopus(fish)