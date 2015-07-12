defmodule Primelix do
  def main(args) do
    {max, _} = Integer.parse(hd(args))
    primes = recurse_prime(3, [2], max)
    primes |> Enum.map(&IO.puts(&1))
  end

  def recurse_prime(x, primes, max) do
    if x > max do
      primes
    else
      if is_prime(x, primes) do
        recurse_prime(x + 2, primes ++ [x], max)
      else
        recurse_prime(x + 2, primes, max)
      end
    end
  end

  def is_prime(x, primes) do
    if divisible_by(x, primes) do
      false
    else
      true
    end
  end

  def divisible_by(x, list) when length(list) >= 1 do
    if rem(x, hd(list)) == 0 do 
      true
    else
      divisible_by(x, tl(list))
    end
  end

  def divisible_by(x, list) do
    false
  end
end
