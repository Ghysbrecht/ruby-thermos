require 'mqtt'

class Mqtttemp

  def initialize(server)
      @server = server;
  end

  def on_change &block
    @on_change_block = block
  end

  def enable_thread(mqtt_topic)
    Thread.new do
        MQTT::Client.connect(@server) do |c|
          # If you pass a block to the get method, then it will loop
          c.get(mqtt_topic) do |topic,message|
            if(isValidJson(message))
                @on_change_block.call(JSON.parse(message)["temperature"]) unless @on_change_block.nil?
            end
          end
        end
      end
    end


  def isValidJson(json)
      JSON.parse(json)
      return true
    rescue JSON::ParserError => e
      return false
  end

  def send_led_hex(hex)
      MQTT::Client.connect(@server) do |c|
           data = '{"color":"'+ hex +'"}'
          c.publish('softwareengineering/thermostat/thomas/led', data)
      end
  end

end
