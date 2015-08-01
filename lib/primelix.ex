defmodule Primelix do
  def main([ {max, _} | _ ]) do
    primes_up_to(max)
    |> Enum.map(&IO.puts(&1))
    :ok
  end

  def primes_up_to(max) when max < 2, do: []
  def primes_up_to(max) when max == 2, do: [2]
  def primes_up_to(max), do: primes_up_to(3, [2], max)

  def primes_up_to(x, primes, max) when x > max, do: primes

  def primes_up_to(x, primes, max) do
    unless divisible_by_any?(x, primes) do
      primes = primes ++ [x]
    end
    primes_up_to(x + 2, primes, max)
  end

  def divisible_by_any?(x, ints) do
    Enum.any?( ints, &(rem(x,&1)==0) )
  end
end
