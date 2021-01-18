require 'lru_cache'

describe LRUCache do 
  subject(:johnny_cache) { LRUCache.new(4)}

  describe "initialize" do 
    it "sets the cache size" do 
      expect(johnny_cache.cache_size).to eq(4)
    end

    it "sets cache to empty array" do
      expect(johnny_cache.cache).to eq([])
    end
  end

  describe "count" do
    it "should return the number of objects in cache" do 
      expect(johnny_cache.count).to eq(0)
      johnny_cache.add(5)
      expect(johnny_cache.count).to eq(1)
      johnny_cache.add(1)
      johnny_cache.add(2)
      johnny_cache.add(3)
      johnny_cache.add(4)
      expect(johnny_cache.count).to eq(4)
    end
  end
end