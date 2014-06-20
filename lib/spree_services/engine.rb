module SpreeServices
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_services'


#    initializer "spree.spree_services.preferences", :after => "spree.environment" do |app|
#      Spree::ServiceTypesConfiguration = Spree::SpreeServiceTypesConfiguration.new
#    end

#    initializer "spree.register.service_shipping", :after => 'spree.register.calculators' do |app|
#      app.config.spree.calculators.shipping_methods << Spree::Calculator::Shipping::DigitalDelivery
#    end

    initializer 'spree_services.custom_spree_splitters', :after => 'spree.register.stock_splitters' do |app|
      app.config.spree.stock_splitters << Spree::Stock::Splitter::Services
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc

  end
end
