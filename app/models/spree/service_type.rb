module Spree
  class ServiceType < Spree::Base
    has_many :variants, class_name: 'Spree::Variant', inverse_of: :service
    has_many :service_fields, :dependent => :destroy
    has_many :volume_prices, -> { order("position ASC") }, :dependent => :destroy
    accepts_nested_attributes_for :volume_prices, :allow_destroy => true,
      :reject_if => proc { |volume_price|
        volume_price[:amount].blank? && volume_price[:range].blank?
    }
    accepts_nested_attributes_for :service_fields, :allow_destroy => true,
      :reject_if => proc { |service_field|
        service_field[:name].blank?
    }

    validates :name, presence: true

  end
end
