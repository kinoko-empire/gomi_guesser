class Admin::DashboardController < ApplicationController
  def index
    prefectures_path = admin_prefectures_path
    items_path = admin_items_path

    render inertia: { prefectures_path: prefectures_path, items_path: items_path }
  end
end
