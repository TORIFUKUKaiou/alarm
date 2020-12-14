defmodule Alarm.Observer do
  use GenServer

  require Logger

  @button_pin Alarm.Button.pin()

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_info({:circuits_gpio, @button_pin, _timestamp, 1}, state) do
    Logger.debug("Received rising event on pin #{@button_pin}")
    Alarm.Buzzer.State.toggle()
    {:noreply, state}
  end

  def handle_info({:circuits_gpio, @button_pin, _timestamp, 0}, state) do
    Logger.debug("Received falling event on pin #{@button_pin}")
    {:noreply, state}
  end
end
