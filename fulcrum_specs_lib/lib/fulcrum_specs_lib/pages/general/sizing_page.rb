module FulcrumSpecsLib
  module Pages
    module General
      # Encapsulates page implementation details for the global sizing page
      # This is different to the product sizing page
      class SizingPage < FulcrumSpecsLib::Pages::BasePage
        SCHEME_CSS = "div[id^='scheme_']"
        LABEL_CSS = "div[id^='label_']"

        def initialize
          super('/sizing')
        end

        def select_label_by_id(id)
          click_button id
          wait_for(locator: SCHEME_CSS) # wait for page to load
          self
        end

        def scheme_names
          all(SCHEME_CSS).map(&:text)
        end

        def schemes_with_labels
          rows = all('.row').map { |r| r }
          rows = rows.drop(2) # ignore the first two are headers
          schemes_with_labels = {}
          rows.each { |row| schemes_with_labels[row.find(SCHEME_CSS).text.chomp] = row.all('button').map(&:text) }
          schemes_with_labels
        end

        def navigate_to_all_schemes
          click_link 'All schemes'
          self
        end
      end
    end
  end
end
