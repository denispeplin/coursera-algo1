class Array
  attr_reader :comparisons

  def quicksort!(left = 0, right = self.size - 1)
    @comparisons = 0 if left == 0 and right == self.size - 1
    if left < right
      @comparisons += right - left
      pivot_index = choose_median left, right
      pivot = self[pivot_index]
      swap left, pivot_index
      i = left + 1
      (i..right).each do |j|
        if self[j] < pivot
          swap i, j
          i += 1
        end
      end
      swap left, i - 1
      quicksort! left, i - 2
      quicksort! i, right
    end
    self
  end

  def swap(index1, index2)
    self[index1], self[index2] = [self[index2], self[index1]]
  end

  def choose_median(left, right)
    middle = left + (right - left) / 2
    candidates = {self[left] => left, self[middle] => middle, self[right] => right}
    candidates.sort[1][1]
  end
end
