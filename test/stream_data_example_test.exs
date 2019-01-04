defmodule StreamDataExampleTest do
  require Integer
  use ExUnit.Case
  use ExUnitProperties

  # describe "halve_even" do
  property "halve_even" do
    call = fn num ->
      StreamDataExample.halve_even(%{difficult_to_construct: %{number: num}})
    end


    # property "halves on small even numbers" do
      check all num <- integer(max: 10_000), Integer.is_even(num) do
        result = call.(num)
        assert {:ok, div(num, 2)} == result
      end
    # end

    # property "returns error on too big errors" do
      check all num <- integer(min: 10_000), Integer.is_even(num) do
        assert {:error, _} = call.(num)
      end
    # end

    # property "Returns error on non-even numbers" do
      check all num <- integer(), Integer.is_odd(num) do
        assert {:error, _} = call.(num)
      end
    # end
    # property "Returns error non-numeric inputs" do
      check all thing <- term(), not(is_integer(thing)) do
        assert {:error, _} = call.(thing)
      end
    # end
  end
end
