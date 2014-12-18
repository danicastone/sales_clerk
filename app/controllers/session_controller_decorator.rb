SessionsController.class_eval do
  layout "sales_clerk"

  def redirect_after_sign_up
    redirect_to main_app.root_url, :notice => t(:signed_up)
  end
  def redirect_after_sign_in
    redirect_to main_app.root_url, :notice => t(:signed_in)
  end

end
