load './quick.rb'
puts File.readlines('QuickSort.txt').map(&:chomp).map(&:to_i).quicksort!.comparisons

load './quick-right.rb'
puts File.readlines('QuickSort.txt').map(&:chomp).map(&:to_i).quicksort!.comparisons

load './quick-median.rb'
puts File.readlines('QuickSort.txt').map(&:chomp).map(&:to_i).quicksort!.comparisons