require 'spec_helper'

describe PrimeNumberCalc do
  context 'calculate_prime_numbers_from_max(max)' do
    it 'should throw an exception when max is not an integer' do
      expect {
        PrimeNumberCalc.new.calculate_prime_numbers_from_max(nil)
      }.to raise_error(PrimeNumberCalcException, 'invalid max')
    end

    it 'should calculate N prime numbers into an array' do
      max                     = 10
      prime_numbers           = PrimeNumberCalc.new.calculate_prime_numbers_from_max(max)
      expected_prime_numbers  = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

      expect(prime_numbers).to eq(expected_prime_numbers)
    end
  end

  context 'calculate_multiplication_table(prime_numbers)' do
    it 'should thow an exception when prime_numbers is not an array of prime numbers' do
      invalid_prime_numbers = [1, 2, 3, 4, 5]

      expect {
        PrimeNumberCalc.new.calculate_multiplication_table(invalid_prime_numbers)
      }.to raise_error(PrimeNumberCalcException, 'array contains invalid prime numbers')
    end

    it 'should calculate prime number multiplication table into an array' do
      prime_number_tbls = []
      expected_tbls     = [
        {
          2   => { 2 => 4 }
        },
        {
          2   => { 2 => 4, 3 => 6 },
          3   => { 2 => 6, 3 => 9 }
        },
        {
          2   => { 2 => 4, 3 => 6, 5 => 10 },
          3   => { 2 => 6, 3 => 9, 5 => 15 },
          5   => { 2 => 10, 3 => 15, 5 => 25 }
        },
        {
          2   => { 2 => 4, 3 => 6, 5 => 10, 7 => 14 },
          3   => { 2 => 6, 3 => 9, 5 => 15, 7 => 21 },
          5   => { 2 => 10, 3 => 15, 5 => 25, 7 => 35 },
          7   => { 2 => 14, 3 => 21, 5 => 35, 7 => 49 }
        },
        {
          2   => { 2 => 4, 3 => 6, 5 => 10, 7 => 14, 11 => 22 },
          3   => { 2 => 6, 3 => 9, 5 => 15, 7 => 21, 11 => 33 },
          5   => { 2 => 10, 3 => 15, 5 => 25, 7 => 35, 11 => 55 },
          7   => { 2 => 14, 3 => 21, 5 => 35, 7 => 49, 11 => 77 },
          11  => { 2 => 22, 3 => 33, 5 => 55, 7 => 77, 11 => 121 },
        }
      ]

      (1..5).each do |max|
        prime_numbers      = PrimeNumberCalc.new.calculate_prime_numbers_from_max(max)
        prime_number_tbls << PrimeNumberCalc.new.calculate_multiplication_table(prime_numbers)
      end

      expect(prime_number_tbls).to eq(expected_tbls)
    end
  end
end
