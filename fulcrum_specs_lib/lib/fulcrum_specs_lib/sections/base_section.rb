module FulcrumSpecsLib
  module Sections
    class BaseSection
      include Capybara::DSL
      include FulcrumSpecsLib::Extensions::CapybaraUtilities

      def initialize(locator)
        @locator = locator
        fail "Could not find the section for #{self.class} with locator #{@locator}" unless has_css?(@locator)
      end
    end
  end
end