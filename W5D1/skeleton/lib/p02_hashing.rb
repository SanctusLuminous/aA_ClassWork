class Integer
  # Integer#hash already implemented for you


end

class Array
  def hash
    num = 0
    self.each_with_index do |ele,idx| 
      num += ele.hash * idx
    # each_with_index.inject(0) do |intermediate_hash, (el, i)|
    #   (el.hash + i.hash) ^ intermediate_hash
    end
    return num

  end
end

class String
  def hash
    alpha = ("a".."z").to_a + ("A".."Z").to_a
    num = 0
    self.each_char.with_index do |char,idx| 
        num += alpha.index(char) *idx
    end
    return num
  end
end

#chars.map(&:ord).hash

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
      to_a.sort_by(&:hash).hash
  end
end
