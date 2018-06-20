class OrdersController < ApplicationController
  def index

  end
  def create
    @list = []
    all_ids = params[:ids]
    address1 = params[:line1]
    address2 = params[:line2]
    phone = params[:phone]
    all_ids = all_ids.split(",")
    all_ids.each do |i|
      if i != ""
        pizza = Pizza.find(i)
        @list.push(pizza)
      end
    end
    order = Order.create(user_id: nil)

    Deliveryinfo.create(order_id: order.id, line1: address1, line2: address2, phone: phone)
    @list.each do |l|
      OrderPizza.create(order_id:order.id, pizza_id: l.id)
    end
    cookies[:pizza_id] = nil
    flash[:order] = "Your order was created!"
    redirect_to '/'
  end
  def new
    @the_info = JSON.parse(params[:the_info])
    @list = []
    @total_price = 0
    all_ids = cookies[:pizza_id]
    all_ids = all_ids.split(",")
    all_ids.each do |i|
      if i != ""
        pizza = Pizza.find(i)
        @total_price += pizza.recipe.price + pizza.crust.price
        @list.push(pizza)
      end
    end
    @ids_data = ""
    all_ids.each do |i|
      @ids_data += i + ","
    end
  end
  def delivery_info_new
    @delivery_info = Deliveryinfo.new
  end
  def delivery_info_create
    info = params[:deliveryinfo]
    @the_info = Deliveryinfo.new(line1:info[:line1], line2:info[:line2], phone: info[:phone])
    redirect_to '/orders/new?the_info=' + @the_info.to_json
  end

end
