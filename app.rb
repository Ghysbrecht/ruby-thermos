require_relative "thermos.rb"
require 'net/http'

nest = Thermos.new(ARGV[0].to_i, ARGV[1].to_i)
nest.temperature(ARGV[2].to_i)
nest.get_status
