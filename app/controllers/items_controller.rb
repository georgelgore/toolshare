class ItemsController < ApplicationController

  def index
    @locations = Location.all
    @tool_types = ToolType.all
    if params[:commit] == "Filter"
      @items = Item.all.select do |item|
          item.location.id == params[:location].to_i && item.cost_daily < params[:cost_daily_max].to_i && item.cost_daily > params[:cost_daily_min].to_i &&  item.tool_type_id == params[:tool_type].to_i
      end
    else
      @items = Item.all
    end

  end

  def show
      @item = Item.find(params[:id])
  end


  def item_location_equal_params?
    if params[:location]
      item.location.id == params[:location].to_i
    end
  end

end
