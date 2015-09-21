module FulcrumSpecsLib
  module Pages
    module General
      # Encapsulates page implementation details
      class SearchPage < FulcrumSpecsLib::Pages::BasePage
        STOCK_MAP_LABEL_TO_ID = {
          'All' => 'all',
          'Stock' => 'stock',
          'Samples' => 'vendor'
        }

        MEDIA_MAP_LABEL_TO_ID = {
          'Screen' => 'screen',
          'Excel/CSV' => 'excel'
        }

        DISCOUNT_MAP_LABEL_TO_ID = {
          'all' => 'all',
          'discount' => 'discount',
          'not discounted' => 'notdiscount'
        }

        # The css nth-child index
        LIVE_MAP_LABEL_TO_INDEX = {
          'all' => '2',
          'live' => '4',
          'not live' => '6'
        }
        # The css nth-child index
        VISIBLE_MAP_LABEL_TO_INDEX = {
          'all' => '2',
          'visible' => '4',
          'not visible' => '6'
        }

        def initialize
          super('/product')
        end

        def search(data = {})
          basic_search(data)
          find('.fakelink').click
          advanced_search(data)
          find('[name=action]').click
          FulcrumSpecsLib::Pages::General::SearchResultPage.new
        end

        private

        # rubocop:disable Metrics/AbcSize
        # There does not seem to be another way of reducing the ABC size
        # without introducing 'artificial' complexity
        def basic_search(data)
          fill_in_if_supplied('product_id', data['Product Id'])
          select_if_supplied('designer_id', data['Designer'])
          select_if_supplied('season_id', data['Season'])
          select_if_supplied('season_act_id', data['Act'])
          select_if_supplied('product_department_id', data['Department'])
          fill_in_if_supplied('keywords', data['Keywords'])
          fill_in_if_supplied('style_ref', data['Style Ref'])
          fill_in_if_supplied('sku', data['Legacy Sku'])
          select_if_supplied('channel_id', data['Channel'])
          find_and_set_if_supplied(stock_locator(data), data['Stock / Sample'])
        end

        def advanced_search(data)
          select_if_supplied('colour_id', data['Colour'])
          select_if_supplied('colour_filter_id', data['Colour Filter'])
          select_if_supplied('classification_id', data['Classification'])
          select_if_supplied('product_type_id', data['Product Type'])
          select_if_supplied('subtype_id', data['Sub Type'])
          find_and_set_if_supplied(media_locator(data), data['Media'])
          find_and_set_if_supplied(discount_locator(data), data['Discount'])
          find_and_set_if_supplied(live_locator(data), data['Live'])
          find_and_set_if_supplied(visible_locator(data), data['Visible'])
        end
        # rubocop:enable Metrics/AbcSize

        def visible_locator(data)
          "[name=visible]:nth-child(#{VISIBLE_MAP_LABEL_TO_INDEX[data['Visible']]})"
        end

        def live_locator(data)
          "[name=live]:nth-child(#{LIVE_MAP_LABEL_TO_INDEX[data['Live']]})"
        end

        def discount_locator(data)
          "[name=discount][value=#{DISCOUNT_MAP_LABEL_TO_ID[data['Discount']]}]"
        end

        def media_locator(data)
          "[name=media_type][value=#{MEDIA_MAP_LABEL_TO_ID[data['Media']]}]"
        end

        def stock_locator(data)
          "[name=stockvendor][value=#{STOCK_MAP_LABEL_TO_ID[data['Stock / Sample']]}]"
        end
      end
    end
  end
end
