# Converts any collection into a list:
list = Enum.to_list 1..5

# Concatenate collections:
Enum.concat([1,2,3], [4,5,6])

# Create collections using map
Enum.map(list, &(&1 * 10))

# Select elements by position
Enum.at(10..20, 3)

# Filter elements
Enum.filter(list, &Integer.is_even/1)

# Sort
Enum.sort ["a", "c", "b"]

# Split a collection
Enum.take (list, 3) # First 3 elements

# Join a collection into a string
Enum.join(list) # => "12345"

# Predicate operations
Enum.any?(list, &(&1 < 4))
Enum.member?(list, 4)

# Merge collections
Enum.with_index(["a", "b", "c"])
# => [{"a", 1}, {"b": 2}, {"c": 3}]

# Folding
Enum.reduce(1..100, &(&1+&2))
