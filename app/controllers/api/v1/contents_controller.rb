class Api::V1::ContentsController < ApplicationController
  def index
    render json: { status: 200, contents: Content.all, message: "success" }
  end
  
  def create
    content = Content.new(content_params)
    if content.save
      render json: { status: 200, content: content, message: 'success' }
    else
      render json: { status: 403, content: nil, message: content.errors }
    end
  end

  def destroy
    content = Content.find(params[:id])
    if content.destroy
      render json: { status: 200, message: 'success' }
    else
      render json: { status: 403, message: content.errors }
    end
  end

  def edit
  end

  private

  def content_params
    params.permit(:comment)
  end
end
