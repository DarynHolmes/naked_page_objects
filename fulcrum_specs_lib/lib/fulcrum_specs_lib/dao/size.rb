module FulcrumSpecsLib
  module Dao
    # CRUD operations
    class Size < ActiveRecord::Base
      self.table_name = 'size'
    end
  end
end
