defmodule GalleryWeb.GalleryLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :current_id, Gallery.first_id())}
  end

  def render(assigns) do
    ~L"""
    <label>Image id: <%= @current_id %></label>
    <button phx-click="prev">Prev</button>
    <button phx-click="next">Next</button>

    <img src="<%= Gallery.large_url(@current_id) %>">
    """
  end

  def handle_event("prev", _, socket) do
    {:noreply, assign_prev_id(socket)}
  end

  def handle_event("next", _, socket) do
    {:noreply, assign_next_id(socket)}
  end

  def assign_prev_id(socket) do
    assign(socket, :current_id,
      Gallery.prev_image_id(socket.assigns.current_id))
  end

  def assign_next_id(socket) do
    assign(socket, :current_id,
      Gallery.next_image_id(socket.assigns.current_id))
  end
end
