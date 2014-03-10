require 'spec_helper'

describe Merchant do
  def merchant
    Merchant.new
  end
  
  def merchant_attributes
    {
      :advertiser_id => "10811223",
      :advertiser_name => "Usrrr afs"
    }
  end
  
  before(:each) do
    @merchant = merchant
  end
  
  it "should be valid" do
    @merchant.attributes = merchant_attributes
    @merchant.should be_valid
  end

  it "should require Advertiser ame" do
    @merchant.attributes = merchant_attributes.except(:advertiser_name)
    @merchant.should have(3).error_on(:title)
  end
  
  describe "associations" do
   it "has many offers" do
      User.reflect_on_association(:offers).to_hash.should == {
        :macro => :has_many,
        :options => {:dependent => :destroy, :extend => []},
        :class_name => "Offer"
      }
    end
  end
end
