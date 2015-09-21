module FulcrumSpecsLib
  module Dialogs
    module BuyGroup
      # Encapsulates page implementation details for a Dialog pop-up window
      class Dialog
        include FulcrumSpecsLib::Extensions::Waitron

        def initialize(locator: locator)
          @locator = locator
          fail "Could not find the BuyGroup Order Candidate dialog with locator #{@locator}" unless has_css?(@locator)
        end

        def title
          wait_for_ajax
          find('.bootstrap-dialog-title').text
        end

        def message
          wait_for_ajax
          find('.bootstrap-dialog-message').text
        end
      end
    end
  end
end
