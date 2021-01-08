# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     QuigleyMalcolm.Repo.insert!(%QuigleyMalcolm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias QuigleyMalcolm.Repo
alias QuigleyMalcolm.BlogPosts.BlogPost
alias QuigleyMalcolm.SeedHelpers

for _ <- 0..100 do
  BlogPost.changeset(
    %BlogPost{},
    %{title: Faker.Lorem.sentence, body: SeedHelpers.gen_blog_markdown_body()}
  ) |> Repo.insert!()
end
