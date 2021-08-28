module ApplicationHelper
  def template_url(id)
    "rails app:template LOCATION=#{Setting.host}/script/#{id}"
  end

  def check_current_user(user)
    user_signed_in? && user.eql?(current_user)
  end

  def check_like(user, template)
    Liked.exists?(user: user, template: template)
  end
end
