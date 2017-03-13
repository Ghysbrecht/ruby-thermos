require_relative "thermos.rb"

nest = Thermos.new(20, 1, 'C')
nest.temperature(296, 'K')
nest.get_status

nest.temperature(19, 'C')
nest.get_status

nest.temperature(61, 'F')
nest.get_status
