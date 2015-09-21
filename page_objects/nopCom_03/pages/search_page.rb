class SearchPage
  include Capybara::DSL

  def initialize
    @url = '/search'
  end

  def load
    visit @url
    fail "Expected to be on #{@url} but was on #{URI.parse(current_url).path}" unless displayed?
    self
  end

  def displayed?
    URI.parse(current_url).path == @url
  end

  def search(text)
    search_field.set(text)
    search_button.click
    results
  end

  def results
    all('.item-box').each_with_index.map  { | element, index | ItemSection.new(".item-box:nth-of-type(#{index+1})") }
  end

  private

  def search_field
    find('#q')
  end

  def search_button
    find('.search-input .search-button')
  end

end