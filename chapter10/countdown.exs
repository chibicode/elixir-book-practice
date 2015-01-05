defmodule Countdown do
  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd("say #{text}") end
  end

  def timer do
    Stream.resource(
      # Setup
      fn ->
        {_h, _m, s} = :erlang.time
        60 - s - 1 # Number of seconds to the start of the next minute
      end,
      # If there's still time left until the next minute,
      # Sleep for 1 second, yield count, and pass count - 1 to next
      fn
        0 ->
          {:halt, 0}
        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,
      # Teardown, but nothing to do
      fn _ -> end
    )
  end
end

counter = Countdown.timer
printer = counter |> Stream.each(&IO.puts/1)
speaker = printer |> Stream.each(&Countdown.say/1)

speaker |> Enum.take(5)
