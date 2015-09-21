class ItemSection
  include Capybara::DSL

  def initialize(locator)
    raise "Could not find ItemSection with #{locator}" unless has_css?(locator)
    @locator = locator
  end

  def price
    within(@locator) do
      find('.price').text
    end
  end

end