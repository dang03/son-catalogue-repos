def get_method
  require 'uri'
  require 'net/http'

  url = URI("http://0.0.0.0:4011/catalogues/son-packages/id/5717a579af8bef5ca8000000")

  #http = Net::HTTP.new(url.host, url.port)
  puts 'Creating request.'
  puts url.request_uri
  request = Net::HTTP::Get.new(url.request_uri)
  puts 'Creating request..'
  request["content-type"] = 'application/zip'
  request["cache-control"] = 'no-cache'
  request["postman-token"] = '6b22722b-708e-21c2-1ef5-3902eb4c567b'
  puts 'Creating request...'

  response = Net::HTTP.new(url.host, url.port).start {|http| http.request(request) }

  #response = http.request(request)
  #puts response.read_body
  puts 'response received'

  File.open('/home/osboxes/sonata/son-catalogue-repos/samples/retrieved_package.zip', 'wb') do |f|
    puts 'Writing file...'
    f.write response.read_body
    f.close
  end
end

# get_method()

