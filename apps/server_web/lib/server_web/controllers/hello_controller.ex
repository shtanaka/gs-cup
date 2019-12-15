defmodule ServerWeb.HelloController do
  use ServerWeb, :controller
  plug :assign_welcome_message, "Hello Stranger!"

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"user" => user}) do
    conn
    |> assign(:message, "Hello #{user}! Welcome to gs-cup")
    |> render("index.html")
  end

  defp assign_welcome_message(conn, message) do
    assign(conn, :message, message)
  end
end
