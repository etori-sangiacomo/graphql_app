defmodule GraphqlAppWeb.PageController do
  use GraphqlAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
