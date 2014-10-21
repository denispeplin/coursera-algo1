x = 10
{a: 2 ** (2 ** x), b: 2 ** (x ** 2), c: x*x*Math.log2(x), d: x, e: x ** (2 ** x)}.sort_by {|_key, value| value}.map(&:first).join('')
