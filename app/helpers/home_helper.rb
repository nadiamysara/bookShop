module HomeHelper
  def format_name(user)
    if user.admin == true
      "Back Mr. #{user.name}"
    else
      "Mt. #{user.name}"
    end
  end
end
