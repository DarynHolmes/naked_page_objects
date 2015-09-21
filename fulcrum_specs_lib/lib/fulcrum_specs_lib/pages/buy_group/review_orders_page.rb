module FulcrumSpecsLib
  module Pages
    module BuyGroup
      # Encapsulates page implementation details
      class ReviewOrdersPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Sections::BuyGroup::OrderCandidates
        # include FulcrumSpecsLib::Dialogs::BuyGroup

        def initialize(buy_group_id: buy_group_id)
          super("/buying/buygroup/#{buy_group_id}/review_orders")
        end

        def order_details_sections
          index_buffer = 4 # the first form is at nth-child 4
          skip_amout = 3   # the amount of child elements between each section
          list = []
          elem_list = all('.box-order-details')

          elem_list.each_with_index do |_element, index|
            nth_child_index = index_buffer + (index * skip_amout)
            locator = ".box-order-details:nth-child(#{nth_child_index})"
            list << ReviewOrderHeaderSection.new(locator)
          end
          list
        end

        def dialog_box
          Dialog.new(locator: '.modal-dialog')
        end
      end
    end
  end
end
