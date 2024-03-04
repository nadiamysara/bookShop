module HomeHelper
  def format_name(user)
    if user.admin == true
      "Back Mr. #{user.full_name}"
    else
      "Mt. #{user.full_name}"
    end
  end
end
