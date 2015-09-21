module FulcrumSpecsLib
  module Pages
    module Photography
      # Encapsulates page implementation details
      class WorkListDetailsPage < FulcrumSpecsLib::Pages::BasePage
        include FulcrumSpecsLib::Sections::Photography

        def initialize(args)
          worklist_id = args[:worklist_id]
          fail 'No worklist_id was supplied to WorkListDetailsPage' unless worklist_id
          super("/photography/#{worklist_id}/view")
        end

        def pids
          all('.showicon').map { |elm| elm.text.delete('PID ').to_i }
        end

        def product_section(pid)
          fail "Could not find pid #{pid} on #{url}" unless first('.pid', text: pid)
          index = all('.pid').index { |elem| elem.text.include?(pid.to_s) }
          locator = "#photography_worklist_details tbody tr:nth-child(#{(index + 1)})"
          ProductSection.new(locator)
        end
      end
    end
  end
end
