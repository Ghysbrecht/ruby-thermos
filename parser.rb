require 'optparse'

Options = Struct.new(:kelvin, :celcius, :target, :fahrenheit, :range, :httplink, :mqtt, :json, :subscribe )

class Parser
  def parse(options)
    args = Options.new()

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: app.rb [options]"

      opts.on("-K", "--Kelvin=TEMP",Float, "Temperature in Kelvin") do |arg|
        args.kelvin = arg
      end

      opts.on("-C", "--Celcius=TEMP",Float, "Temperature in Celcius") do |arg|
        args.celcius = arg
      end

      opts.on("-F", "--Fahrenheit=TEMP",Float, "Temperature in Fahrenheit") do |arg|
        args.fahrenheit = arg
      end

      opts.on("-t", "--target=TEMP",Float, "Target temperature") do |arg|
        args.target = arg
      end

      opts.on("-r", "--range=TEMP",Float, "Range for temperature") do |arg|
        args.range = arg
      end

      opts.on("-H", "--httpget=LINK", "Get the temperature from the link") do |arg|
        args.httplink = arg
      end

      opts.on("-m", "--mqtt=LINK", "Set the mqtt broker link") do |arg|
        args.mqtt = arg
      end

      opts.on("-s", "--subscribe=NAME", "Subscribe to MQTT channel (broker link mandatory)") do |arg|
        args.subscribe = arg
      end

      opts.on("-j", "--json=FILENAME", "Use a JSON file for the temperature") do |arg|
        args.json = arg
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)

    raise OptionParser::MissingArgument if args.range.nil?
    raise OptionParser::MissingArgument if args.target.nil?

    return args
  end
end
