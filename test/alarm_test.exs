defmodule AlarmTest do
  use ExUnit.Case
  doctest Alarm

  test "greets the world" do
    assert Alarm.hello() == :world
  end
end
