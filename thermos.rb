
class Thermos

   attr_accessor :target
   attr_accessor :range

   def initialize(target, range)
       @target = get_celcius(target)
       @range = range
   end

   def temperature (temperature)
       @temperature = get_celcius(temperature)
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

   def get_celcius(temperature)
      if(temperature > 200)
         tempCelsius = temperature - 273.15
     elsif(temperature > 40)
         tempCelsius = (temperature - 32)/1.8
      else
         tempCelsius = temperature
      end
      tempCelsius
   end
end
