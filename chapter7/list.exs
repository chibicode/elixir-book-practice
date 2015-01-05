# Concat
IO.inspect [1, 2, 3] ++ [4, 5, 6]

# Flatten
List.flatten([[1] , 2, [[[3]]]]) |> IO.inspect

# Folding
List.foldl([1, 2, 3], "", fn value, acc -> "#{value}(#{acc})" end) |> IO.inspect
