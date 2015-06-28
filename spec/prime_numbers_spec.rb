require 'spec_helper'

describe PrimeNumberCalc do
  it 'should calculate N numbers into an array' do
    max                     = 10
    prime_numbers           = PrimeNumberCalc.new.calculate_prime_numbers_from_max(max)
    expected_prime_numbers  = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

    expect(prime_numbers).to eq(expected_prime_numbers)
  end
end
