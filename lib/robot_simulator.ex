defmodule RobotSimulator do
  @moduledoc """
    Handles inputs instructions in format `"raalal", {"n", 7, 3}`
    (`l` - turn to left, `r` - turn to right, `n` - cardinal direction,
    `7` and `3` - start x and y coordinates) by moving from start to end
    point.
  """

  defp turn(direction, "r" = _instruction) do
    case direction do
      "n" -> "e"
      "e" -> "s"
      "s" -> "w"
      "w" -> "n"
    end
  end

  defp turn(direction, "l" = _instruction) do
    case direction do
      "n" -> "w"
      "e" -> "n"
      "s" -> "e"
      "w" -> "s"
    end
  end

  defp advance({direction, x, y} = _position) do
    case direction do
      "n" -> {x, y + 1}
      "e" -> {x + 1, y}
      "s" -> {x, y - 1}
      "w" -> {x - 1, y}
    end
  end

  defp move([] = _instructions, position) do
    position
  end

  defp move([head | tail] = _instructions, {direction, x, y} = position) do
    case head do
      "r" ->
        move(tail, {turn(direction, "r"), x, y})

      "l" ->
        move(tail, {turn(direction, "l"), x, y})

      "a" ->
        {x, y} = advance(position)
        move(tail, {direction, x, y})
    end
  end

  def simulate(instructions, position) do
    move(String.graphemes(instructions), position)
  end
end
