class Admin::PrefecturesController < ApplicationController
  def index
    all_prefectures = Prefecture.order(:alphanumeric_eng_name)

    prefectures_with_path = all_prefectures.map do |p|
      { **p.attributes, prefecture_path: admin_prefecture_path(p.id) }
    end

    render inertia: { prefectures: prefectures_with_path, errors: [] }
  end

  def show
    # find() raises an ActiveRecord::RecordNotFound if not found
    prefecture = Prefecture.find(params[:id])

    prefecture_with_links = {
      **prefecture.attributes,
      # edit_prefecture_path: edit_admin_prefecture_path(prefecture.id),
      all_prefectures_path: admin_prefectures_path,
      view_municipalities_path: admin_prefecture_municipalities_path(prefecture.id)
    }

    render inertia: { prefecture: prefecture_with_links, errors: [] }
  end

  private
end
