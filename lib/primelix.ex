defmodule Primelix do
  def main(args) do
    {max, _} = Integer.parse(hd(args))
    primes = recurse_prime(3, [2], max)
    primes |> Enum.map(&IO.puts(&1))
  end

  def recurse_prime(x, starting_primes, max) when rem(x, 2) == 1 do
    odd_numbers = Enum.filter(x..max, fn(x) -> rem(x, 2) == 1 end)
    Enum.reduce(odd_numbers, starting_primes, fn(x, primes) ->
      if is_prime(x, primes), do: primes ++ [x], else: primes
    end)
  end

  def is_prime(x, []), do: true
  def is_prime(x, [h|_]) when rem(x, h) == 0, do: false
  def is_prime(x, [_|t]), do: is_prime(x, t)
end
