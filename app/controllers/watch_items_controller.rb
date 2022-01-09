class WatchItemsController < ApplicationController
  def create
    @watch_item = current_user.watch_items.find_or_initialize_by(watch_item_params)
    authorize(@watch_item)
    @watch_item.save!

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @watch_item = current_user.watch_items.find(params[:id])
    authorize(@watch_item)
    @watch_item.destroy!

    redirect_back(fallback_location: root_path)
  end

  def update
    @watch_item = WatchItem.find(params[:id])
    authorize(@watch_item)
    @watch_item.update!(watch_item_update_params)

    redirect_back(fallback_location: root_path)
  end

  def watch_item_params
    params.permit(:film_id, :status)
  end

  def watch_item_update_params
    params.permit(:status)
  end
end
