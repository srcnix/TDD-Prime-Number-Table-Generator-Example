require 'prime'

class PrimeNumberCalc
  def calculate_prime_numbers_from_max(max)
    Prime.take(max)
  end
end
