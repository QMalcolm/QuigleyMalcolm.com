defmodule QuigleyMalcolm.BlogPosts do
  @moduledoc """
  The BlogPosts context.
  """

  import Ecto.Query, warn: false
  alias QuigleyMalcolm.Repo

  alias QuigleyMalcolm.BlogPosts.BlogPost

  @doc """
  Returns the list of blog_post.

  ## Examples

      iex> list_blog_post()
      [%BlogPost{}, ...]

  """
  def list_blog_post do
    Repo.all(BlogPost)
  end

  @doc """
  Returns a list of blog_posts matching the given `criteria`.

  Example Criteria:

  [
   paginate: %{page: 2, per_page: 5},
   sort: %{sort_by: :item, sort_order: :asc}
  ]
  """

  def list_blog_posts(criteria) when is_list(criteria) do
    query = from(p in BlogPost)

    Enum.reduce(criteria, query, fn
      {:paginate, %{page: page, per_page: per_page}}, query ->
        from q in query,
          offset: ^((page - 1) * per_page),
          limit: ^per_page

      {:sort, %{sort_by: sort_by, sort_order: sort_order}}, query ->
        from q in query, order_by: [{^sort_order, ^sort_by}]
    end)
    |> Repo.all()
  end

  @doc """
  Gets a single blog_post by id.

  Raises `Ecto.NoResultsError` if the Blog post does not exist.

  ## Examples

      iex> get_blog_post!(123)
      %BlogPost{}

      iex> get_blog_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blog_post!(id), do: Repo.get!(BlogPost, id)

  @doc """
  Gets a single blog_post by slug.

  Raises `Ecto.NoResultsError` if the Blog post does not exist.

  ## Examples

      iex> get_blog_post!("this-is-a-slug")
      %BlogPost{}

      iex> get_blog_post!("non-existent-slug")
      ** (Ecto.NoResultsError)

  """
  def get_blog_post_by_slug(slug), do: Repo.get_by(BlogPost, slug: slug)

  @doc """
  Creates a blog_post.

  ## Examples

      iex> create_blog_post(%{field: value})
      {:ok, %BlogPost{}}

      iex> create_blog_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blog_post(attrs \\ %{}) do
    %BlogPost{}
    |> BlogPost.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blog_post.

  ## Examples

      iex> update_blog_post(blog_post, %{field: new_value})
      {:ok, %BlogPost{}}

      iex> update_blog_post(blog_post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blog_post(%BlogPost{} = blog_post, attrs) do
    blog_post
    |> BlogPost.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog_post.

  ## Examples

      iex> delete_blog_post(blog_post)
      {:ok, %BlogPost{}}

      iex> delete_blog_post(blog_post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blog_post(%BlogPost{} = blog_post) do
    Repo.delete(blog_post)
  end

  @doc """
  Count how many blog_posts there are.

  ## Examples

    iex> count_blog_posts()
    15

  """
  def count_blog_posts do
    Repo.one(from p in BlogPost, select: count(p.id))
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blog_post changes.

  ## Examples

      iex> change_blog_post(blog_post)
      %Ecto.Changeset{data: %BlogPost{}}

  """
  def change_blog_post(%BlogPost{} = blog_post, attrs \\ %{}) do
    BlogPost.changeset(blog_post, attrs)
  end
end
