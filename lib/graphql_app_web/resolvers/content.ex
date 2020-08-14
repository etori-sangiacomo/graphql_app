defmodule GraphqlAppWeb.Resolvers.Content do
  alias GraphqlApp.Blog

  def list_posts(%GraphqlApp.Accounts.User{} = author, args, _resolution) do
    {:ok, Blog.list_posts(author, args)}
  end

  def list_posts(_parent, args, _resolution) do
    {:ok,Blog.list_posts(args[:limit])}
  end
end
