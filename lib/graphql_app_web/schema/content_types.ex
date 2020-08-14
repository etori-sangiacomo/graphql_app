defmodule GraphqlAppWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: GraphqlApp.Repo

  object :post do
    field(:id, :id)
    field(:title, :string)
    field(:body, :string)
    field(:author, :user, resolve: assoc(:user))
  end
end
