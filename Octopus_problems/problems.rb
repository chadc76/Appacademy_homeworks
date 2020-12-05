def biggest_fish(fish)
  biggest = ""
  fish.each do |f|
    biggest = f if f.length > biggest.length
  end
  biggest
end

fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

p biggest_fish(fish)