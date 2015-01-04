defmodule Chop do
  def guess(actual, x..y) do
    guess(actual, div(x+y, 2), x..y)
  end

  def guess(actual, current, x..y) when actual == current do
    IO.puts "Is it #{current}"
    IO.puts actual
  end

  def guess(actual, current, x..y) when actual < current do
    IO.puts "Is it #{current}"
    guess(actual, div(x+current-1, 2), x..current-1)
  end

  def guess(actual, current, x..y) when actual > current do
    IO.puts "Is it #{current}"
    guess(actual, div(y+current+1, 2), current+1..y)
  end
end

Chop.guess(273, 1..1000)
