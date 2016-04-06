module ApplicationHelper
  def header_active(controller)
    return 'active' if controller == params[:controller]
    return ''
  end
end
