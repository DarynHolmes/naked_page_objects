module FulcrumSpecsLib
  module Pages
    module General
      # Encapsulates page implementation details
      class LoginPage < FulcrumSpecsLib::Pages::BasePage
        def initialize
          super('/user/login')
        end

        def login(username, password)
          fill_in 'username', with: username
          fill_in 'password', with: password
          click_button 'Log In'
          FulcrumSpecsLib::Pages::General::SummaryPage.new
        end
      end
    end
  end
end
