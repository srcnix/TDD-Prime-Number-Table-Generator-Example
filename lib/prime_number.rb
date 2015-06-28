require 'prime'

class PrimeNumberCalc
  def calculate_prime_numbers_from_max(max)
    Prime.take(max)
  end

  def calculate_multiplication_table(prime_numbers)
    table = {}

    prime_numbers.each do |prime_number_to_multiply|
      multiplications = []

      prime_numbers.each do |prime_number|
        multiplications << prime_number_to_multiply * prime_number
      end

      table[prime_number_to_multiply] = multiplications
    end

    table
  end
end
