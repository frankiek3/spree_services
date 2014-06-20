module Spree
  module Stock
    module Splitter
      class Services < Base
        def split(packages)
          split_packages = []
          packages.each do |package|
            split_packages += split_by_service(package)
          end
          return_next split_packages
        end

        private
        def split_by_service(package)
          services = Hash.new { |hash, key| hash[key] = [] }
          package.contents.each do |item|
            services[item.variant.service.present?] << item
          end
          hash_to_packages(services)
        end

        def hash_to_packages(services)
          packages = []
          services.each do |id, contents|
            packages << build_package(contents)
          end
          packages
        end
      end
    end
  end
end
