class LRUCache
  
  attr_reader :cache_size, :cache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end
  
  def count
    # returns number of elements currently in cache
    @cache.count
  end
  
  def add(el)
    # adds element to cache according to LRU principle
    if cache.include?(el)
      remove_el(el)
      @cache << el
    elsif self.count == cache_size 
      delete_lru
      @cache << el
    else
      @cache << el
    end
  end
  
  def show
    # shows the items in the cache, with the LRU item first
    p cache
  end
  
  private
  # helper methods go here!

  def delete_lru
    @cache.shift
  end

  def remove_el(el)
    @cache.delete(el)
  end
  
end

# This isn't the typical way to implement an LRU Cache because it take O(n) time to add an object
# and for deleting an object, because it takes that time to find the object in the array.

# The biggest way to improve the efficincy is to use a HAshmap and Linked list combination