module Spree
  module Admin
    class VolumePricesController < BaseController
      def destroy
        @volume_price = Spree::VolumePrice.find(params[:id])
        @volume_price.destroy
        render :nothing => true
      end
    end
  end
end
