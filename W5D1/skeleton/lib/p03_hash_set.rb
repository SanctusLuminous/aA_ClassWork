class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return self[key.hash] << key if !self[key.hash].include?(key)
    @count += 1

    resize! if @count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return nil unless self[key.hash].include?(key)
    self[key.hash].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
