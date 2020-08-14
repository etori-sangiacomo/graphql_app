defmodule GraphqlAppWeb.Schema do
  use Absinthe.Schema
  import_types Absinthe.Type.Custom
  import_types(GraphqlAppWeb.Schema.AccountTypes)
  import_types(GraphqlAppWeb.Schema.ContentTypes)

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      arg(:limit, :integer)
      resolve &GraphqlAppWeb.Resolvers.Content.list_posts/3
    end

    @desc "Get a user of the blog"
    field :user, :user do
      arg :id, non_null(:id)
      resolve &GraphqlAppWeb.Resolvers.Accounts.find/3
    end

    field :users, list_of(:user) do
      resolve(&GraphqlAppWeb.Resolvers.Accounts.all/2)
    end
  end

  mutation do
    field :create_user, type: :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))
      resolve(&GraphqlAppWeb.Resolvers.Accounts.create/2)
    end
  end
end
