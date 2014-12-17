require 'spec_helper'

describe "shop order handling"  do
  it "redirects from order when there is no order" do
    visit shop_order_path
    ensure_path office.sign_in_path
  end
  it "redirects from order when there is no order when logged" do
    sign_in
    visit shop_order_path
    ensure_path office.sign_in_path
  end
  it "redirects when accessing history without login" do
    visit shop_history_path
    ensure_path office.sign_in_path
  end
  it "redirects from history when no orders" do
    sign_in
    visit shop_history_path
    ensure_path root_path
  end
  it "shows history when loged in and orders" do
    clerk = sign_in
    create :order, :email => clerk.email
    visit_path shop_history_path
  end
end
