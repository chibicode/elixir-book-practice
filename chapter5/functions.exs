sum = fn a, b -> a + b end
IO.puts sum.(1, 2)

swap = fn {a, b} -> {b, a} end
IO.inspect swap.({6, 8})

list_concat = fn l1, l2 -> l1 ++ l2 end
IO.inspect list_concat.([:a, :b], [:c, :d])

sum = fn a, b, c -> a + b + c end
IO.puts sum.(1, 2, 3)

pair_tuple_to_list = fn {t1, t2} -> [t1, t2] end
IO.inspect pair_tuple_to_list.({1234, 5678})

handle_open = fn
  {:ok, file} -> "Read data: #{IO.read(file, :line)}"
  # :file refers to Erlang (not Elixir)'s file object
  {_, error} -> "Error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("../chapter1/hello.exs"))
IO.puts handle_open.(File.open("../chapter1/hello"))

fizzbuz = fn
  0, 0, _ -> "FizzBuz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

IO.puts fizzbuz.(0, 0, 3)
IO.puts fizzbuz.(0, 3, 3)
IO.puts fizzbuz.(3, 0, 3)
IO.puts fizzbuz.(3, 3, 3)

greeter = fn
  name -> fn
    -> "Hello #{name}"
  end
end

dave_greeter = greeter.("Dave")
IO.puts dave_greeter.()

# Closures
add_n = fn
  n -> fn
    other -> n + other
  end
end

add_two = add_n.(2)
IO.puts add_two.(3)

prefix = fn
  prefix_str -> fn
    str -> prefix_str <> " " <> str
  end
end

IO.puts prefix.("Elixir").("Rocks")

# Passing functions
times_2 = fn n -> n * 2 end
apply = fn fun, value -> fun.(value) end

IO.puts apply.(times_2, 6)
IO.inspect Enum.map [2, 3], fn elem -> elem * 2 end

# & helper for quickly creating an anonymous function
add = &(&1 + &2)
IO.puts add.(3, 5)

# & helper that uses a tuple syntax
divrem = &{div(&1, &2), rem(&1, &2)}
IO.inspect divrem.(13, 5)

# Reference to an existing function
l = &length/1
IO.puts l.([1, 3, 5,7])

IO.inspect Enum.map [1,2,3,4], &(&1 < 3)
