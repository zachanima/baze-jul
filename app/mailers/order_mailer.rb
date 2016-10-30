class OrderMailer < ActionMailer::Base
  add_template_helper ApplicationHelper

  default from: 'user@baze.dk'

  def receipt(order)
    @order = order
    @customer = @order.customer
    @shop = @customer.shop

    mail to: @customer.email, subject: "#{@shop.title}: Du har valgt gaven \"#{@order.product.title}\""
  end
end
