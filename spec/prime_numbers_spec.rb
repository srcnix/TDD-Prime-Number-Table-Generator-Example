require 'spec_helper'

describe PrimeNumberCalc do
  it 'should calculate N prime numbers into an array' do
    max                     = 10
    prime_numbers           = PrimeNumberCalc.new.calculate_prime_numbers_from_max(max)
    expected_prime_numbers  = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

    expect(prime_numbers).to eq(expected_prime_numbers)
  end

  it 'should calculate prime number multiplication table into an array' do
    prime_number_tbls = []
    expected_tbls     = [
      {
        2   => [ 4 ]
      },
      {
        2   => [ 4, 6 ],
        3   => [ 6, 9 ]
      },
      {
        2   => [ 4, 6, 10 ],
        3   => [ 6, 9, 15 ],
        5   => [ 10, 15, 25 ]
      },
      {
        2   => [ 4, 6, 10, 14 ],
        3   => [ 6, 9, 15, 21 ],
        5   => [ 10, 15, 25, 35 ],
        7   => [ 14, 21, 35, 49 ]
      },
      {
        2   => [ 4, 6, 10, 14, 22 ],
        3   => [ 6, 9, 15, 21, 33 ],
        5   => [ 10, 15, 25, 35, 55 ],
        7   => [ 14, 21, 35, 49, 77 ],
        11  => [ 22, 33, 55, 77, 121 ]
      }
    ]

    (1..5).each do |max|
      prime_numbers      = PrimeNumberCalc.new.calculate_prime_numbers_from_max(max)
      prime_number_tbls << PrimeNumberCalc.new.calculate_multiplication_table(prime_numbers)
    end

    expect(prime_number_tbls).to eq(expected_tbls)
  end
end
