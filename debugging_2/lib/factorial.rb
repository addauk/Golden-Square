def factorial(n)
  product = 1
  while n > 0
    product *= n
    n -= 1
    #binding.irb # Mystery new line!
  end
  product
end

# 5*4*3*2*1 120
p factorial(5)