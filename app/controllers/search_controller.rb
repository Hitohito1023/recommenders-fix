class SearchController < ApplicationController

	def search
		@genres = Genre.all
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = PostItem.search_for(@content, @method)
		end
	end

end
