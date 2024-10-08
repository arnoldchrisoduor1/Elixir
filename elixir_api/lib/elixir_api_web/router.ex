defmodule ElixirApiWeb.Router do
  use ElixirApiWeb, :router
  use Plug.ErrorHandler

  defp  handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug ElixirApiWeb.Auth.Pipeline
    plug ElixirApiWeb.Auth.SetAccount
  end

  scope "/api", ElixirApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create # endpoint to create an account
    post "/accounts/sign_in", AccountController, :sign_in
  end

  scope "/api", ElixirApiWeb do
    pipe_through [:api, :auth]
    get "/accounts/by_id/:id", AccountController, :show
    get "/accounts/sign_out", AccountController, :sign_out
    get "/accounts/refresh_session", AccountController, :refresh_session
    post "/accounts/update", AccountController, :update
  end
end
