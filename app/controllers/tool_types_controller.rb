class ToolTypesController < ApplicationController

  def index
    @tool_types = ToolType.all
  end

  def show
    if ToolType.is_a_tool_type?(params[:tool_type])
      @tool_type = ToolType.find_by(name: params[:tool_type].capitalize)
    else
      flash[:error] = "We do not carry this type of tool. Please select from the existing options."
      redirect_to root_path
    end
  end

end
