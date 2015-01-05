defmodule MyList do
  def len([]) do
    0
  end

  # Use _ in front of a variable name to turn off the warning
  def len([_head|tail]) do
    1 + len(tail)
  end

  def map([], _func) do
    []
  end

  def map([head|tail], func) do
    [func.(head)|map(tail, func)]
  end

  def sum(list) do
    _sum(list, 0)
  end

  # Tail recursion using a private helper
  defp _sum([], total) do
    total
  end

  defp _sum([head|tail], total) do
    _sum(tail, head+total)
  end

  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
end

IO.puts MyList.len([1,2,3,4,5])
IO.inspect MyList.map([1,2,3,4,5], &(&1 * &1))
IO.puts MyList.sum([1,2,3,4,5])
IO.puts MyList.reduce([1,2,3,4,5], 1, &(&1 * &2))
