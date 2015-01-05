nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Carey",
      last: "Ewes"
    },
    role: "farm boy"
  }
}

IO.inspect get_in(nested, [:buttercup, :actor])

authors = [
  %{name: "Jose", language: "Elixir"},
  %{name: "Matz", language: "Ruby"},
  %{name: "Larry", language: "Perl" }
]

# WTF???
languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect get_in(authors, [languages_with_an_r, :name])
