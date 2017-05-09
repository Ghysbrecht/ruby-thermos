require 'date'

class ThermoLogger

    def log_message(message)
        open('log.txt', 'a') do |f|
          f.puts message
        end
    end

    def log_event(thermos)
        current_time = DateTime.now
        log_message("-------------------------------------------------------")
        log_message(current_time.strftime "%d/%m/%Y %H:%M:%S")
        log_message("Received temperature value: " + thermos.temperature.to_s)
        log_message("Led value: " + thermos.get_hex_leds)
        log_message("Heater is " + (thermos.relaisHeater ? "ON" : "OFF"))
        log_message("Cooler is " + (thermos.relaisCooler ? "ON" : "OFF"))
    end
end
