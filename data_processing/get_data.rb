require 'rubygems'
require 'oauth'
require 'JSON'

consumer_key = 'qQpfMzQesoyVBzp8hBtSiQ'
consumer_secret = 'oAQ8TO48vLTFSF9GLfk7VQaz_zg'
token = 'nCAzxdQOKMa6AwP_a6Xb4D3BEpSXZ_aZ'
token_secret = 'fJi1AAU6C-zIRjHhcNiXB_YVmNo'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

#path = "/v2/search?term=restaurants&location=new%20york"
location = "pasadena,%20CA"
path = "/v2/search?term=restaurants&location=#{location}"

response = access_token.get(path).body
people = JSON.parse(response)
i = 0
people.each do |l|
	puts l.to_json
	i = i + 1
end
puts i
