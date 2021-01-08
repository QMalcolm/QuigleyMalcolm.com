defmodule QuigleyMalcolm.SeedHelpers do
  def gen_blog_markdown_body do
    Enum.reduce(0..(1 + :rand.uniform(5)), "", fn (_, acc) ->
      acc
      |> Kernel.<>(String.duplicate("#", 1 + :rand.uniform(2)) <> " " <> Faker.Lorem.sentence() <> "\n\n")
      |> Kernel.<>(Faker.Lorem.paragraphs(:rand.uniform(5)) |> Enum.join("\n\n"))
      |> Kernel.<>("\n\n")
    end)
  end
end
