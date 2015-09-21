module FulcrumSpecsLib
  module Sections
    module BuyGroup
      module OrderCandidates
        class OrderCandidateSection < FulcrumSpecsLib::Sections::BaseSection

          def order_number
            include_hidden_elements do
              within(@locator) do
                find('input[name=order_number]').value.to_i
              end
            end
          end

          def dc
            include_hidden_elements do
              within(@locator) do
                find('input[name=dc]').value
              end
            end
          end

          def po_number
            within(@locator) do
              find('input[name=purchase_order_number]').value
            end
          end

          def enter_po_number(text)
            within(@locator) do
              find('input[name=purchase_order_number]').set(text)
            end
          end

          def enter_ship_origin(text)
            within(@locator) do
              find('.ship_origin input').set(text)
              first(".ship_origin div[data-value='#{text}']").click
            end
          end

          def enter_payment_terms(text)
            within(@locator) do
              find('select[name=payment_terms_urn]').click
              first('select[name=payment_terms_urn] option', text: /\A#{text}\z/).click
            end
          end

          def enter_deposit(text)
            within(@locator) do
              select text, from: 'payment_deposit_id'
            end
          end

          def enter_settlement(text)
            within(@locator) do
              select text, from: 'settlement_urn'
            end
          end

          def enter_supplier(text)
            within(@locator) do
              find('.supplier_select input').set(text)
              first('.supplier_select .selectize-dropdown-content div').click
            end
          end

          def enter_landed_terms(text)
            within(@locator) do
              find('select[name=landed_terms_urn]').click
              first('select[name=landed_terms_urn] option', text: /\A#{text}\z/).click
            end
          end

          def enter_additional_terms(text)
            within(@locator) do
              select text, from: 'additional_terms_urn'
            end
          end

          def place_order
            within(@locator) do
              click_button 'Place order'
            end
          end

          def save
            within(@locator) do
              click_button 'Save changes'
            end
          end
        end
      end
    end
  end
end
