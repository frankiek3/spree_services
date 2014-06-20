module Spree
  module Admin
    class ServiceTypesController < ResourceController
      before_filter :setup_service, :only => [:new, :edit]

      def update_volume_price_positions
        params[:positions].each do |id, index|
          Spree::VolumePrice.find(id).update_attributes(:position => index)
        end

        respond_to do |format|
          format.html { redirect_to spree.admin_service_types_path }
          format.js { render :text => 'Ok' }
        end
      end

      private

      def setup_service
        @service_type.service_fields.build if @service_type.service_fields.empty?
        @service_type.volume_prices.build if @service_type.volume_prices.empty?
      end

    end
  end
end
