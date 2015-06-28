$LOAD_PATH.unshift(File.expand_path('../lib', File.dirname(__FILE__)))

require 'prime_number_calc'
require 'optparse'
require 'Formatador'

options = { }

optparse = OptionParser.new do |opts|
  opts.on('-m', '--maximum MAXIMUM', 'Maximum prime numbers to calculate table against') do |value|
    options[:maximum] = value
  end
end

optparse.parse!

if !options[:maximum].is_a?(Integer)
  passed_max = options[:maximum]

  options[:maximum] = 5

  if passed_max != nil
    puts "Warning: Using #{options[:maximum]} for maximum as provided option is not a number\n\n"
  end
end

prime_numbers     = PrimeNumberCalc.new.calculate_prime_numbers_from_max(options[:maximum])
prime_number_tbl  = PrimeNumberCalc.new.calculate_multiplication_table(prime_numbers)
headers           = prime_numbers.unshift('')
tbl_values        = []
prime_number_tbl.each do |prime_number, multiplications|
  tbl_values << { '' => prime_number }.merge!(multiplications)
end

Formatador.display_table(tbl_values, headers)
