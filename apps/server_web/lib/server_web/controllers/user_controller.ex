defmodule ServerWeb.UserController do
  use Phoenix.Controller

  action_fallback ServerWeb.FallbackController

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- {:ok, %{id: id, name: "asap"}} do
      json(conn, user)
    end
  end
end
