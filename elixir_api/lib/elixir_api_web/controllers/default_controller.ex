defmodule ElixirApiWeb.DefaultController do
  use ElixirApiWeb, :controller

  def index(conn, _params) do
    text conn, "The Elixir Api is live - #{Mix.env()}"
  end

end
