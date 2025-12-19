class Admin::PrefecturesController < ApplicationController
  def index
    render inertia: { user: 1 }
  end

  def edit
    render inertia: { user: 1 }
  end

  def show
    prefecture = Prefecture.find(params[:id])

    puts "hello? " + prefecture.kanji_name

    render inertia: { user: 2 }
  end
end
