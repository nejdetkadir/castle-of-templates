module ApplicationHelper
  def template_url(id)
    "rails app:template LOCATION=#{Setting.host}/script/#{id}"
  end

  def check_me(user)
    user_signed_in? && user.eql?(current_user)
  end
end
