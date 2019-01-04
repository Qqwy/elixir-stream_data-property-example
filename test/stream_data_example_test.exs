defmodule StreamDataExampleTest do
  use ExUnit.Case
  doctest StreamDataExample

  test "greets the world" do
    assert StreamDataExample.hello() == :world
  end
end
