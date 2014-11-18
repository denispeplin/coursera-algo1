require 'pp'

list_strings = File.readlines('kargerMinCut.txt').map(&:chomp).
  map{|v| v.split(' ', 2)}

attempts = list_strings.size

mincut = attempts

(0..attempts).each do |attempt|
  list_array = list_strings.map{|l| [l[0].to_i, l[1].split.map(&:to_i)]}
  list = Hash[list_array]
  while list.keys.size > 2 do
    n1 = list.keys.sample
    e1 = list[n1]
    n2 = e1.sample
    e2 = list[n2]
    e2.each do |p|
  	  list[p] = list[p].map{|n| n == n2 ? n1 : n}
    end

    list[n1] = e1.concat(e2).delete_if{|n| n == n1 or n == n2}
    list.delete n2
  end
  result = list[n1].size
  mincut = result if mincut > result
  puts "#{attempt}: #{mincut}"
end
