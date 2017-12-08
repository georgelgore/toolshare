class ToolType < ApplicationRecord
  has_many :items

  validates :name, presence: true


  def self.is_a_tool_type?(tool_type)
    if !ToolType.all.any?{|tool| tool.name == tool_type.capitalize}
      # errors.add(:This, "tool isn't available. Please select from the list below.")
      return false
    else
      return true
    end
  end

end
