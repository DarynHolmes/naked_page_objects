module FulcrumSpecsLib
  module Pages
    module Product
      # Encapsulates page implementation details
      class SoldAsASetPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Sections::Product

        def initialize(args)
          pid = args[:pid]
          fail 'No pid was supplied to SoldAsASetPage' unless pid
          super("/product/#{pid}/sold_as_a_set")
        end

        def contains_error?
          page.has_content?('Internal Fulcrum Error')
        end

        def unlink_pids
          update_linked_pids([])
        end

        def update_linked_pids(pids)
          fill_in 'products', with: pids.join(',')
          click_button 'Update linked collection'
          self
        end

        def linked_pids
          pids_str = find("input[name='products']").value.gsub(/\s+/, '') # remove all white space
          pids_str.split(',').map(&:to_i) # split into array then convert each element to an int
        end

        def product_overview_section
          ProductOverviewSection.new('#product_overview')
        end
      end
    end
  end
end
