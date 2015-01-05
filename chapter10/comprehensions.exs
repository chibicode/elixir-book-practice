result = for x <- [1, 2, 3, 4, 5], do: x * x
IO.inspect result
result = for x <- [1, 2, 3, 4, 5], x < 4, do: x * x
IO.inspect result

# If we have two generators, their operations are nested
result = for x <- [1, 2], y <- [5, 6], do: x * y
IO.inspect result

# Filter demo
first8 = [1, 2, 3, 4, 5, 6, 7, 8]
IO.inspect for x <- first8, y <- first8, x >= y, rem(x*y, 10) == 0, do: {x, y}

# Receive the value from a comprehension
IO.inspect for x <- ~w{ cat dog }, into: Map.new, do: { x, String.upcase(x) }
