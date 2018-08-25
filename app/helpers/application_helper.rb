module ApplicationHelper

  def set_path(path)
    user_signed_in? ? path : new_user_session_path
  end

end
