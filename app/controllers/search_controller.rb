class SearchController < ApplicationController
  def index
       @q = params['q']
   return if @q.blank?
   @hits = Product.algolia_search(@q)
  end
end
