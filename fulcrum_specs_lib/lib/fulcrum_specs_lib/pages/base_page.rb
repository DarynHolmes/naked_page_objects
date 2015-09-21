module FulcrumSpecsLib
  module Pages
    # The super class for all page objects
    class BasePage
      include Capybara::DSL
      include FulcrumSpecsLib::Extensions
      include FulcrumSpecsLib::Extensions::ActIfSupplied
      include FulcrumSpecsLib::Extensions::Waitron
      include FulcrumSpecsLib::Extensions::Visitor
      include FulcrumSpecsLib::Extensions::CapybaraUtilities
      include FulcrumSpecsLib::Extensions::UserSession
      include FulcrumSpecsLib::Extensions::Release
      include FulcrumSpecsLib::Extensions::Navigator
      include FulcrumSpecsLib::Extensions::SectionsCollector

      def initialize(url)
        register_url(url)
      end
    end
  end
end
