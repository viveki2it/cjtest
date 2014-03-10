require 'spec_helper'

describe Offer do
  def offer
    Offer.new
  end
  
  def offer_attributes
    {
      :merchant_id => 1,
      :title => "Us books", 
      :description =>"Useer",
      :url => "http:exampl.com/",
      :password => "bangalore",
      :password_confirmation => "bangalore",
      :expires_at => (Date.today + (364 * 25)),
      :link_id => "10811223",
    }
  end
  
  before(:each) do
    @offer = offer
  end
  
  it "should be valid" do
    @offer.attributes = offer_attributes
    @offer.should be_valid
  end

  it "should require title" do
    @offer.attributes = offer_attributes.except(:title)
    @offer.should have(3).error_on(:title)
  end
  
  describe "associations" do
    it "belongs to merchant" do
      Album.reflect_on_association(:merchant).to_hash.should == {
        :macro => :belongs_to,
        :class_name => "Merchant",
        :options => {}
      }
    end
  end
  
end
