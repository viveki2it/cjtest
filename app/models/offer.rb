class Offer < ActiveRecord::Base
  #association
  belongs_to :merchant
  
  #validations
  validates :title, :presence => true, :uniqueness => {scope: :merchant}
  
  def self.create_offers
    cj = CommissionJunction.new(DEVELOPER_KEY, WEBSITE_ID)
    cj.link_search('keywords' => '+used +books',
      'records-per-page' => '20').each do |link|
      merchant = Merchant.where("advertiser_id = ?", link.advertiser_id).first_or_create(advertiser_id: link.advertiser_id, advertiser_name: link.advertiser_name)
      Offer.where("link_id = ? and merchant_id = ?", link.link_id, merchant.id).first_or_create(title: link.link_name, description: link.description, url: link.destination,expires_at: link.promotion_end_date, merchant_id: merchant.id, link_id: link.link_id)
    end
  end
end
