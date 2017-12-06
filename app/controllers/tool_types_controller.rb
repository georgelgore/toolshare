class ToolTypesController < ApplicationController

  def index
    @tool_types = ToolType.all
  end

  def show
    if params[:tool_type]
      @tool_type = ToolType.find_by(name: params[:tool_type])
    else
      @tool_type = ToolType.find(params[:id])
    end
  end

end
