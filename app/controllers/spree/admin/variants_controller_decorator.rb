Spree::Admin::VariantsController.class_eval do
  before_filter :service, :only => [:edit]

  def service
    @service_types = Spree::ServiceType.all
  end

  private

  # this loads the variant for the master variant volume price editing
  def load_resource_instance
    parent

    if new_actions.include?(params[:action].to_sym)
      build_resource
    elsif params[:id]
      Spree::Variant.find(params[:id])
    end
  end

  def location_after_save
    if @product.master.id == @variant.id and params[:variant].has_key? :service
      return service_admin_product_variant_url(@product, @variant)
    end

    super
  end

  def setup_services
    @service_types = Spree::ServiceType.all
  end

end
