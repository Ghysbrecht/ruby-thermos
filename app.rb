require_relative "thermos.rb"
require 'net/http'

def get_status
    puts "+-------------------------+"
    puts "|       Led Status        |"
    puts "+-------------------------+"
    puts  "Red led:   " + (@nest.red ? "ON" : "OFF")
    puts  "Green led: " + (@nest.green ? "ON" : "OFF")
    puts  "Blue led:  " + (@nest.blue ? "ON" : "OFF")
    puts "+-------------------------+"
    puts "|     Relais Status       |"
    puts "+-------------------------+"
    puts  "Cooler:   " + (@nest.relaisCooler ? "ON" : "OFF")
    puts  "Heater:   " + (@nest.relaisHeater ? "ON" : "OFF")
end

@nest = Thermos.new(ARGV[0].to_i, ARGV[1].to_i)
@nest.temperature(ARGV[2].to_i)

get_status()
