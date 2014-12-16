class ShopController < ApplicationController
  layout "sales_clerk"
  include OfficeHelper

  force_ssl :if => :has_ssl? , :only => :sign_out
  
  def welcome
    @groups = Category.online.where( :category_id => nil )
    render :layout => false
  end

  def product
    @product = Product.shop_products.where(:link => params[:link]).first
    unless @product
      redirect_to :action => :group 
      return
    end
    @group = @product.category
  end

  # the checkout page creates an order upon completion. So before a checkout the basket is attached to the session
  # and by filling out all data an order is created with the basket and the session zeroed
  def checkout
    @order = Order.new :ordered_on => Date.today
    @order.basket = current_basket
    if(request.get?)
      @order.email = current_clerk.email if current_clerk
      @order.shipment_type = "pickup" # price is 0 automatically
    else
      order_ps = params.require(:order).permit( :email,:name , :street , :city , :phone , :shipment_type )
      @order.assign_attributes(order_ps)
      if (!params[:validation].blank?) and @order.save
        new_basket
        OrderMailer.confirm(@order).deliver
        session[:order] = @order.id
        redirect_to shop_order_path, :notice => t(:thanks)
        return
      else
        flash.now.notice = I18n.t(:must_accept) if params[:validation].blank?
      end
    end
  end

  def order
    if( session[:order])
      @order = Order.find( session[:order] )
    elsif clerk = current_clerk
      @order = clerk.last_order
    end
    if @order.blank?
      redirect_to sign_in_path , :notice => "No order found, please log in"
      return
    end
  end

  def history
    clerk = current_clerk
    unless clerk
      redirect_to office.sign_in_path
      return
    end
  end

  def add
    prod = Product.find( params[:id]) # no id will raise which in turn will show home page
    current_basket.add_product(prod)
    if request.get?
      redirect_to shop_checkout_path
    else
      flash.notice = "#{t(:product_added)}: #{prod.name}"
      redirect_to shop_group_path(prod.category.link)
    end
  end
  def remove
    prod = Product.find( params[:id]) # no id will raise which in turn will show home page
    current_basket.add_product(prod , -1)
    redirect_to shop_checkout_path
  end

  def main
    @groups = Category.online.where( :category_id => nil )
  end

  def group
    @group = Category.online.where(:link => params[:link]).first 
    return redirect_to(shop_main_path) unless @group
    @products = @group.shop_products
    @groups = @group.categories.online
  end

  def page
    @products = Product.shop_products.limit(50)
    template = params[:id]
    if template.blank?
      redirect_to root_path
    else
      render "page/#{template}"
    end
  end

end
