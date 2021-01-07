defmodule QuigleyMalcolm.Repo.Migrations.CreateBlogPost do
  use Ecto.Migration

  def change do
    create table(:blog_post) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :body, :string, size: 8192, null: false

      timestamps()
    end

  end
end
