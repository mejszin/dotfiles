#!/usr/bin/env ruby

for gem in ['colorize', 'uri', 'http', 'net/ping', 'json'] do
    begin
        require gem
    rescue LoadError
        puts "MOTD requires Ruby '#{gem.gsub('/', '-')}' gem!"
        exit
    end
end

class String
    def titleize
        return split(/ |\_|\-/).map(&:capitalize).join(" ") 
    end
end

def get_http_data(url)
    begin
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl, http.verify_mode = true, OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        response = http.request(request)
        return JSON.parse(response.body) if response.code == "200"
        raise StandardError.new
    rescue => e
        return {}
    end
end

def get_platform
    str = RUBY_PLATFORM
    if File.exists?('/etc/lsb-release')
        File.open('/etc/lsb-release', 'r').read.each_line do |line|
            if line.include?('DISTRIB_DESCRIPTION')
                str = line.chomp.gsub('DISTRIB_DESCRIPTION=', '').gsub('"', '')
            end
        end
    end
    return "Welcome to #{str}!"
end

def get_logo
    lines = []
    lines << "                          __    _            __         "
    lines << "    ____ ___  ____ ______/ /_  (_)___   ____/ /__ _   __"
    lines << "   / __ `__ \\/ __ `/ ___/ __ \\/ / __ \\ / __  / _ \\ | / /"
    lines << "  / / / / / / /_/ / /__/ / / / / / / // /_/ /  __/ |/ / "
    lines << " /_/ /_/ /_/\\__,_/\\___/_/ /_/_/_/ /_(_)__,_/\\___/|___/  "
    colors = [:magenta, :magenta, :light_blue, :cyan, :light_green]
    return lines.map.with_index { |s, i| s.colorize(colors[i]) }.join("\n")
end

def get_service_status(service, url)
    online = Net::Ping::HTTP.new(url).ping?
    str = "#{service}:".ljust(16, ' ')
    str += online ? 'Online'.colorize(:light_green) : 'Offline'.colorize(:light_red)
    return str
end

def get_weather(q)
    url = 'https://api.openweathermap.org/data/2.5/weather'
    # Return if no API key found
    return Array.new(3) unless File.exists?('/home/louis/scripts/weather_api_key')
    # Get relevant data with API key
    appid = File.read('/home/louis/scripts/weather_api_key').chomp
    data = get_http_data("#{url}?appid=#{appid}&q=#{q}&units=metric")
    # Return if no API data received
    return Array.new(3) if data == {}
    # Return weather data
    weather = data["weather"].first["main"].titleize
    description = data["weather"].first["description"].titleize
    temperature = data["main"]["temp"].round.to_s + '°'
    feels_like = data["main"]["feels_like"].round.to_s + '°'
    wind_speed = data["wind"]["speed"].round(2).to_s + 'kmph'
    time = Time.at(data["dt"]).to_datetime.strftime('%H:%M %p')
    thumb, color = case weather
        when 'Thunderstorm', 'Drizzle', 'Rain'; [["' '' ' '", "'' ' ' '", "' ' '' '"], :light_blue]
        when 'Snow'; [["* '* ' *", "'* ' * '", "*' * ' *"], :white]
        when 'Clouds'; [["  .   * ", "*    . O", ". . *  ."], :dark_white]
        else; [["  .   * ", "*    . O", ". . *  ."], :light_magenta]
    end
    return [
        [thumb[0].ljust(11, ' '), description.ljust(20, ' '), q.titleize].join.colorize(color),
        [thumb[1].ljust(11, ' '), temperature.ljust(20, ' '), "feels like #{feels_like}"].join.colorize(color),
        [thumb[2].ljust(11, ' '), time.ljust(20, ' '), "wind speed #{wind_speed}"].join.colorize(color),
    ]
end

weathers = ['southampton', 'oxford'].map { |q| get_weather(q) }.flatten
services = [['haedi API', 'https://haedi.org/api/ping'], ['milkbox API', 'https://milkbox.club/api/ping']].map { |q| get_service_status(*q) }

# Logo
print get_logo()
print "\n\n"
# Operating system
print '  ' + get_platform()
print "\n\n"
# Weather
unless weathers.first == nil
    print "  Weather:\n\n"
    print weathers.map.with_index { |line, i| '    ' + line + (i % 3 == 2 ? "\n" : "") }.join("\n")
    print "\n"
end
# Services
print "  Services:\n\n"
print services.map { |line| '    ' + line }.join("\n")
print "\n\n"
