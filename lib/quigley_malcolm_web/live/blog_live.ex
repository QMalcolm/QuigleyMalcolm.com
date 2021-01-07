defmodule QuigleyMalcolmWeb.BlogLive do
  use QuigleyMalcolmWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Hello there, this is my blog</h1>
    """
  end


end
