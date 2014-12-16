require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "unique_tag" do 
		quote = FactoryGirl.create(:quote,  :author => 'Cruella Zodiac')
		# what ia that value....puts quote.inspect  
		expected = 'CZ#' + quote.id.to_s
		actual = quote.unique_tag
		assert_equal expected, actual
		# RoR wants expected first actual second in this statement
  end
end
