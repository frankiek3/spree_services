Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_service_admin_tab",
                     :insert_bottom => "[data-hook='admin_product_tabs']",
                     :partial => "spree/admin/service/service_product_tab",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/variants/edit",
                     :name => "add_service_to_variant",
                     :insert_after => "[data-hook='admin_variant_edit_form']",
                     :partial => "spree/admin/service/edit_service",
                     :disabled => false)

#Deface::Override.new(:virtual_path => "spree/admin/variants/service",
#                     :name => "add_service_to_variant",
#                     :insert_after => "[data-hook='admin_variant_edit_form']",
#                     :partial => "spree/admin/service/service",
#                     :disabled => false)


Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "add_service_to_variant",
                     :insert_bottom => "[data-hook='admin_product_sub_tabs']",
                     :text => "<%= tab :service_types %>",
                     :disabled => false)
