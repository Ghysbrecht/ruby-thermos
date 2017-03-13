require_relative "thermos.rb"

nest = Thermos.new(20, 1)
nest.temperature(296)
nest.get_status

nest.temperature(19)
nest.get_status

nest.temperature(61)
nest.get_status
