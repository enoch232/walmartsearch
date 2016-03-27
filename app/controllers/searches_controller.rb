class SearchesController < ApplicationController
  def index
  	#render plain: params[:url]

  end
  def new
  	require 'nokogiri'
  	require 'open-uri'
  	url = "http://www.walmart.com/search/?query=#{params[:search][:URL]}"
  	doc = Nokogiri::HTML(open(url))
  	doc.css('.js-product-title').each do |content|
  		@titles ||= ""
  		@titles = @titles +".."+ content.text
  	end
  	@titles = @titles.split("..")
  end

end
