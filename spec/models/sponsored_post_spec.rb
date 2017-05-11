require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { rand(100) }
  let(:my_sponsored_post) { SponsoredPost.create!(title: title, body: body, price: price) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(my_sponsored_post).to have_attributes(title: title, body: body, price: price)
    end
  end
end
