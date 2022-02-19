class Api::V1::ContentsController < ApplicationController

  def index
    @json = []
    contents = Content.all
    contents.each do |f|
      @json << JSON.parse(f.infoJSON)
    end
    render status: 200, json: @json, message: "success"
  end
  
  def create
    content = Content.new(addList_params)
    if content.save
      render json: { status: 200, message: 'success' }
    else
      render json: { status: 403, content: nil, message: content.errors }
    end
  end

  def destroy
    content = Content.find_by(title_id: params[:id])
    if content.destroy
      render json: { status: 200, message: 'success' }
    else
      render json: { status: 403, message: content.errors }
    end
  end

  def edit
  end

  def search
    search = search_conditions(params)
    render status: search.code, json: search.body
  end

  private

  def addList_params
    params.permit(:infoJSON, :title_id, :content)
  end

  def search_conditions(condition)
    if condition[:year].present?
      condition[:season].blank? ? year = "#{condition[:year]}-all" : year = "#{condition[:year]}" + "#{condition[:season]}"
    end
    header = { Authorization: ENV["API_KEY"] }
    query = { filter_title: condition[:word],
              filter_season: year,
              per_page: 4 }
    client = HTTPClient.new
    client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    client.get(ENV["API_URL"], header: header, query: query)
  end
end
