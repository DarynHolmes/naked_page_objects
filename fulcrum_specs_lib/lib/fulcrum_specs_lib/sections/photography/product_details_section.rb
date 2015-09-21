module FulcrumSpecsLib
  module Sections
    module Photography
      # Encapsulates a component in the Photography Worklist Details page
      class ProductDetailsSection
        include Capybara::DSL

        def initialize(locator)
          @locator = locator
          fail "Could not find ProductDetails section with locator #{@locator}" unless has_css?(@locator)
        end

        def flagged_as_linked?
          within(@locator) do
            has_css?('.linked_pids_flag')
          end
        end

        def linked_pids
          within(@locator) do
            all('.linked_pids_list a').map { |elm| elm.text.to_i }
          end
        end
      end
    end
  end
end
