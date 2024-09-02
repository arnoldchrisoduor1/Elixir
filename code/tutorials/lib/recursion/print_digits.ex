defmodule Tutorials.Recursion.PrintDigits do
  # Base Case
  def upto(0), do: 0

  def upto(nums) do
    IO.puts(nums) # 3 ,2, 1, 0
    upto(nums - 1)
  end
end
