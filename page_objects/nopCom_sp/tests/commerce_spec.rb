require_relative '../test_helper'


describe 'Search results' do
  include Capybara::DSL

  def setup

  end

  it 'should show the price of an item' do
    search_page = SearchPage.new
    search_page.load

    # results = search_page.search('apple')
    search_page.search_field.set('apple')
    search_page.search_button.click
    results = search_page.results

    # assert_equal('$1,300.00', results.first.price, 'The price was not correct')
    assert_equal('$1,300.00', results.first.price.text, 'The price was not correct')
  end

  it 'should show the title of an item' do
    visit '/search'

    find('#q').set('apple')
    find('.search-input .search-button').click

    title = within('.item-box:nth-of-type(2)') do
              find('.product-title a').text
            end

    assert_equal('Apple MacBook Pro 13-inch', title, 'The title was not correct')
  end
end
