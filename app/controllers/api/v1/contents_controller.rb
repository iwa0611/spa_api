class Api::V1::ContentsController < ApplicationController
  def index
    render json: { status: 200, contents: Content.all, message: "success" }
  end
  
  def create
  end

  def destroy
  end

  def edit
  end
end
