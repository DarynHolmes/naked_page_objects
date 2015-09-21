module FulcrumSpecsLib
  module Dao
    # CRUD operations
    class Variant < ActiveRecord::Base
      self.table_name = 'variant'
      belongs_to :product
      belongs_to :third_party_sku, class_name: 'ThirdPartySku'
      accepts_nested_attributes_for :third_party_sku
    end
  end
end
