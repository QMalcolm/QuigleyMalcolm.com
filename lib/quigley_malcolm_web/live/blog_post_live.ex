defmodule QuigleyMalcolmWeb.BlogPostLive do
  use QuigleyMalcolmWeb, :live_view

  def mount(%{"slug" => slug}, _session, socket) do
    socket = assign(socket, :slug, slug)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>The slug is <%= @slug %></h1>
    """
  end
end
