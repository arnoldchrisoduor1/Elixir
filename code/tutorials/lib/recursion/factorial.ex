defmodule Tutorials.Recursion.Factorial do

  def fact(0), do: 1

  def fact(num) do
    # 3 -> 3*2*1 = 6
    num * fact(num - 1)
  end

  def of_tail_rec(num, acc \\ 1)
  def of_tail_rec(1, acc), do: acc
  def of_tail_rec(num, acc), do: of_tail_rec(num - 1, acc * num)

end
