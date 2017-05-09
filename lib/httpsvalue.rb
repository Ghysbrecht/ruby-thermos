class Httpsvalue
    require "open-uri"
        def get_value(url)
            data = URI.parse(url).read
        end
end
