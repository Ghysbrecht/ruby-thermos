# Optparse

***

#### In this ruby program I use "optparse" to easily pass values to the program. This way it will also be easier later one when this app becomes a program on itself.

The app requires 3 key values to be able to run. A target, range and temperature. It is already possible to pass on the that last one via different ways. This is a print out of '-h'.

```
Usage: app.rb [options]
    -K, --Kelvin=TEMP                Temperature in Kelvin
    -C, --Celcius=TEMP               Temperature in Celcius
    -F, --Fahrenheit=TEMP            Temperature in Fahrenheit
    -t, --target=TEMP                Target temperature
    -r, --range=TEMP                 Range for temperature
    -H, --httpget=LINK               Get the temperature from the link
    -m, --mqtt=LINK                  Set the mqtt broker link
    -s, --subscribe=NAME             Subscribe to MQTT channel (broker link mandatory)
    -j, --json=FILENAME              Use a JSON file for the temperature
    -h, --help                       Prints this help
```  

***

## Kelvin temperature:

The temperature can be passed on in kelvin.

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -K 301
```
***

## Celcius temperature:

The temperature can be passed on in Celcius.

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -C 23.9
```
***

## Fahrenheit temperature:

The temperature can be passed on in Fahrenheit.

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -F 80.7
```
***

## HTTP temperature:

The temperature can be passed on by providing a link where the app can get a temperature.

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -H "https://labict.be/software-engineering/temperature/api/temperature/fake"
```
***

## MQTT temperature:

The temperature can be passed on via MQTT. A broker link and a topic to subscibe to must be given with the arguments.

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -m "mqtt.site.be" -s "topic/temperature"
```
***

## JSON temperature:

The temperature can be passed on via a JSON file. This file must follow this format.

```json
{
"temperature" : "10.87"
}
```

#### Syntax

```
ruby app.rb -t 27.4 -r 1 -j "test.json"
```
***

## Optparse code:

Optparse makes it easy to add a option to the app. This is the code for the -K option.

```ruby
opts.on("-K", "--Kelvin=TEMP", "Temperature in Kelvin") do |arg|
  args.kelvin = arg
end
```
