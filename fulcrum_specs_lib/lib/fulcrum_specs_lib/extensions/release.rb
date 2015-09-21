module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # Used to find Fulcrums build number from the footer
    module Release
      include Capybara::DSL

      def build
        find('#footer p').text
      end
    end
  end
end
