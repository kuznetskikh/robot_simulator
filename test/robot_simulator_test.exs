defmodule RobotSimulatorTest do
  use ExUnit.Case
  doctest RobotSimulator

  test "simulate case 1" do
    assert RobotSimulator.simulate("raalal", {"n", 7, 3}) === {"w", 9, 4}
  end

  test "simulate case 2" do
    assert RobotSimulator.simulate("lalala", {"s", 1, 2}) === {"w", 1, 3}
  end

  test "simulate case 3" do
    assert RobotSimulator.simulate("larrrallr", {"w", 7, 6}) === {"n", 8, 5}
  end
end
