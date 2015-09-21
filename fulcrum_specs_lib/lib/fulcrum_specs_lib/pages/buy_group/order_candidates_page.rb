module FulcrumSpecsLib
  module Pages
    module BuyGroup
      # Encapsulates page implementation details
      class OrderCandidatesPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Sections::BuyGroup::OrderCandidates
        include FulcrumSpecsLib::Dialogs::BuyGroup

        def initialize(buy_group_id: buy_group_id)
          super("/buying/buygroup/#{buy_group_id}/order_candidates")
        end

        def purchase_order_sections
          sections(OrderCandidateSection, '.content form')
        end

        def dialog_box
          Dialog.new(locator: '.modal-dialog')
        end
      end
    end
  end
end
