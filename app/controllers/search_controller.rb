class SearchController < ApplicationController
  def index
    prefectures_result = {}

    all_prefectures = Prefecture.includes(:municipalities).order(:alphanumeric_eng_name)

    all_prefectures.each do |p|
      prefectures_result[p.eng_name] = {
        prefecture_id: p.id,
        municipalities: p.municipalities.order(:alphanumeric_eng_name).select(:eng_name, :id, :prefecture_id)
      }
    end

    render inertia: { prefecture_list: prefectures_result }
  end

  def results
    if !params[:prefecture_name]
      flash[:alert] = "A prefecture must be selected"
      redirect_to action: "index"
    elsif params[:prefecture_name] && !params[:municipality_name]
      flash[:alert] = "A municipality must be selected"
      redirect_to action: "index", prefecture_name: params[:prefecture_name], text_search: params[:text_search]
    else
      render inertia: { search_path: "/text_search" }
    end
  end
end
