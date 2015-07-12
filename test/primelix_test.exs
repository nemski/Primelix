defmodule PrimelixTest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "produces primes" do
    assert Primelix.recurse_prime(3, [2], 50) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47]
  end
end
