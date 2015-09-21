class SearchPage
  include Capybara::DSL

  def initialize
    @url = '/search'
  end

  def load
    visit @url
  end

  def search(text)
    search_field.set(text)
    search_button.click
  end

  # private

  def search_field
    find('#q')
  end

  def search_button
    find('.search-input .search-button')
  end

end