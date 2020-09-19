class Map
  attr_reader :map
  def initialize
    @map = []
  end

  def set(key, value)
    if self.include?(key)
      new_map = map.map do |pair|
      pair[0] == key ?  [key, value] : pair
      end
      @map = new_map
    else
      map << [key, value]
    end
  end

  def get(key)
    return false if !self.include?(key)
    map.each{|pair| return pair[1] if pair[0] == key}
  end

  def delete(key)
    return false if !self.include?(key)
    map.delete_if{|pair| pair[0] == key}
    map
  end

  def show
    p map
  end

  def include?(key)
    map.each do |pair|
      return true if pair[0] == key
    end
    false
  end
end