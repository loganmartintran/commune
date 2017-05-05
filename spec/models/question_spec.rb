require 'rails_helper'

RSpec.describe Question, type: :model do
  describe "attributes" do
    let(:my_question) { Question.new(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: true) }

    it "should respond to title" do
      expect(my_question).to respond_to(:title)
    end

    it "should respond to body" do
      expect(my_question).to respond_to(:body)
    end

    it "should respond to resolved" do
      expect(my_question).to respond_to(:resolved)
    end
  end
end
