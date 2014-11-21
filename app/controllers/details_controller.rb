class DetailsController < ApplicationController

  skip_before_filter :authorize
  
  def index
    details = Details.all
    render json: details, status: 200
  end

  def new
    detail = Detail.new
    # render json: detail, status: 201
  end
  
  def create
    detail = Detail.create(detail_params)
    render json: restaurant, status: 201
  end

  def update
    detail = Detail.find(params[:id])
    detail.update_attributes(detail_params)
    render nothing: true, status: 204
  end

  def destroy
    detail = Detail.find(params[:id])
    detail.destroy
    render nothing: true, status: 204
  end

  private

  def detail_params
    params.require(:detail).permit(:status, :additional_info, :order_id, :address)
  end
end