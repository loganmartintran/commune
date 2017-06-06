require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) {create(:post) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }
end
