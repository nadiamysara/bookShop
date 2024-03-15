module PaymentsHelper
  def g_order_number(user)
    time = Time.new
    a = time.strftime("%Y%m%d%H%M%S")
    b = user.to_s
    #c = rent.to_s
    return string = a + b
  end
end
