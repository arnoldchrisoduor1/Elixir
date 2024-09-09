defmodule ElixirApiWeb.AccountJSON do
  alias ElixirApi.Accounts.Account
  alias ElixirApiWeb.{AccountView, UserView}

  @doc """
  Renders a list of accounts.
  """
  def index(%{accounts: accounts}) do
    %{data: for(account <- accounts, do: data(account))}
  end

  @doc """
  Renders a single account.
  """
  def show(%{account: account}) do
    %{data: data(account)}
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
      email: account.email,
      hash_password: account.hash_password
    }
  end

  # Response after creating an account.
  def render("account_token.json", %{account: account, token: token}) do
    %{
      id: account.id,
      email: account.email,
      token: token
    }

    def render("full_account.json", %{account: account}) do
      %{
        id: account.id,
        email: account.email,
        user: render_one(account.user, UserView, "user.json")
      }
    end

  end
end
