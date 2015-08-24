Spree::LineItem.class_eval do
  delegate :service, to: :variant

  def service?
    service.present?
  end

  def service_quantity
    #find_line_item_by_variant(variant)
    g = order.grouped_quantities
    if g.key?(service.id)
      g[service.id]
    else
      0
    end
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
