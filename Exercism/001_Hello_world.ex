defmodule HelloWorld do
  @doc """
  Simply returns hello world
  """

  @spec hello :: String.t()
  def hello do
    "Hello, World"
  end
end

IO.puts(HelloWorld.hello())
