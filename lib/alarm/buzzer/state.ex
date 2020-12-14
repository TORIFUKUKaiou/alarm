defmodule Alarm.Buzzer.State do
  use GenServer

  def start_link(_state) do
    GenServer.start_link(__MODULE__, false, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def toggle do
    GenServer.cast(__MODULE__, :toggle)
  end

  def handle_cast(:toggle, false) do
    Alarm.Buzzer.start()

    {:noreply, true}
  end

  def handle_cast(:toggle, true) do
    Alarm.Buzzer.stop()

    {:noreply, false}
  end
end
