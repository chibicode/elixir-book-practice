defmodule Params do
  # This default will apply to all calls to the function
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "#{p2} with a list"
  end

  def func(p1, p2) do
    "#{p1} and #{p2}"
  end
end

IO.puts Params.func(99)
IO.puts Params.func(99, "cat")
IO.puts Params.func([99])
IO.puts Params.func([99], "dog")
