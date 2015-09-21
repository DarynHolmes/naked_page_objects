module FulcrumSpecsLib
  module Extensions
    # A mixin for a page object
    # Perform navigation in Fulcrum
    module Navigator
      include Capybara::DSL

      def navigate_to(nav_parent, nav_child, &block)
        within('.sf-menu') do
          click_link(nav_parent)
          click_link(nav_child)
        end
        block.call if block
      end
    end
  end
end
