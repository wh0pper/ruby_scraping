class ContentController < ApplicationController
  def scrape
    require 'openssl'
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.learnhowtoprogram.com/rails/ruby-on-rails-basics/database-scopes-and-queries', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @lesson_paragraphs = []
    @lesson_codes = []
    @lesson_titles = []
    doc.css('.tab-pane').children.map do |x|
      @lesson_paragraphs << x.text
    end
    binding.pry
    render :lesson
  end

end
