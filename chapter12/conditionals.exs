defmodule FizzBuzz1 do
  def upto(n) when n > 0 do
    _upto(1, n, [])
  end

  defp _upto(_current, 0, result) do
    # We keep appending result to head, so we have to reverse at the end.
    # This is a very *common* pattern.
    Enum.reverse(result)
  end

  defp _upto(current, left, result) do
    next_answer =
      cond do
        rem(current, 3) == 0 and rem(current, 5) == 0 ->
          "FizzBuzz"
        rem(current, 3) == 0 ->
          "Fizz"
        rem(current, 5) == 0 ->
          "Buzz"
        true ->
          current
      end
    _upto(current+1, left-1, [next_answer | result])
  end
end

IO.inspect FizzBuzz1.upto(20)

# FizzBuzz can be thought of as a map function
defmodule FizzBuzz2 do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) do
    cond do
      rem(n, 3) == 0 and rem(n, 5) == 0 ->
        "FizzBuzz"
      rem(n, 3) == 0 ->
        "Fizz"
      rem(n, 5) == 0 ->
        "Buzz"
      true ->
        n
    end
  end
end

# You probably should use when instead of cond though, it's cleaner:
defmodule FizzBuzz3 do
  def upto(n) when n > 0 do
    1..n |> Enum.map(&fizzbuzz/1)
  end

  defp fizzbuzz(n) when rem(n, 3) == 0 and rem(n, 5) == 0, do: "FizzBuzz"
  defp fizzbuzz(n) when rem(n, 3) == 0, do: "FizzBuzz"
  defp fizzbuzz(n) when rem(n, 5) == 0, do: "FizzBuzz"
  defp fizzbuzz(n), do: "FizzBuzz"
end

# Case statements
defmodule Bouncer do
  dave = %{ name: "Dave", age: 27 }
  case dave do
    person = %{ age: age } when is_number(age) and age >= 21 ->
      IO.puts "Enter the foo bar, #{person.name}"
    _ ->
      IO.puts "Sorry, no admission"
  end
end
