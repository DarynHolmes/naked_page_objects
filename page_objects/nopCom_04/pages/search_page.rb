class SearchPage < FulcrumSpecsLib::Pages::BasePage

  def initialize
    super('/search')
  end

  def search(text)
    find('#q').set(text)
    find('.search-input .search-button').click
    results
  end

  def results
    sections(ItemSection, '.item-box')
  end



end