
class Thermos

   attr_accessor :target
   attr_accessor :range

   attr_reader :red
   attr_reader :green
   attr_reader :blue
   attr_reader :relaisCooler
   attr_reader :relaisHeater
   attr_reader :temperature


   def initialize(target, range)
       @target = target
       @range = range
       reset_leds
       @relaisCooler = false;
       @relaisHeater = false;
   end

   def set_celcius (temperature)
       @temperature = temperature
       reset_leds
       set_leds
   end

   def set_kelvin (temperature)
       @temperature = temperature - 273.15
       reset_leds
       set_leds
   end

   def set_fahrenheit (temperature)
       @temperature = (temperature - 32)/1.8
       reset_leds
       set_leds
   end

   def reset_leds
       @red = 0.0
       @green = 0.0
       @blue = 0.0
   end

   def set_leds
       if(@temperature < (@target - @range))
           multiplier = ( (@target - @temperature) / (5 * @range)) #5 times the range from the target is very blue
           multiplier > 1 ? multiplier = 1 : multiplier = multiplier
           @blue = 255*multiplier

           @relaisHeater = true;
           @relaisCooler = false;

       elsif(@temperature > (@target + @range))
           multiplier = ( (@temperature - @target) / (5 * @range)) #5 times the range from the target is very red
           multiplier > 1 ? multiplier = 1 : multiplier = multiplier
           @red = 255*multiplier

           @relaisHeater = false;
           @relaisCooler = true;
       else
           multiplier = ((@temperature - @target).abs  / @range ) #0 time the range from the target is very green
           @green = 255*(1-multiplier)

           @relaisHeater = false;
           @relaisCooler = false;
       end
   end

   def get_hex_leds
       "%02x%02x%02x" % [@red,@green,@blue]
   end

end
