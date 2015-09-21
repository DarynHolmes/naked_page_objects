module FulcrumSpecsLib
  module Sections
    module Product
      # Encapsulates a component in the Photography Worklist Details page
      class ProductOverviewSection
        include Capybara::DSL

        def initialize(locator)
          @locator = locator
          fail "Could not find the Product Overview section with locator #{@locator}" unless has_css?(@locator)
        end

        def linked_pids
          within(@locator) do
            find('.linked_pids_list').text
          end
        end

        def select_linked_pid(pid)
          within(@locator) do
            click_link pid.to_s
          end
        end
      end
    end
  end
end
