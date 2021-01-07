defmodule QuigleyMalcolm.Repo.Migrations.CreateBlogPost do
  use Ecto.Migration

  def change do
    create table(:blog_post) do
      add :title, :string
      add :slug, :string
      add :body, :string

      timestamps()
    end

  end
end
