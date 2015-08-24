Spree::Stock::Quantifier.class_eval do

  def total_on_hand
    if @variant.service?
      service = @variant.service
      if service.limit == 1
        total = 0
      elsif service.limit == 2
        total = service.limit_amount
      #elsif service.limit == 3
      # total =  service.limit_amount - user_previous_order_number(variant)
      else
        total = Float::INFINITY
      end
      total
    elsif @variant.should_track_inventory?
      stock_items.sum(:count_on_hand)
    else
      Float::INFINITY
    end
  end

  def can_supply?(required)
    total_on_hand >= required || (backorderable? && !@variant.service?)
  end

end
