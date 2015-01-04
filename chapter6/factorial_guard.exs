defmodule FactorialGuard do
  def of(0) do
    1
  end

  def of(n) when n > 0 do
    n * of(n-1)
  end
end

IO.puts FactorialGuard.of(-1)
