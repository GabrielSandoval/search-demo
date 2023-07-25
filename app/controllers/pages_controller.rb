class PagesController < ApplicationController
  def index
    @query = params[:query]
    @results = ArticlesIndex.query(
      query_string: {
        fields: [:title],
        query: @query
      }
    ).as_json if @query.present?
  end
end
