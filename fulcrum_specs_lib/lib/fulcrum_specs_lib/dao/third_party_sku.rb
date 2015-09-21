module FulcrumSpecsLib
  module Dao
    # CRUD operations
    class ThirdPartySku < ActiveRecord::Base
      self.table_name = 'third_party_sku'
      belongs_to :variant
    end
  end
end
