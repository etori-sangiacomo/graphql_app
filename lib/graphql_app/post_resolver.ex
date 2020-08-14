defmodule GraphqlApp.PostResolver do
  alias GraphqlApp.Blog

  def all(args, _info) do
    {:ok, Blog.list_posts(args[:last])}
  end
end
