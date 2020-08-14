defmodule GraphqlAppWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: GraphqlApp.Repo

  object :user do
    field(:id, :id)
    field(:name, :string)
    field(:email, :string)
    # field(:posts, list_of(:post), resolve: assoc(:posts))
    field :posts, list_of(:post) do
      arg :limit, :integer
      resolve &GraphqlAppWeb.Resolvers.Content.list_posts/3
    end
  end
end
