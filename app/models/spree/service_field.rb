module Spree
  class ServiceField < Spree::Base
    belongs_to :service_type, :touch => true
#    acts_as_list :scope => :service_type
    validates :name, presence: true
#    validates :service_type, :presence => true
  end
end
