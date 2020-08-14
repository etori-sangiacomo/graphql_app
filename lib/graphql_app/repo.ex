defmodule GraphqlApp.Repo do
  use Ecto.Repo,
    otp_app: :graphql_app,
    adapter: Ecto.Adapters.Postgres
end
