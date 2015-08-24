Deface::Override.new(:virtual_path => "spree/orders/_line_item",
                     :name => "insert_break_before_line_item_description",
                     :insert_before => "[data-hook='line_item_description']",
                     :text => "<br/>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/orders/_line_item",
                     :name => "move_options_text",
                     :insert_bottom => "[data-hook='cart_item_description'] > h4",
                     :cut => "erb:contains('variant.options_text')",
                     :disabled => true)

Deface::Override.new(:virtual_path => "spree/orders/_line_item",
                     :name => "set_max_quantity_for_line_item",
                     :replace => "erb[loud]:contains('item_form.number_field :quantity')",
                     :text => "<% if variant.service.present? %><%= item_form.number_field :quantity, :min => 0, :class => 'line_item_quantity', :size => 5, :max => variant.service.limit_amount %><% else %><%= item_form.number_field :quantity, :min => 0, :class => 'line_item_quantity', :size => 5 %><% end %>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "add_volume_pricing_to_product",
                     :insert_after => "[class='add-to-cart']",
                     :partial => "spree/products/service_volume_prices",
                     :disabled => false)


Deface::Override.new(:virtual_path => "spree/products/_cart_form",
                     :name => "set_max_quantity_for_product",
                     :replace => "erb[loud]:contains('number_field_tag :quantity')",
                     :text => "<% if @product.master.service.present? %><%= number_field_tag :quantity, 1, :class => 'title', :min => 1, :max => @product.master.service.limit_amount %><% else %><%= number_field_tag :quantity, 1, :class => 'title', :min => 1 %><% end %>",
                     :disabled => false)

