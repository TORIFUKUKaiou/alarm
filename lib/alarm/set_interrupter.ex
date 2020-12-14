defmodule Alarm.SetInterrupter do
  use GenServer

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    Circuits.GPIO.set_interrupts(Alarm.Button.gpio(), :both, receiver: Alarm.Observer)

    {:ok, state}
  end
end
