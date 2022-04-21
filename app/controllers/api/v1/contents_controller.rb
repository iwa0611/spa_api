class Api::V1::ContentsController < ApplicationController

  def index
    @json = []
    date = get_season
    contents = Content.where('infoJSON LIKE?', "%#{date}%")
    contents.each do |f|
      @json << JSON.parse(f.infoJSON)
    end
    render status: 200, json: @json, message: "リスト読込完了"
  end

  def search_index
    date = "#{params[:year]}" + "#{params[:season]}"
    @search_json = []
    contents = Content.where('infoJSON LIKE?', "%#{date}%")
    contents.each do |f|
      @search_json << JSON.parse(f.infoJSON)
    end
    render status: 200, json: @search_json, message: "リスト読込完了"
  end

  def favorite_index
    @favorite_json = []
    contents = Content.where(favorite: true)
    contents.each do |f|
      @favorite_json << JSON.parse(f.infoJSON)
    end
    render status: 200, json: @favorite_json, message: "リスト読込完了"
  end

  def show
    content = Content.find_by(title_id: params[:id])
    render status: 200, json: content, message: 'レビュー読込完了'
  end
  
  def create
    content = Content.new(addList_params)
    if content.save
      render json: { status: 200, message: 'リスト追加に成功' }
    else
      render json: { status: 403, content: nil, message: '追加に失敗しました' }
    end
  end

  def destroy
    content = Content.find_by(title_id: params[:id])
    if content.destroy
      render status: 200, json: { message: 'リストから削除に成功' }
    else
      render status: 403, json: { message: '削除に失敗しました' }
    end
  end

  def update
    content = Content.find_by(title_id: params[:id])
    if content.update(update_params)
      render status: 200, json: { message: '編集に成功' }
    else
      render status: 403, json: { message: '編集に失敗しました' }
    end
  end

  def search
    search = search_conditions(params)
    render status: search.code, json: search.body
  end

  private

  def get_season
     year = Date.current.strftime('%Y')
     month = Date.current.strftime('%m').to_i
     if month >= 1 && month < 4
      season = '-winter'
     elsif month >= 4 && month < 7
      season = '-spring'
     elsif month >= 7 && month < 10
      season = '-summer'
     else
      season = '-autumn'
     end
     year + season
  end

  def addList_params
    params.permit(:infoJSON, :title_id, :content)
  end

  def update_params
    params.permit(:comment, :kawaii, :omosiroi, :nakeru, :atui, :sakuga, :favorite)
  end

  def search_conditions(condition)
    if condition[:year].present?
      condition[:season].blank? ? year = "#{condition[:year]}-all" : year = "#{condition[:year]}" + "#{condition[:season]}"
    end
    header = { Authorization: ENV["API_KEY"] }
    query = { filter_title: condition[:word],
              filter_season: year,
              per_page: condition[:perPage],
              page: condition[:page] }
    client = HTTPClient.new
    client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    client.get(ENV["API_URL"], header: header, query: query)
  end
end
