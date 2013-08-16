class Location < ActiveRecord::Base
  include SocialStream::Models::Object

  attr_accessible :activity_object_id, :locid, :rating
  
  define_index do
    activity_object_index
    indexes locid
  end

end
