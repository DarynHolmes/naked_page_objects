module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # It is a wrapper for capybara methods
    # It performs the action if data is supplied
    module ActIfSupplied
      include Capybara::DSL

      def fill_in_if_supplied(locator, data)
        fill_in locator, with: data if data
      end

      def select_if_supplied(locator, data)
        select data, from: locator if data
      end

      def find_and_set_if_supplied(locator, data)
        find(locator).set(true) if data
      end
    end
  end
end
