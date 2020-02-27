defmodule GalleryWeb.CounterLive do
  use Phoenix.LiveView
  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  def render(assigns) do
    ~L"""
      <labe>Counter: <%= @counter %></laber>
      <button phx-click="increment">+</button>
    """
  end

  def handle_event("increment", _event, socket) do
    socket = update(socket, :counter, &(&1 + 1))
    {:noreply, socket}
  end
end
