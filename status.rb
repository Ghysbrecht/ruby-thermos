class Status
    def get_status(nest)
        puts "----------------------------------------------------------------------------------------"
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
end
