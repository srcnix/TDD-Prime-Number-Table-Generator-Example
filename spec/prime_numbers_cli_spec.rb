require 'spec_helper'

describe 'bin/prime_numbers.rb command line tool' do
  it 'should accept --maximum parameter' do
    stdout = capture('ruby ./bin/prime_numbers.rb --help')

    expect(stdout).to match("-m, --maximum MAXIMUM            Maximum prime numbers to calculate table against")
  end

  it 'should output multiplication table' do
    stdout = capture('ruby ./bin/prime_numbers.rb')
    expected_output = "  +----+----+----+----+----+-----+\n" +
                      "  |    | 2  | 3  | 5  | 7  | 11  |\n" +
                      "  +----+----+----+----+----+-----+\n" +
                      "  | 2  | 4  | 6  | 10 | 14 | 22  |\n" +
                      "  +----+----+----+----+----+-----+\n" +
                      "  | 3  | 6  | 9  | 15 | 21 | 33  |\n" +
                      "  +----+----+----+----+----+-----+\n" +
                      "  | 5  | 10 | 15 | 25 | 35 | 55  |\n" +
                      "  +----+----+----+----+----+-----+\n" +
                      "  | 7  | 14 | 21 | 35 | 49 | 77  |\n" +
                      "  +----+----+----+----+----+-----+\n" +
                      "  | 11 | 22 | 33 | 55 | 77 | 121 |\n" +
                      "  +----+----+----+----+----+-----+\n"

    expect(stdout).to eq(expected_output)
  end

  def capture(command)
    require 'open3'

    stdout_str = ""

    Open3.popen3(command.to_s) do |stdin, stdout, stderr, thread|
      stdout_str += stdout.read
    end

    stdout_str
  end
end
