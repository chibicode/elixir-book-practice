# Iterating over a string
defmodule MyString do
  def each(str, func) do
    _each(String.next_codepoint(str), func)
  end

  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end

  defp _each(nil, _) do
  end
end

MyString.each "dog", fn c -> IO.puts c end
