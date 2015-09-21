require_relative '../test_helper'


describe 'Search results' do
  include Capybara::DSL

  def setup

  end

  it 'should show the price of an item' do
    visit '/search'
    # search for apple
  end

  it 'should show the title of an item' do
    visit '/search'


  end

end
