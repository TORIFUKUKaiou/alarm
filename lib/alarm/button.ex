defmodule Alarm.Button do
  @pin 5

  def pin, do: @pin

  def gpio do
    {:ok, gpio} = Circuits.GPIO.open(@pin, :input)
    gpio
  end
end
