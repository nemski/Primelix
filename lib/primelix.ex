defmodule Primelix do
  def main(args) do
    {max, _} = Integer.parse(hd(args))
    primes_up_to(3, [2], max)
    |> Enum.map(&IO.puts(&1))
  end

  def primes_up_to(x, primes, max) when max < 2, do: []

  def primes_up_to(x, primes, max) when x > max, do: primes

  def primes_up_to(x, primes, max) do
    unless divisible_by_any?(x, primes) do
      primes = primes ++ [x]
    end
    primes_up_to(x + 2, primes, max)
  end

  def is_prime(x, primes) do
    !divisible_by_any?(x, primes)
  end

  def divisible_by_any?(x, ints) do
    Enum.any?( ints, &(rem(x,&1)==0) )
  end
end
