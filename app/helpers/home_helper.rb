module HomeHelper
  def format_name(user)
    if user.admin == true
      "Back Mr. #{user.name}"
    else
      "User #{user.name}"
    end
  end
end
