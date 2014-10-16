class Array
  def merge_sort
    return self if length <= 1
    left = self[0, length/2].merge_sort
    right = self[length/2, length].merge_sort
    self.class.merge left, right
  end

  private

  def self.merge left, right
    result = []
    while left.length > 0 and right.length > 0
      result << if left[0] <= right[0]
        left.shift
      else
        right.shift
      end
    end
    result.concat(left).concat(right)
  end
end
