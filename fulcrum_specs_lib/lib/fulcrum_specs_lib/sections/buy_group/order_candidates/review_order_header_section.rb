module FulcrumSpecsLib
  module Sections
    module BuyGroup
      module OrderCandidates
        # Encapsulates a component in the Photography Worklist Details page
        class ReviewOrderHeaderSection
          include Capybara::DSL
          # include FulcrumSpecsLib::Extensions::CapybaraUtilities

          def initialize(locator)
            @locator = locator
            fail "Could not find the Review Order section with locator #{@locator}" unless has_css?(@locator)
          end

          def po_number
            within(@locator) do
              find('h2').text
            end
          end

          # Use an ID in the html to make these easier to access

          def ship_origin
            extract_text 'Ship origin'
          end

          def settlement
            extract_text 'Settlement'
          end

          def supplier
            extract_text 'Supplier'
          end

          def landed_terms
            extract_text 'Landed terms'
          end

          def placed_by
            extract_text 'Placed by'
          end

          def deposit
            extract_text 'Deposit'
          end

          def fulcrum_user
            extract_text 'Fulcrum user'
          end

          def payment_terms
            extract_text 'Payment terms'
          end

          def date
            extract_text 'Date', '.col-md-4'
          end

          def additional_terms
            extract_text 'Additional terms'
          end

          def xt_import_status
            extract_text 'XT import status'
          end

          private

          def extract_text(label, css = '.col-md-2')
            search_text = "#{label}: "
            within(@locator) do
              elem = all(css).find { |div| div.text.include? search_text }
              elem.text.gsub(search_text, '')
            end
          end
        end
      end
    end
  end
end
