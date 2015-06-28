require 'prime'

class PrimeNumberCalc
  def calculate_prime_numbers_from_max(max)
    if !max.is_a?(Integer)
      raise PrimeNumberCalcException, 'invalid max'
    end

    Prime.take(max)
  end

  def calculate_multiplication_table(prime_numbers)
    if !prime_numbers_are_valid?(prime_numbers)
      raise PrimeNumberCalcException, 'array contains invalid prime numbers'
    end

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

  private

  def prime_numbers_are_valid?(prime_numbers)
    prime_numbers.each do |prime_number|
      if !Prime.prime?(prime_number)
        return false
      end
    end

    true
  end
end

class PrimeNumberCalcException < Exception; end
