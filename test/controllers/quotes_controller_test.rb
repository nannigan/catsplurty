require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = Quote.create(:author => 'Krazed Meower', :saying => 'You only yowl once.')
    get :show, :id => quote.id
    assert_response :success
  end

	test "quote show page, not found" do
		get :show, :id => 'OMG' #has to be number so we know 404
		assert_response :not_found
	end
end
