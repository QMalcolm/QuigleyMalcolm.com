defmodule QuigleyMalcolm.BlogPosts.BlogPost do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blog_post" do
    field :body, :string
    field :slug, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(blog_post, attrs) do
    blog_post
    |> cast(attrs, [:title, :body])
    |> put_change(:slug, Slugger.slugify_downcase(attrs[:title] || ""))
    |> validate_required([:title, :slug, :body])
  end
end
