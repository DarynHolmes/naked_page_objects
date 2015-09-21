module FulcrumSpecsLib
  module Pages
    module BuyGroup
      # Encapsulates page implementation details
      class SizingPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Sections::BuyGroup::Sizing

        def initialize(buy_group_id: buy_group_id)
          super("/buying/buygroup/#{buy_group_id}/sizing")
        end

        def mark_for_reorder(pid: pid)
          select 'To Be Re-Ordered', from: "review_#{pid}_buying_status_id"
          self
        end

        def save
          click_button 'Save'
          self
        end

        def pricing_sections
          count = all('tbody tr.dc_pricing').size
          list = []
          addthree(count - 3) do |i|
            list << DcPricingSection.new(index: i + 1)
          end
          list
        end

        def top_up_pricing_sections
          pricing_sections.each do |pricing_section|
            top_up_size_amounts_if_required(pricing_section: pricing_section, dc: 'DC1')
            top_up_size_amounts_if_required(pricing_section: pricing_section, dc: 'DC2')
            top_up_size_amounts_if_required(pricing_section: pricing_section, dc: 'DC3')
          end

          self
        end

        private

        def top_up_size_amounts_if_required(pricing_section: pricing_section, dc: dc)
          return unless pricing_section.enabled_for(dc: dc)
          total_units = pricing_section.total_units_for(dc: dc)
          actual_units = pricing_section.actual_units_for(dc: dc)
          return if total_units == actual_units
          sizes = pricing_section.sizes_for(dc: dc)
          size_amount = pricing_section.size_amount_for(dc: dc, size: sizes[0])
          top_up_amount = total_units + size_amount - pricing_section.actual_units_for(dc: dc)
          pricing_section.enter_size_amount_for(dc: dc, size: sizes[0], amount: top_up_amount)
        end

        def addthree(max)
          # Return a sequence incremented by three up to the max.
          i = 0
          while i <= max
            yield i
            i += 3
          end
        end
      end
    end
  end
end
