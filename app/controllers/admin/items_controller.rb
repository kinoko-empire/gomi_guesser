class Admin::ItemsController < ApplicationController
  def index
    all_items = Item.order("lower(eng_name)")

    items_with_paths = all_items.map do |i|
      { **i.attributes, item_path: admin_item_path(i.id) }
    end

    render inertia: { items: items_with_paths, new_item_path: new_admin_item_path }
  end

  def new
    render inertia: { admin_items_path: admin_items_path }
  end

  def create
    new_item = Item.create(item_params)

    if new_item.save
      redirect_to admin_items_path, notice: "Item created successfully: #{new_item.eng_name}"
    else
      redirect_to new_admin_item_path, inertia: { errors: new_item.errors.full_messages }
    end
  end

  def edit
    item = Item.find(params[:id])

    item_path = admin_item_path(params[:id])

    item_with_links = {
      **item.attributes,
      member_item_path: item_path
    }

    render inertia: { item: item_with_links }
  end

  def update
    existing_item = Item.find(params[:id])

    if existing_item.update(item_params)
      redirect_to admin_item_path(existing_item.id), notice: "Item updated successfully!"
    else
      redirect_to edit_admin_item_path(existing_item.id), inertia: { errors: existing_item.errors.full_messages }
    end
  end

  def show
    item = Item.find(params[:id])

    item_with_links = {
      **item.attributes,
      items_index_path: admin_items_path,
      item_edit_path: edit_admin_item_path(item.id),
      item_path: admin_item_path(item.id)
    }

    render inertia: { item: item_with_links }
  end

  def destroy
    item = Item.find(params[:id])

    if item.destroy
      redirect_to admin_items_path, notice: "Item deleted: #{item.eng_name}"
    else
      redirect_to edit_admin_item_path(item.id), inertia: { errors: existing_item.errors.full_messages }
    end
  end

  # this should go in something like items_rules_controller.rb - relates municipalities to items
  # allow someone can mass copy rules from one municipality to another
  # def copy_rules(item_ids_array_or_just_items, new_municipality_id)
  #   # make sure new_municipality_id references a row in the db
  #   # make sure item_ids in item_ids_array also all exist? or can send all the required data in the request so don't need to look them up in db?
  #   # don't need to copy created_at, updated_at, etc
  # end

  private

  def item_params
    params.expect(item: [ :eng_name, :kanji_name, :kana_name ])
  end
end
