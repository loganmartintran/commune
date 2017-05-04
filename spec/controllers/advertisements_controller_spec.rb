require 'rails_helper'

RSpec.describe AdvertisementsController, type: :controller do
  let(:ad) { Advertisement.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 50) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [ad] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: ad.id}
      expect(response).to render_template :show
    end

    it "assigns ad to @advertisements" do
      get :show, {id: ad.id}
      expect(assigns(:advertisement)).to eq(ad)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST #create" do
    it "increases the number of ads by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}}.to change(Advertisement,:count).by(1)
    end

    it "assigns a new ad to @advertisement" do
      post :create, post: {title:RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new ad" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 25}
      expect(response).to redirect_to Advertisement.last
    end
  end

end
