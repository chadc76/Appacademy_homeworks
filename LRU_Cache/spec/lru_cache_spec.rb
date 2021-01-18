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
end