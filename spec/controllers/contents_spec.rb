require 'rails_helper'

RSpec.describe Api::V1::ContentsController do
  describe "Content #create" do
    it "content createができる" do
      expect do
        post :create, params: { post: { title_id: 1 } }
      end.to change(Content, :count).by(1)
    end
  end

  describe "Content #update, #destroy" do
    let(:content) { create(:content) }

    before do
      content.save
    end

    it "content updateができる" do
      patch :update, params: { id: content.title_id, comment: "test" }
      expect(content.reload.comment).to eq "test"
    end

    it "content destroyができる" do
      expect do
        delete :destroy, params: { id: content.title_id }
      end.to change(Content, :count).by(-1)
    end
  end
  
  describe "Content #index" do
    it "indexからinfoJSONを変換して取得できる" do
      # infoJSON: "{\"id\":1, \"title\": \"test\"}"を送り変換されているかのテスト
      content = create(:content)
      get :index
      expect(JSON.parse(response.body)[0].length).to eq 2
    end
  end

  describe "Content #search" do
    let(:body) { "{\"id\":1, \"title\": \"test\"}" }
    let(:status) { 200 }
    
    before do
      WebMock.enable!
      WebMock.stub_request(:get, ENV["API_URL"] + "?filter_season&filter_title&per_page=4").
        with(
          headers: { Authorization: ENV["API_KEY"] },
        ).
        to_return(
          body: body,
          status: status
        )
    end

    it "content searchで結果を取得できる" do
      get :search
      expect(response.status).to eq 200
      expect(response.body.present?).to eq true 
    end
  end
end
