defmodule GraphqlApp.Schema do
  use Absinthe.Schema
  import_types(GraphqlApp.Schema.Types)

  query do
    field :posts, list_of(:post) do
      arg(:last, :integer)
      resolve(&GraphqlApp.PostResolver.all/2)
    end

    field :user, type: :user do
      arg(:id, non_null(:id))
      resolve(&GraphqlApp.UserResolver.find/2)
    end

    field :users, list_of(:user) do
      resolve(&GraphqlApp.UserResolver.all/2)
    end
  end

  mutation do
    field :create_user, type: :user do
      arg(:name, non_null(:string))
      arg(:email, non_null(:string))
      resolve(&GraphqlApp.UserResolver.create/2)
    end
  end
end
