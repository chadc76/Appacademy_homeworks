require 'lru_cache'

describe LRUCache do 
  subject(:johnny_cache) { LRUCache.new(4)}

  describe "#initialize" do 
    it "sets the cache size" do 
      expect(johnny_cache.cache_size).to eq(4)
    end

    it "sets cache to empty array" do
      expect(johnny_cache.cache).to eq([])
    end
  end

  describe "#count" do
    it "should return the number of objects in cache" do 
      expect(johnny_cache.count).to eq(0)
      johnny_cache.add("I walk the line")
      johnny_cache.add(5)
      expect(johnny_cache.count).to eq(2)
      johnny_cache.add([1,2,3])
      johnny_cache.add(-5)
      expect(johnny_cache.count).to eq(4)
    end
  end

  describe "#add" do 

    context "when given a new object" do
      it "should add new object to end" do
        expect(johnny_cache.cache).to eq([])
        johnny_cache.add("I walk the line")
        expect(johnny_cache.cache).to eq(["I walk the line"])
        johnny_cache.add(5)
        johnny_cache.add([1,2,3])
        johnny_cache.add(-5)
        expect(johnny_cache.cache).to eq(["I walk the line", 5, [1,2,3], -5])
      end

      it "should never have a make count larger then cache_size" do
        expect(johnny_cache.count).to eq(0)
        johnny_cache.add("I walk the line")
        johnny_cache.add(5)
        johnny_cache.add([1,2,3])
        johnny_cache.add(-5)
        expect(johnny_cache.count).to eq(4)
        johnny_cache.add({a: 1, b: 2, c: 3})
        expect(johnny_cache.count).to eq(4)
      end

      context "when cache is at capacity" do 
        it "should remove the LRU object, and add new object to the end" do
          johnny_cache.add("I walk the line")
          johnny_cache.add(5)
          johnny_cache.add([1,2,3])
          johnny_cache.add(-5)
          johnny_cache.add({a: 1, b: 2, c: 3})
          expect(johnny_cache.cache).to eq([5, [1,2,3], -5, {a: 1, b: 2, c: 3} ])
        end
      end
    end

    context "when given an object already in cache" do 
      it "Should not add the object twice" do
        johnny_cache.add("I walk the line")
        johnny_cache.add(5)
        johnny_cache.add(5)
        expect(johnny_cache.cache.count(5)).to eq(1)
      end

      it "should move the object to the end of the cache" do
        johnny_cache.add("I walk the line")
        johnny_cache.add(5)
        johnny_cache.add([1,2,3])
        expect(johnny_cache.cache).to eq(["I walk the line", 5, [1,2,3]])
        johnny_cache.add(5)
        expect(johnny_cache.cache).to eq(["I walk the line",[1,2,3], 5])
      end
    end
  end

  describe "#show" do
    before(:each) do
      johnny_cache.add("I walk the line")
      johnny_cache.add(5)
      johnny_cache.add([1,2,3])
      johnny_cache.add(5)
      johnny_cache.add(-5)
      johnny_cache.add({a: 1, b: 2, c: 3})
      johnny_cache.add([1,2,3,4])
      johnny_cache.add("I walk the line")
      johnny_cache.add(:ring_of_fire)
      johnny_cache.add("I walk the line")
      johnny_cache.add({a: 1, b: 2, c: 3})
    end

    it "prints the array" do 
      expect(johnny_cache).to receive(:p).with(johnny_cache.cache)
      johnny_cache.show
    end

    it "shows the items in the cache, with the LRU item first" do
      expect(johnny_cache.cache).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
    end
  end
end