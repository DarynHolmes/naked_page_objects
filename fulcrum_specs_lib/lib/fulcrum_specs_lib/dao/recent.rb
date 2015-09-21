module FulcrumSpecsLib
  module Dao
    # CRUD operations
    class Recent < ActiveRecord::Base
      self.table_name = 'recent'

      def self.most_recent_thrird_party_sku_audit_entry(variant_id: variant_id)
        Dao::Recent.order('timestamp DESC').where(table_name: 'third_party_sku', audit_id: variant_id).first
      end
    end
  end
end
