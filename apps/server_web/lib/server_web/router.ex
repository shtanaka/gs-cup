defmodule ServerWeb.Router do
  use ServerWeb, :router

  def put_headers(conn, key_values) do
    Enum.reduce(
      key_values,
      conn, 
      fn {k, v}, conn ->
        Plug.Conn.put_resp_header(conn, to_string(k), v)
      end
    )
  end

  pipeline :browser do
    plug :put_headers, %{ping: "pong"}
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ServerWeb do
    pipe_through :browser

    get "/hello", HelloController, :index
    get "/hello/:user", HelloController, :show
  end

  scope "/api", ServerWeb do
    pipe_through :api

    resources "/users", UserController, only: [:show, :new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ServerWeb do
  #   pipe_through :api
  # end
end
