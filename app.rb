require_relative "thermos.rb"
require_relative "Httpsvalue.rb"
require "OpenSSL"


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
    puts "+-------------------------+"
    puts "|   Temperature Status    |"
    puts "+-------------------------+"
    puts  "Temperature: #{nest.temperature.round(1)}"
end

#Get a termperature from the console arguments
nest = Thermos.new(ARGV[0].to_f, ARGV[1].to_f)
nest.set_temperature(ARGV[2].to_f)
get_status(nest)


#Get a temperature from the internet
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE #Bypass the SSL certificate problem, but gives a warning :(
httpsvalue = Httpsvalue.new
nest.set_temperature(httpsvalue.get_value("https://labict.be/software-engineering/temperature/api/temperature/fake").to_f)
get_status(nest)
