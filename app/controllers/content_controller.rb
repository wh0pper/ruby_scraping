class ContentController < ApplicationController
  def scrape
    require 'openssl'
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.learnhowtoprogram.com/rails/ruby-on-rails-basics/database-scopes-and-queries', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    lesson_test = doc.css('.tab-pane')
    binding.pry
    render :lesson
  end

end
