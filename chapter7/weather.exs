defmodule WeatherHistory do
  def for_location_27([], target_loc) do
    []
  end

  # Bind head 
  def for_location_27([head = [_, target_loc, _, _] | tail], target_loc) do
    [head | for_location_27(tail, target_loc)]
  end

  def for_location_27([_ | tail], target_loc) do
    for_location_27(tail, target_loc)
  end
end
