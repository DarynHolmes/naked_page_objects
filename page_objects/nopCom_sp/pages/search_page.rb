class SearchPage < SitePrism::Page

  set_url '/search'

  element find('#q'), '#q'
  element :search_button, '.search-input .search-button'

  sections :results, ItemSection, '.item-box'

  def search(text)
    find('#q').set(text)
    search_button.click
    results
  end

end