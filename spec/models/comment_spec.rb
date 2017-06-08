require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:comment) { create(:comment, user: user, post: post) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_length_of(:body).is_at_least(5) }

  describe "attributes" do
    it "has a body attribute" do
      expect(comment).to have_attributes(body: comment.body)
    end
  end

  describe "after_create" do
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)

      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
    end

    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      @another_comment.save!
      expect(ActionMailer::Base.deliveries.length).to eq(2)
    end

    it "does not send emails to users who haven't favorited the post" do
      @another_comment.save!
      expect(ActionMailer::Base.deliveries.length).to eq(1)
    end
  end
end
