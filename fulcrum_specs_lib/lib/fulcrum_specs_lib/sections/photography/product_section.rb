module FulcrumSpecsLib
  module Sections
    module Photography
      # Encapsulates a component in the Photography Worklist Details page
      class ProductSection
        include Capybara::DSL

        def initialize(locator)
          @locator = locator
          fail "Could not find the Product section with locator #{@locator}" unless has_css?(@locator)
        end

        def product_details_section
          ProductDetailsSection.new("#{@locator} .product_details")
        end
      end
    end
  end
end
