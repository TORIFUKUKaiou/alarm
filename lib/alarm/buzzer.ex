defmodule Alarm.Buzzer do
  @pin 16

  def start do
    Circuits.GPIO.write(gpio(), 1)
  end

  def stop do
    Circuits.GPIO.write(gpio(), 0)
  end

  def pin, do: @pin

  defp gpio do
    {:ok, gpio} = Circuits.GPIO.open(@pin, :output)
    gpio
  end
end
