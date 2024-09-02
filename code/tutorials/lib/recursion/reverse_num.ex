defmodule Tutorials.Recursion.ReverseNum do
  # num = 123 -> 321
  def reverse(num, acc \\ 0) do
    reverse(num, acc, 0)
  end

  def reverse(0, acc, _) do
    acc
  end

  def reverse(num, acc, counter) do
    new_num = div(num, 10)
    new_acc = acc * 10 + rem(num, 10)
    reverse(new_num, new_acc, counter + 1)
  end
end
