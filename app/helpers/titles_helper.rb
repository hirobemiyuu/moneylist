module TitlesHelper
  def total_fee(title)
    @fee = 0
    title.items.each do |item|
      @fee += item.price
    end
    return @fee
  end
end
