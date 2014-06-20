Spree::LineItem.class_eval do
  delegate :service, to: :variant

  def service?
    service.present?
  end

  def insufficient_stock?
    if service?# && changed? && changes.keys.include?('quantity')
      if service.limit == 1
        true
      elsif service.limit == 2 && quantity > service.limit_amount
        true
#      else if service.limit == 3 && quantity+user_previous_order_number(variant) > service.limit_amount
#        true
      else
        !sufficient_stock?
      end
    else
      !sufficient_stock?
    end
  end

  def service_quantity
#find_line_item_by_variant(variant)
    order.grouped_quantities[service.id]
  end


  old_copy_price = instance_method(:copy_price)
  define_method(:copy_price) do
    old_copy_price.bind(self).call

    if service?
      vprice = variant.volume_price(service_quantity)

      if price.present? && vprice < variant.price
        self.price = vprice
      elsif price.nil?
        self.price = variant.price
      else
        self.price = variant.price
      end
    end
  end

#    def copy_price
#      if variant
#        self.price = variant.price if price.nil?
#        self.cost_price = variant.cost_price if cost_price.nil?
#        self.currency = variant.currency if currency.nil?
#      end
#    end

  private


#changed?
#      def update_adjustments
#        if quantity_changed?
#          recalculate_adjustments
#        end
#      end
end
