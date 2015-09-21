module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # Used for a brief delay to make sure an element is on the page
    module Waitron
      include Capybara::DSL

      def wait_for(locator: locator, raise_exception: true)
        if has_selector?(locator)
          true
        elsif raise_exception
          fail "Time out waiting for #{locator}"
        else
          false
        end
      end

      # Taken from the first comment here: https://coderwall.com/p/aklybw/wait-for-ajax-with-capybara-2-0
      def wait_for_ajax
        Timeout.timeout(Capybara.default_wait_time) do
          loop do
            active = page.evaluate_script('jQuery.active')
            break if active == 0
          end
        end
      end
    end
  end
end
