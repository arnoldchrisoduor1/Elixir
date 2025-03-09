# Lasagna preparation

defmodule Lasagna do

  # Expected minutes in the oven.
  @spec expected_minutes_in_oven() :: integer()
  def expected_minutes_in_oven(),  do: 40

  # Remaining minutes in oven function.
  @spec remaining_minutes_in_oven(integer()) :: integer()
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  # Preparation time in minutes.
  @spec preparation_time_in_minutes(integer()) :: integer()
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  # Total time in minutes.
  @spec total_time_in_minutes(integer(), integer()) :: integer()
  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end
  
end
