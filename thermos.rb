
class Thermos

   attr_accessor :target
   attr_accessor :range

   def initialize(target, range, temperatureUnit)
       @target = get_celcius(target, temperatureUnit)
       @range = range
   end

   def temperature (temperature, temperatureUnit)
       @temperature = get_celcius(temperature, temperatureUnit)
       reset_leds()
       set_leds()
   end

   def get_status
       puts "+-------------------------+"
       puts "|       Led Status        |"
       puts "+-------------------------+"
       puts  "Red led:   " + (@red ? "ON" : "OFF")
       puts  "Green led: " + (@green ? "ON" : "OFF")
       puts  "Blue led:  " + (@blue ? "ON" : "OFF")
   end

   def reset_leds
       @red = false
       @green = false
       @blue = false
   end

   def set_leds
       if(@temperature < (@target - @range))
           @blue = true
       elsif(@temperature > (@target + @range))
           @red = true
       else
           @green = true
       end
   end

   def get_celcius(temperature, temperatureUnit)
      case temperatureUnit
      when 'C'
         temperatureCelsius = temperature
      when 'F'
         temperatureCelsius = (temperature - 32)/1.8
      when 'K'
         temperatureCelsius = temperature - 273.15
      end
      temperatureCelsius
   end
end
