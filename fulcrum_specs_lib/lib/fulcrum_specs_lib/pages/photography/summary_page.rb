module FulcrumSpecsLib
  module Pages
    module Photography
      # Encapsulates page implementation details
      class SummaryPage < FulcrumSpecsLib::Pages::BasePage
        def initialize
          super('/photography/summary')
        end

        def scheduled_worklists
          all('#tab1 > table:nth-child(2) > tbody tr').inject([]) do |worklist, row|
            cells = row.all('td')
            worklist << extract_worklist_data(cells)
          end
        end

        def select_worklist(text)
          click_link text
          worklist_id = URI.parse(current_url).path.split('/')[2]
          FulcrumSpecsLib::Pages::Photography::WorkListDetailsPage.new(worklist_id: worklist_id)
        end

        private

        def extract_worklist_data(cells)
          worklist = {}
          worklist['Due Date'] = cells[0].text
          worklist['Description'] = cells[1].text
          worklist['PIDs'] = cells[2].text
          worklist['Status'] = cells[3].text
          worklist
        end
      end
    end
  end
end
