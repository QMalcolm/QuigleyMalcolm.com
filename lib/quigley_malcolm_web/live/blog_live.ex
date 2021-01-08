defmodule QuigleyMalcolmWeb.BlogLive do
  use QuigleyMalcolmWeb, :live_view

  alias QuigleyMalcolm.BlogPosts

  def mount(_params, _session, socket) do
    num_blog_posts = BlogPosts.count_blog_posts()
    socket = assign(socket, :num_blog_posts, num_blog_posts)
    {:ok, socket, temporary_assigns: [blog_posts: []]}
  end

  def handle_params(params, _url, socket) do
    page = String.to_integer(params["page"] || "1")
    per_page = String.to_integer(params["per_page"] || "5")

    paginate_options = %{page: page, per_page: per_page}
    blog_posts = BlogPosts.list_blog_posts(paginate: paginate_options)

    socket =
      assign(socket,
        options: paginate_options,
        blog_posts: blog_posts
      )

    {:noreply, socket}
  end

  def render(assigns) do
    ~L"""
      <h1>Hello there, this is my blog</h1>
      <div>Showing <%= ((@options.page - 1) * 5) + 1 %> - <%= (@options.page * 5)%> of <%= @num_blog_posts %></div>
      <%= for post <- @blog_posts do %>
        <div>
          <%= live_redirect post.title,
            to: Routes.live_path(
              @socket,
              QuigleyMalcolmWeb.BlogPostLive,
              post.slug)
          %>
        </div>
      <% end %>
      <%= pagination_link(
        @socket,
        "Previous",
        @options.page - 1,
        @options.per_page) %>
      <%= pagination_link(
        @socket,
        "Next",
        @options.page + 1,
        @options.per_page) %>
    """
  end

  defp pagination_link(socket, text, page, per_page, class \\ "") do
    live_patch(
      text,
      to:
        Routes.live_path(
          socket,
          __MODULE__,
          page: page,
          per_page: per_page
        ),
      class: class
    )
  end
end
