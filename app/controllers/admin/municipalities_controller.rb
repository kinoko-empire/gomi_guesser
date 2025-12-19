class Admin::MunicipalitiesController < ApplicationController
  def index
    municipalities_list = Municipality.all

    municipalities_list.each do |m|
      p m.as_json
    end

    render inertia: { user: 1 }
  end

  def edit
    render inertia: { user: 1 }
  end

  def show
    municipality = Municipality.find(params[:id])

    puts "hello? " + municipality.kanji_name

    render inertia: { user: 2 }
  end
end
