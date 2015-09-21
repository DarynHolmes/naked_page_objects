module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # It is a wrapper for capybara methods
    module CapybaraUtilities
      include Capybara::DSL

      def include_hidden_elements
        Capybara.ignore_hidden_elements = false
        yield
    ensure
      Capybara.ignore_hidden_elements = true
      end
    end
  end
end
