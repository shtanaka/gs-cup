defmodule ServerWeb.UserController do
  use ServerWeb, :controller

  def show(conn, _params) do
    render(conn, "index.html", user: "Stranger")
  end
end
