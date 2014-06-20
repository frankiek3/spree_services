module Spree
  module Admin
    class ServiceFieldsController < ResourceController
      def destroy
        @service_field = Spree::ServiceField.find(params[:id])
        @service_field.destroy
        render :nothing => true
      end
    end
  end
end
