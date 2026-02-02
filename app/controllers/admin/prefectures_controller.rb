class Admin::PrefecturesController < ApplicationController
  def index
    all_prefectures = Prefecture.order(:alphanumeric_eng_name)

    prefectures_with_path = all_prefectures.map do |p|
      { **p.attributes, prefecture_path: admin_prefecture_path(p.id) }
    end

    render inertia: { prefectures: prefectures_with_path, errors: [] }
  end

  def edit
    # find() raises an ActiveRecord::RecordNotFound if not found
    prefecture = Prefecture.find(params[:id])

    prefecture_with_links = {
      **prefecture.attributes,
      member_prefecture_path: admin_prefecture_path(prefecture.id),
      all_prefectures_path: admin_prefectures_path
    }

    render inertia: { prefecture: prefecture_with_links, errors: [] }
  end

  def update
    # implement later, for now just want to redirect to prefecture page
    puts update_params

    redirect_to admin_prefecture_url(params[:id]), inertia: { errors: {} }
  end

  def show
    # find() raises an ActiveRecord::RecordNotFound if not found
    prefecture = Prefecture.find(params[:id])

    prefecture_with_links = {
      **prefecture.attributes,
      edit_prefecture_path: edit_admin_prefecture_path(prefecture.id),
      all_prefectures_path: admin_prefectures_path,
      view_municipalities_path: admin_prefecture_municipalities_path(prefecture.id)
    }

    render inertia: { prefecture: prefecture_with_links, errors: [] }
  end

  private

  def update_params
    params.require(:prefecture).permit(:eng_name, :alphanumeric_eng_name, :kanji_name, :kana_name)
  end
end
