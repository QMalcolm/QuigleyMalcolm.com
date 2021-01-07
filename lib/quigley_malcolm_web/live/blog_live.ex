defmodule QuigleyMalcolmWeb.BlogLive do
  use QuigleyMalcolmWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl
  def render(assigns) do
    ~L"""
      <h1>Hello there, this is my blog</h1>
    """
  end


end
