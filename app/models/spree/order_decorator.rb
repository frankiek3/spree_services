Spree::Order.class_eval do
  has_many :line_items, -> { order('created_at ASC') }, dependent: :destroy, inverse_of: :order, :after_add => :update_prices_item, :after_remove => :update_prices_item
  #self.after_add_for_line_items = [:update_prices_item]
  after_save :update_prices

  def update_prices
    @price_updated ||= []
    if @price_updated.length < line_items.size
      line_items.each do |item|
        unless @price_updated.include?(item.id)
          item.save if item.valid? && item.changed?
          @price_updated << item.id
        end
      end
      #line_items.all.map(&:valid?)
    end
  end

  def update_prices_item(item)
    update_prices
  end

  def service?
    line_items.all? { |item| item.service? }
  end

  def some_service?
    line_items.any? { |item| item.service? }
  end

  def service_line_items
    line_items.select(&:service?)
  end

  def grouped_quantities
    #@service_quantities ||= {}
    line_items.select(&:service?).group_by(&:service).map{|s, items| [s.id, items.sum{|i| i.quantity}] }.to_h
    #service_line_items.group_by{|item| "#{item.variant.service}"}
  end

end
