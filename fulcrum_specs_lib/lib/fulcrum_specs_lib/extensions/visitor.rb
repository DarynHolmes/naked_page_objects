module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # Handles loading a page and verifying that the page is showing
    module Visitor
      include Capybara::DSL

      def register_url(url)
        @_registered_url = url
      end

      def registered_url
        fail 'The URL for this page has not been set' unless @_registered_url
        @_registered_url
      end

      def visit
        page.visit registered_url # page is from capybara
        fail_unless_page_is_displayed
        self
      end

      def displayed?
        uri = URI.parse(current_url)
        uri.path == registered_url
      end

      def fail_unless_page_is_displayed
        fail "Expected to be on #{registered_url} but was on #{URI.parse(current_url).path}" unless displayed?
      end

      alias_method :refresh, :visit # do this last to prevent aliasing the Capybara visit
    end
  end
end
