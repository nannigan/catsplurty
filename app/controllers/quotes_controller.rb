class QuotesController < ApplicationController
	def index
		@quote = Quote.order("RANDOM()").first
	end

	def create
		 @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<em>Uh oh...</em> try again, the data you entered is invalid.'
    end
		redirect_to root_path
	end

	def show
		#@quote = Quote.find(params,[:id])
		# see TDD lesson p.4-- find makes all fail if 404 test is writtne
	@quote = Quote.where(:id => params[:id]).first
		# where the id is the params id get the first one--longhand
		if @quote.blank?
      render :text => "Not Found", :status => :not_found
    end
	end

	def about

	end

#what is private here?
  private

	def quote_params
		params.require(:quote).permit(:saying, :author, )
	end
end
