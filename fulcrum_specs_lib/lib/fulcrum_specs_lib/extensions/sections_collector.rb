module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # Handles loading a page and verifying that the page is showing
    module SectionsCollector
      include Capybara::DSL

      def sections(claz, locator)
        list = []
        all(locator).each_with_index do |_item, index|
          section_locator = "#{locator}:nth-of-type(#{index + 1})"
          list << claz.new(section_locator)
        end
        list
      end
    end
  end
end
