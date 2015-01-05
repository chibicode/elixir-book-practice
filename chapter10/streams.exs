squares = Stream.map [1, 2, 3, 4], &(&1 * &1)
plus_ones = Stream.map squares, &(&1 + 1)
odds = Stream.filter plus_ones, fn x -> rem(x, 2) == 1 end

# Intermediate lists are not computed.
IO.inspect Enum.to_list odds

# This would be super slow if we used a list.
IO.puts File.stream!("/usr/share/dict/words")
|> Enum.max_by(&String.length/1)

# Doesn't actually create a 10_000_000 element list, so it's fast.
IO.puts Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)

# Infinite streams
Stream.cycle(~w{ green white })
|> Stream.zip(1..5)
|> Enum.map(fn { class, value} -> ~s{<div class="#{class}">#{value}</div>\n} end)
|> IO.puts
# =>
# <div class="green">1</div>
# <div class="white">2</div>
# <div class="green">3</div>
# <div class="white">4</div>
# <div class="green">5</div>

# Infinite streams based on a function
Stream.repeatedly(fn -> true end)
|> Enum.take(3)
|> IO.inspect
# => [true, true, true]

# Infinite streams, from a base value
Stream.iterate(0, &(&1 + 1))
|> Enum.take(5)
|> IO.inspect

# Infinite streams using unfold
# - the first element becomes the output, and the second element
#   becomes the input to the next function
Stream.unfold({0, 1}, fn {f1, f2} -> {f2, f1+f2})
|> Enum.take(15)
|> IO.inspect

# Coverting a file into a stream
Stream.resource(
  # First, it opens a file and passes it into the second function
  fn -> File.open("sample") end,
  # At the end of the file, passes :halt
  fn file ->
    case IO.read(file, :line) do
      line when is_binary(line) -> {[line], file}
      _ -> {:halt, file)
    end
  end,
  # When :halt is passed, it closes
  fn file ->
    File.close!(file)
  end
)
