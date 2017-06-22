# returns a slice of n, between digits i and j
function get_slice(n, i, j)
  return convert( UInt128,
    floor((n / 10^((floor(log10(n)) + 1)-j) % 10^(j-i+1)))
  )
end

# returns number of digits of n
function num_digits(n)
  return floor(log10(n) + 1)
end

#returns the kaprekar numbers in the range of min to max
function kaprekar(min, max)
  space = [n for n ∈ min:max]
  kaprekar_nums = Int[1]
  for n ∈ space
    n2 = n^2
    digits = num_digits(n2)
    for d = 1:digits
      first_slice = get_slice(n2, 1, d)
      second_slice = get_slice(n2, d+1, digits)
      if(first_slice + second_slice == n && second_slice != 0)
        push!(kaprekar_nums, n)
      end
    end
  end
  return kaprekar_nums
end
