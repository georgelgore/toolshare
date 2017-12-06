class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    if params["item"]
      @tool_type = Item.find_by(name: params[:name])
    else
      @item = Item.find(params[:id])
    end
  end

end
