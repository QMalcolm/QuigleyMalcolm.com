defmodule QuigleyMalcolmWeb.BlogPostLive do
  use QuigleyMalcolmWeb, :live_view

  alias QuigleyMalcolm.BlogPosts

  def mount(%{"slug" => slug}, _session, socket) do
    blog_post = BlogPosts.get_blog_post_by_slug(slug)
    socket = assign(
      socket,
      blog_post: blog_post,
      page_title: blog_post.title
    )
    {:ok, socket }
  end

  def render(assigns) do
    ~L"""
      <h1><%= @blog_post.title %></h1>
      <%= raw(Earmark.as_html!(@blog_post.body)) %>
    """
  end
end
