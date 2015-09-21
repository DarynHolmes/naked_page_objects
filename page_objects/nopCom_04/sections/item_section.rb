class ItemSection < FulcrumSpecsLib::Sections::BaseSection

  def price
    within(@locator) do
      find('.price').text
    end
  end

end