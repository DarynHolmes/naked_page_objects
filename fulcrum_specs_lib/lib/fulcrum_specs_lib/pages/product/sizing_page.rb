module FulcrumSpecsLib
  module Pages
    module Product
      # Encapsulates page implementation details
      class SizingPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Extensions::Waitron

        SKU_PREFIX = 'third_party_sku_'
        NOTIFICATION = '.notifyjs-container'

        def initialize(args)
          pid = args[:pid]
          fail 'No pid was supplied to SizingPage' unless pid
          super("/product/#{pid}/sizing")
        end

        def update_skus(args)
          entries = [args].flatten # supports a single hash, or an array of hashes
          entries.each do |entry|
            fill_in(SKU_PREFIX + entry[:variant_id].to_s, with: entry[:sku])
            wait_for_ajax
          end
          find("input[name='update_button']").click
        end

        def sku_update_messages
          include_hidden_elements do
            wait_for_notification
            messages = {}
            all("div[name^='#{SKU_PREFIX}']").each do |sku_region|
              sku_id = find_sku_id(sku_region)
              messages[sku_id] = find_notification_message(sku_region)
            end
          end
        end

        private

        def find_notification_message(sku_region)
          notification = sku_region.first(NOTIFICATION)
          notification.nil? ? '' : notification.text(:all)
        end

        def find_sku_id(sku_region)
          sku_field_id = sku_region.first("div[name^='#{SKU_PREFIX}'] input")[:id]
          sku_field_id.delete(SKU_PREFIX).to_i
        end

        def wait_for_notification
          wait_for(locator: NOTIFICATION, raise_exception: false)
        end
      end
    end
  end
end
