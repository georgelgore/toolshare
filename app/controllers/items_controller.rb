class ItemsController < ApplicationController

  def index
    @locations = Location.all
    @tool_types = ToolType.all
    if params[:commit] == "Filter"
      @items =
      Item.all & Item.filter_by_location(params[:location].to_i) & Item.filter_by_tool_type_id(params[:tool_type].to_i) & Item.filter_by_min_cost(params[:cost_daily_min].to_i) & Item.filter_by_max_cost(params[:cost_daily_max].to_i)
    else
      @items = Item.all
    end

  end

  def show
      @item = Item.find(params[:id])
  end



end
