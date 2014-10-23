class Array
  class << self
    attr_accessor :inversions
  end

  def inversions
    self.class.inversions = 0
    self.merge_sort
    self.class.inversions
  end

  protected

  def merge_sort
    return self if self.size <= 1

    left = self.slice(0, (self.size / 2).round)
    right = self.slice((self.size / 2).round, self.size)
    self.class.merge_count left.merge_sort, right.merge_sort
  end

  def self.merge_count(left, right)
    a = []
    while !left.empty? and !right.empty?
      if left.first < right.first
         a << left.shift
      else
         a << right.shift
        @inversions += left.size
      end
    end
    a + left + right
  end
end