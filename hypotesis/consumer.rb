require "net/http"
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "servent"
require "pp"

#q = Queue.new
#
#trap :INT do
#  q << nil
#end

#Thread.new do
#  uri = URI("http://localhost:9292/omg")
#
#  Net::HTTP.start(uri.host, uri.port, read_timeout: 600) do |http|
#    get = Net::HTTP::Get.new uri
#    get["Accept"] = "text/event-stream"
#    http.request(get) do |response|
#      response.read_body do |chunk|
#        q.push chunk
#      end
#    end
#    q.push nil
#  end
#end

event_source = Servent::EventSource.new("http://localhost:9292/omg")
event_source.on_message do |message|
  #q.push message
  pp message
end
event_source.start.join

#while (chunk = q.pop)
#  puts chunk
#end

puts "bye"
