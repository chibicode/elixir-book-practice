defmodule Factorial do
  def of(0) do
    1
  end

  def of(n) do
    n * of(n-1)
  end
end

IO.puts Factorial.of(3)

# Module names are just atoms
IO.puts :"Elixir.Factorial".of(5)
