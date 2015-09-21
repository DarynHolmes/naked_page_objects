module FulcrumSpecsLib
  module Extensions
    # Utility to check if a user is logged in, and to log the user out
    module UserSession
      include Capybara::DSL
      include FulcrumSpecsLib::Pages

      def ensure_logged_out
        log_out if logged_in?
      end

      def ensure_logged_in
        General::LoginPage.new.visit.login('it.god', 'it.god') unless logged_in?
      end

      def logged_in?
        has_link?('Logout') || on_product_finder?
      end

      def on_product_finder?
        current_url.include?('finder')
      end

      def log_out
        FulcrumSpecsLib::Pages::General::SummaryPage.new.visit
        first('#user_status a').click
        FulcrumSpecsLib::Pages::General::LoginPage.new
      end
    end
  end
end
