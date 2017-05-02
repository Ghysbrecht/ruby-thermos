require_relative "thermos.rb"
require_relative "httpsvalue.rb"
require_relative "logger.rb"
require_relative "status.rb"
require_relative "mqtttemp.rb"
require_relative "parser.rb"
require "OpenSSL"
require 'json'
require 'rubygems'

parser_var = Parser.new
options = parser_var.parse(ARGV)

logger = ThermoLogger.new()
status = Status.new()

if(options.mqtt)
    mqtttemp = Mqtttemp.new(options.mqtt)
end

nest = Thermos.new(options.target, options.range)

#Get a termperature from the console arguments
if(options.kelvin || options.celcius || options.fahrenheit)
    nest.set_kelvin(options.kelvin) if options.kelvin
    nest.set_celcius(options.celcius) if options.celcius
    nest.set_fahrenheit(options.fahrenheit) if options.fahrenheit
    status.get_status(nest)
    logger.log_event(nest)
end


#Get a temperature from the internet
if(options.httplink)
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE #Bypass the SSL certificate problem, but gives a warning :(
    httpsvalue = Httpsvalue.new
    nest.set_celcius(httpsvalue.get_value(options.httplink).to_f)
    status.get_status(nest)
    logger.log_event(nest)
end

#Get a temperature from a Json file
if(options.json)
    nest.set_celcius(JSON.parse(File.read(options.json))["temperature"].to_f)
    status.get_status(nest)
    logger.log_event(nest)
end

#Get the temperature from MQTT
if(options.subscribe)
    mqtttemp.on_change do |temp|
        nest.set_celcius(temp);
        status.get_status(nest);
        logger.log_event(nest);
        mqtttemp.send_led_hex(nest.get_hex_leds);
    end

    mqtttemp.enable_thread(options.subscribe);

    while(true)
    end
end
