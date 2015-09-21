module FulcrumSpecsLib
  module Pages
    module General
      # Encapsulates page implementation details
      class SummaryPage < FulcrumSpecsLib::Pages::BasePage
        def initialize
          super('/summary')
        end
      end
    end
  end
end
