require 'rails_helper'

RSpec.describe "Content", type: :request do
  describe "contents_request_test" do
    let(:content) { create(:content) }

    context "indexに正常にリクエストを送った時" do
      it "status200が返ってくる" do
        get api_v1_contents_path
        expect(response.status).to eq 200
      end
    end

    context "createに正常にリクエストを送った時" do
      it "status200が返ってくる" do
        post api_v1_contents_path
        expect(response.body).to include "200"
      end
    end

    context "createに不正なリクエストを送った時" do
      it "status403が返ってくる" do
        post api_v1_contents_path, params: { title_id: content.title_id }
        expect(response.body).to include "403"
      end
    end

    context "updateに正常にリクエストを送った時" do
      it "status200が返ってくる" do
        patch api_v1_content_path(id: content.title_id)
        expect(response.status).to eq 200
      end
    end

    # 403を返す場合がないのでスキップ
    #context "updateに不正なリクエストを送った時" do
    #  it "status403が返ってくる" do
    #    patch api_v1_content_path(id: content.title_id)
    #    expect(response.status).to eq 403
    #  end
    #end

    context "destroyに正常にリクエストを送った時" do
      it "status200が返ってくる" do
        delete api_v1_content_path(id: content.title_id)
        expect(response.status).to eq 200
      end
    end

    # 403を返す場合がないのでスキップ
    #context "destroyに不正なリクエストを送った時" do
    #  it "status403が返ってくる" do
    #    delete api_v1_content_path(id: content.title_id)
    #    expect(response.status).to eq 403
    #  end
    #end
  end
end
