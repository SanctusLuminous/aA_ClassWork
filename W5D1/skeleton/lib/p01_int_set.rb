class MaxIntSet

  attr_accessor :store;

  def initialize(max)
    @max = max 
    @store = Array.new(max,false) 

  end

  def insert(num)
    if is_valid?(num)
     
      @store[num] = true 
     # return true
    end
    # return true
  end

  def remove(num)
    return @store[num] = false if is_valid?(num)
  end

  def include?(num)
    if is_valid?(num)
       @store[num] == true
    end
    
  end

  private

  def is_valid?(num)
    if !num.between?(0,@max)
      raise "Out of bounds" 
    else 
      return true
    end


  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end
  def insert(num)
    if !self.include?(num)
      @store[num % num_buckets] << num
    end
  end
  def remove(num)
    @store[num % num_buckets].delete(num)
  end
  def include?(num)
    @store[num % num_buckets].include?(num)
  end
  private
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
     if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
    if @count > num_buckets
      resize!    
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    empty_elements = []
    @store.each {|bucket| empty_elements += bucket}
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    empty_elements.each {|ele| self.insert(ele)}
  end
end
