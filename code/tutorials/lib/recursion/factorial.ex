defmodule Tutorials.Recursion.Factorial do

  def fact(0), do: 1

  def fact(num) do
    # 3 -> 3*2*1 = 6
    num * fact(num - 1)
  end
end
