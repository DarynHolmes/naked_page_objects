module FulcrumSpecsLib
  module Extensions
    # Utility to check the current URL
    module CurrentSession
      include Capybara::DSL

      def actual_url
        uri = URI.parse(current_url)
        uri.path
      end
    end
  end
end
