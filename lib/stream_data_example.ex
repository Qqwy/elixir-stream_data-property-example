defmodule StreamDataExample do
  require Integer

  def halve_even(%{difficult_to_construct: %{number: even_number}}) when Integer.is_even(even_number) do
    if even_number < 10_000 do
      {:ok, div(even_number, 2)}
    else
      {:error, :number_too_big}
    end
  end

  def halve_even(%{difficult_to_construct: %{number: number}}) when not Integer.is_even(number) do
    {:error, :not_an_even_number}
  end

  def halve_even(_other) do
    {:error, :improperly_constructed}
  end
end
