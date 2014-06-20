require_dependency 'spree/shipping_calculator'

module Spree
  module Calculator::Shipping
    class DigitalService < FlatRate
      def self.description
        Spree.t("Digital Delivery")
      end

      def compute(object=nil)
        self.preferred_amount
      end

      def available?(package)
        package.contents.all? { |content| content.variant.service.present? }
      end
    end
  end
end
