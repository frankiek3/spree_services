Spree::Admin::OrdersController.class_eval do
  def notify_customer
    load_order

    #@order.email notify_customer
    flash[:notice] = Spree.t(:notified_customer, scope: 'service_types')

    redirect_to spree.admin_order_path(@order)
  end
end
