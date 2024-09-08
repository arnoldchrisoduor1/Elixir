defmodule ElixirApiWeb.Auth.Guardian do
  use Guardian, otp_app: :elixir_api # tellng Guardian that the config for this module can be found in the :elixir_api
  alias ElixirApi.Accounts

  def subject_for_token(%{id: id}, _claims) do  # function takes the user struct and some claims.
  # function to create a unique identifier (subject) for the token, it uses the User's ID.
    sub = to_string(id)  # convert id to string
    {:ok, sub}
  end


  def subject_for_token(_, _) do
    # handles a situation where the data is not provided in the input data.
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => id}) do
    # Function to takes claims(JWT claims) and extracts the id from the "sub" field.
    case Accounts.get_account!(id) do # fetching the account associated with the id.
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

  def resource_from_claims(_claims) do
    # handles a case whee the necessary claims ae not provided.
    {:error, :no_id_provided}
  end

  def authenticate(email, password) do
    case Accounts.get_account_by_email(email) do
      nil -> {:error, :unauthorized}
      account ->
        case validate_password(password, account.hash_password) do
          true -> create_token(account)
          false -> {:error, :unauthorized}
        end
    end
  end

  defp validate_password(password, hash_password) do
    Bcrypt.verify_pass(password, hash_password)
  end

  defp create_token(account) do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, account, token}
  end

end
