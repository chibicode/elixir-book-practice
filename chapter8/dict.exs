defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

# Converts a list of keyword tuples into a hashdict, and sums it
hd = [ one: 1, two: 2, three: 3] |> Enum.into HashDict.new
IO.puts Sum.values(hd)

map = %{ four: 4, five: 5, six: 6 }
IO.puts Sum.values(map)

# Three different dictionary data structures:
kw_list = [ name: "Dave", likes: "Programming", where: "Dallas" ]
hashdict = Enum.into kw_list, HashDict.new
map = Enum.into kw_list, Map.new

IO.puts kw_list[:name]
IO.puts hashdict[:name]
IO.puts map[:name]

# Pattern matching on a map
person = %{ name: "Dave", height: 1.88 }
%{ name: a_name } = person
IO.puts a_name

people = [
  %{ name: "Grumpy", height: 1.24 },
  %{ name: "Dave",   height: 1.88 },
  %{ name: "Ed",   height: 1.68 },
]

# List comprehension
for person = %{ height: height } <- people, height > 1.5 do
  IO.inspect person
end

# Using `when` matching
defmodule HotelRoom do
  def book(%{name: name, height: height})
  when height > 1.8 do
    IO.puts "Need an extra long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts "Needs low shower control for #{name}"
  end

  def book(person) do
    IO.puts "Needs regular bed for #{person.name}"
  end
end

people |> Enum.each(&HotelRoom.book/1) # Use & to get a reference

# Pattern matching can't match keys
%{ 2 => state } = %{ 1 => :ok, 2 => :error }
IO.puts state #=> :error
# This doesn't work - item is a key, and it can't bind a value to a key
# %{ item => :ok } = %{ 1 => :ok, 2 => :error }

# Updating a map
m = %{ a: 1, b: 2, c: 3 }
m1 = %{ m | b: "two" } # NOTE: This syntax can't be used to add a new key. Use Dict.put_new/3 instead
