class ToolTypesController < ApplicationController
  
  def index
    @tool_types = ToolType.all
  end

  def show
    @tool_type = ToolType.find(params[:id])
  end

end
