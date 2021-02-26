defmodule Rocket.NumbersTest do
  use ExUnit.Case
  alias Rocket.NumbersTest

  describe "sum_from_file/1" do
    test "When there is a file with the given name, returns the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expected_response = {:ok, %{result: 42}}

      assert_response == expected_response
    end

    test "When there is a file with the given name, returns an error" do
      response = Numbers.sum_from_file("banana")

      expected_response = {:error, %{"Invalid file"}}

      assert_response == expected_response
    end
  end
end
