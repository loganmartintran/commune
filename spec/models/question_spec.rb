require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Post Title", body: "New Question Body", resolved: boolean) }
  describe "attributes" do
    it "has title and body and resolved attributes" do
    expect(question).to have_attributes(title: "New Post Title", body: "New Question Body", resolved: boolean)
    end
  end

end
