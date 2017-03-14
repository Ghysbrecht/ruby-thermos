
class Thermos

   attr_accessor :target
   attr_accessor :range

   attr_reader :red
   attr_reader :green
   attr_reader :blue
   attr_reader :relaisCooler
   attr_reader :relaisHeater


   def initialize(target, range)
       @target = get_celcius(target)
       @range = range
       @relaisCooler = false;
       @relaisHeater = false;
   end

   def temperature (temperature)
       @temperature = get_celcius(temperature)
       reset_leds()
       set_leds()
   end

   def reset_leds
       @red = false
       @green = false
       @blue = false
   end

   def set_leds
       if(@temperature < (@target - @range))
           @blue = true
           @relaisHeater = true;
           @relaisCooler = false;

       elsif(@temperature > (@target + @range))
           @red = true
           @relaisHeater = false;
           @relaisCooler = true;
       else
           @green = true
           @relaisHeater = false;
           @relaisCooler = false;
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
