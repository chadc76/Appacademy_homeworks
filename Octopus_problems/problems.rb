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

def dominant_octopus(fish)
  merge_sort(fish).last
end

def merge_sort(fish)
  return fish if fish.length <= 1
  mid = fish.length / 2
  fish_merge(
      merge_sort(fish.take(mid)),
      merge_sort(fish.drop(mid))
  )
end

def fish_merge(left, right)
  merged_array = []
  prc = Proc.new { |fish1, fish2| fish1.length <=> fish2.length }
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1 
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end
  merged_array + left + right
end

p dominant_octopus(fish)