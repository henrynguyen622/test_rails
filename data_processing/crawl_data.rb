require '/Users/yomama/works/food/food_social/config/environment'
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
result = JSON.parse(response)
puts result["region"]
puts result["total"]
b = result["businesses"]
b.each do |l|
	biz = Business.new
	biz.business_id = l["id"]
	biz.is_claimed= l["is_claimed"]
	biz.is_closed= l["is_closed"]
	biz.name= l["name"]
	biz.image_url= l["image_url"]
	biz.url= l["url"]
	biz.mobile_url= l["mobile_url"]
	biz.phone= l["phone"]
	biz.display_phone= l["display_phone"]
	biz.review_count= l["review_count"]
	biz.categories= l["categories"]
	biz.rating= l["rating"]
	biz.rating_img_url= l["rating_img_url"]
	biz.rating_img_url_small= l["rating_img_url_small"]
	biz.rating_img_url_large= l["rating_img_url_large"]
	biz.snippet_text= l["snippet_text"]
	biz.snippet_image_url= l["snippet_image_url"]
	biz.location= l["location"]
	biz.city = l["location"]["city"] unless l["location"]["city"].blank?
	biz.state_code = l["location"]["state_code"] unless l["location"]["state_code"].blank?
	biz.country_code = l["location"]["country_code"] unless l["location"]["country_code"].blank?

	biz.deals= l["deals"]
	biz.gift_certificates= l["gift_certificates"]
	biz.menu_date_updated= l["menu_date_updated"]
	biz.menu_provider= l["menu_provider"]
	biz.save
end
