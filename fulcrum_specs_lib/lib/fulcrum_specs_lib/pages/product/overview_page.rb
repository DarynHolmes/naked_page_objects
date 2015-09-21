module FulcrumSpecsLib
  module Pages
    module Product
      # Encapsulates page implementation details
      class OverviewPage < FulcrumSpecsLib::Pages::BasePage
        def initialize(args)
          pid = args[:pid]
          fail 'No pid was supplied to the OverviewPage' unless pid
          super("/product/#{pid}/overview")
        end
      end
    end
  end
end
