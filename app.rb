require_relative "thermos.rb"
require 'net/http'

def get_status(nest)
    puts "+-------------------------+"
    puts "|       Led Status        |"
    puts "+-------------------------+"
    puts  "Red led:  #{nest.red.round(0)}"
    puts  "Green led: #{nest.green.round(0)}"
    puts  "Blue led: #{nest.blue.round(0)}"
    puts  "Hex value: " + nest.get_hex_leds
    puts "+-------------------------+"
    puts "|     Relais Status       |"
    puts "+-------------------------+"
    puts  "Cooler:   " + (nest.relaisCooler ? "ON" : "OFF")
    puts  "Heater:   " + (nest.relaisHeater ? "ON" : "OFF")
end

nest = Thermos.new(ARGV[0].to_f, ARGV[1].to_f)
nest.temperature(ARGV[2].to_f)

get_status(nest)
