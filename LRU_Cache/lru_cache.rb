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
    delete_lru if self.count == cache_size && !cache.include?(el)
    remove_el(el) if cache.include?(el)
    @cache << el
    true
  end
  
  def show
    # shows the items in the cache, with the LRU item first
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