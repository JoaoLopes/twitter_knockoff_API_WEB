module ApplicationHelper

  def pushOutput(msg)
    @output ||= Array.new
    @output.push(msg)
  end
  
end
