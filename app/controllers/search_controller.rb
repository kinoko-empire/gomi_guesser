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
      prefecture_name = params[:prefecture_name]
      municipality_name = params[:municipality_name]

      pref = Prefecture.find_by!(eng_name: prefecture_name)
      munic = Municipality.find_by!(eng_name: municipality_name)

      if munic.prefecture_id != pref.id
        raise "error"
      end

      material_categories = MaterialTag.all.order(:material_name)

      # should always be returned? possible that we don't have any data for a municipality though?
      material_category_data = { data: {} }
      # text search results could be empty because no search term provided OR no data available
      # do we need to differentiate the reasons why it could be empty?
      text_search_data = { search_term: params[:text_search], data: nil }

      a = ItemRule.where(municipality_id: munic.id)

      a.each do |r|
        puts r.item_id
      end

      render inertia: {
        material_category_data: material_category_data,
        text_search_data: text_search_data,
        p_name: prefecture_name,
        m_name: municipality_name
      }
    end
  end
end
