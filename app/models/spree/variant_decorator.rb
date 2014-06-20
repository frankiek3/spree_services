Spree::Variant.class_eval do
  belongs_to :service, class_name: 'Spree::ServiceType', inverse_of: :variants
  delegate :volume_prices, to: :service

  # calculates the price based on quantity
  def volume_price(quantity)
    if volume_prices.count == 0
      return price
    else
      volume_prices.each do |volume_price|
        if volume_price.include?(quantity)
          case volume_price.discount_type
          when 'price'
            return volume_price.amount
          when 'dollar'
            return price - volume_price.amount
          when 'percent'
            return price * (1 - volume_price.amount)
          end
        end
      end
      # No price ranges matched.
      return price
    end
  end

  # return percent of earning
  def volume_price_earning_percent(quantity)
    if volume_prices.count == 0
      return 0
    else
      volume_prices.each do |volume_price|
        if volume_price.include?(quantity)
          case volume_price.discount_type
          when 'price'
            diff = price - volume_price.amount
            return (diff * 100 / price).round
          when 'dollar'
            return (volume_price.amount * 100 / price).round
          when 'percent'
            return (volume_price.amount * 100).round
          end
        end
      end
      # No price ranges matched.
      return 0
    end
  end

  # return amount of earning
  def volume_price_earning_amount(quantity)
    if volume_prices.count == 0
      return 0
    else
      volume_prices.each do |volume_price|
        if volume_price.include?(quantity)
          case volume_price.discount_type
          when 'price'
            return price - volume_price.amount
          when 'dollar'
            return volume_price.amount
          when 'percent'
            return price - (price * (1 - volume_price.amount))
          end
        end
      end
      # No price ranges matched.
      return 0
    end
  end

end
