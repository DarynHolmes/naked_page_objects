module FulcrumSpecsLib
  module Pages
    module General
      # Encapsulates page implementation details
      class SearchResultPage
        include Capybara::DSL
        include FulcrumSpecsLib::Extensions::UserSession

        def pids_on_page
          # The css matches the links in the pid links, and image links
          # Using n-th child does not work
          # Sometime there is no image link which breaks the nth-child index
          all_links = all("a[href*='overview']").select { |element| !element.text.empty? }
          all_links.map { |link| link.text.to_i }
        end
      end
    end
  end
end
