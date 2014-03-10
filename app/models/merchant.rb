class Merchant < ActiveRecord::Base
  #Associations
  has_many :offers, :dependent => :destroy
  
  #Validations
  validates :advertiser_id, :advertiser_name, :presence => true, :uniqueness => {:scope => :advertiser_id}
end
