class Admin::MunicipalitiesController < ApplicationController
  def index
    municipalities_list = Municipality.order(:alphanumeric_eng_name).where(prefecture_id: params[:prefecture_id])

    municipalities_with_path = municipalities_list.map do |m|
      { **m.attributes, municipality_path: admin_municipality_path(m.id) }
    end

    render inertia: { municipalities: municipalities_with_path, errors: [] }
  end

  def show
    # find() raises an ActiveRecord::RecordNotFound if not found
    municipality = Municipality.find(params[:id])

    municipality_with_links = {
      **municipality.attributes,
      all_prefecture_municipalities_path: admin_prefecture_municipalities_path(municipality.prefecture_id)
    }

    render inertia: { municipality: municipality_with_links }
  end
end
