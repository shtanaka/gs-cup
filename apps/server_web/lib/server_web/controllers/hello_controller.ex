defmodule ServerWeb.HelloController do
  use ServerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", user: "Stranger")
  end

  def show(conn, %{"user" => user}) do
    render(conn, "index.html", user: user)
  end
end
