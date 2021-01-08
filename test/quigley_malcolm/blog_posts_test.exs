defmodule QuigleyMalcolm.BlogPostsTest do
  use QuigleyMalcolm.DataCase

  alias QuigleyMalcolm.BlogPosts

  describe "blog_post" do
    alias QuigleyMalcolm.BlogPosts.BlogPost

    @valid_attrs %{body: "some body", slug: "some slug", title: "some title"}
    @update_attrs %{body: "some updated body", slug: "some updated slug", title: "some updated title"}
    @invalid_attrs %{body: nil, slug: nil, title: nil}

    def blog_post_fixture(attrs \\ %{}) do
      {:ok, blog_post} =
        attrs
        |> Enum.into(@valid_attrs)
        |> BlogPosts.create_blog_post()

      blog_post
    end

    test "list_blog_post/0 returns all blog_post" do
      blog_post = blog_post_fixture()
      assert BlogPosts.list_blog_post() == [blog_post]
    end

    test "get_blog_post!/1 returns the blog_post with given id" do
      blog_post = blog_post_fixture()
      assert BlogPosts.get_blog_post!(blog_post.id) == blog_post
    end

    test "create_blog_post/1 with valid data creates a blog_post" do
      assert {:ok, %BlogPost{} = blog_post} = BlogPosts.create_blog_post(@valid_attrs)
      assert blog_post.body == "some body"
      assert blog_post.slug == "some-title"
      assert blog_post.title == "some title"
    end

    test "create_blog_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BlogPosts.create_blog_post(@invalid_attrs)
    end

    test "update_blog_post/2 with valid data updates the blog_post" do
      blog_post = blog_post_fixture()
      assert {:ok, %BlogPost{} = blog_post} = BlogPosts.update_blog_post(blog_post, @update_attrs)
      assert blog_post.body == "some updated body"
      assert blog_post.slug == "some-updated-title"
      assert blog_post.title == "some updated title"
    end

    test "update_blog_post/2 with invalid data returns error changeset" do
      blog_post = blog_post_fixture()
      assert {:error, %Ecto.Changeset{}} = BlogPosts.update_blog_post(blog_post, @invalid_attrs)
      assert blog_post == BlogPosts.get_blog_post!(blog_post.id)
    end

    test "delete_blog_post/1 deletes the blog_post" do
      blog_post = blog_post_fixture()
      assert {:ok, %BlogPost{}} = BlogPosts.delete_blog_post(blog_post)
      assert_raise Ecto.NoResultsError, fn -> BlogPosts.get_blog_post!(blog_post.id) end
    end

    test "change_blog_post/1 returns a blog_post changeset" do
      blog_post = blog_post_fixture()
      assert %Ecto.Changeset{} = BlogPosts.change_blog_post(blog_post)
    end
  end
end
