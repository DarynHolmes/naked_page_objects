module FulcrumSpecsLib
  module Sections
    module BuyGroup
      module Sizing
        # Encapsulates a component in the Photography Worklist Details page
        class DcPricingSection
          include FulcrumSpecsLib::Extensions::Waitron
          include Capybara::DSL

          def initialize(index: index)
            @index = index
            @locator = css(index: index)
            fail "Could not find the DC Pricing section with locator #{@locator}" unless has_css?(@locator)
          end

          def pid
            first(@locator).find('.pid').text # can't use within(@locator) here, it results in an Ambiguous match error
          end

          def enabled_for(dc: dc)
            wait_for_ajax
            using_wait_time 0 do
              channel_index = channel_index(dc: dc)
              within(css(index: channel_index)) do
                has_css?("input[name*=#{dc}]:not([disabled])")
              end
            end
          end

          def available_for(dc: dc)
            wait_for_ajax
            using_wait_time 0 do
              channel_index = channel_index(dc: dc)
              within(css(index: channel_index)) do
                has_css?("input[name*=#{dc}]")
              end
            end
          end

          def total_units_for(dc: dc)
            wait_for_ajax
            channel_index = channel_index(dc: dc)
            css_locator = css(index: channel_index)
            within(css_locator) do
              find('.targetunits').text.to_i
            end
          end

          def actual_units_for(dc: dc)
            wait_for_ajax
            channel_index = channel_index(dc: dc)
            css_locator = css(index: channel_index)
            within(css_locator) do
              find('.actualunits').text.to_i
            end
          end

          def sizes_for(dc: dc)
            wait_for_ajax
            channel_index = channel_index(dc: dc)
            css_locator = css(index: channel_index)
            within(css_locator) do
              all('th').map(&:text)
            end
          end

          def size_amount_for(dc: dc, size: size)
            sizes = sizes_for(dc: dc)
            size_index = sizes.index(size)
            fail "The specified size of #{size} was not found in #{dc}" if size_index.nil?
            channel_index = channel_index(dc: dc)
            css_locator = css(index: channel_index)
            within(css_locator) do
              all('input[name^=size]')[size_index].value.to_i
            end
          end

          def enter_size_amount_for(dc: dc, size: size, amount: amount)
            sizes = sizes_for(dc: dc)
            size_index = sizes.index(size)
            fail 'The specified size was not found' if size_index.nil?
            channel_index = channel_index(dc: dc)
            css_locator = css(index: channel_index)

            within(css_locator) do
              all('input[name^=size]')[size_index].set(amount)
            end
          end

          private

          def css(index: index)
            "tbody tr.dc_pricing:nth-child(#{index})"
          end

          def channel_index(dc: dc)
            @index + case dc
                     when 'DC1'
                       0
                     when 'DC2'
                       1
                     when 'DC3'
                       2
                     end
          end
        end
      end
    end
  end
end
