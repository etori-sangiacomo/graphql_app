require IEx

defmodule GraphqlAppWeb.Resolvers.Accounts do
  alias GraphqlApp.Repo
  alias GraphqlApp.Accounts.User

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def find(parent, args = %{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, info) do
    IEx.pry()
  end
end
