module FulcrumSpecsLib
  # Database Access Object
  module Dao
    # CRUD operations
    class Product < ActiveRecord::Base
      self.table_name = 'product'
      has_many :variants
      accepts_nested_attributes_for :variants

      def self.find_product_with_variants(min_amount)
        product_identifiers = FulcrumSpecsLib::Dao::Variant.select(:product_id)
                                  .group(:product_id)
                                  .having("count(*) >= #{min_amount}")
        fail "No products could be found with #{min_amount} or more variants" if product_identifiers.length == 0
        FulcrumSpecsLib::Dao::Product.find(product_identifiers.first.product_id)
      end

      # quick and dirty hack to get the business id
      # The real solution is to navigate to the correct table
      # We are still deciding if we want to access the database from the test code
      def business_id
        variants.each do |variant|
          return variant.third_party_sku.business_id if variant.third_party_sku
        end
        fail "Unable to find the business_id for product #{id}"
      end

      def destroy_all_skus
        variants.each do |variant|
          if variant.third_party_sku
            variant.third_party_sku_id = nil
            save!
          end
          FulcrumSpecsLib::Dao::ThirdPartySku.destroy_all(variant_id: variant.id)
        end
      end
    end
  end
end
