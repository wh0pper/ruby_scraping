
class ContentController < ApplicationController
  # def scrapeCourses
  #
  # end

  
  def scrape
    doc = Nokogiri::HTML(open('https://www.learnhowtoprogram.com/rails/ruby-on-rails-basics/database-scopes-and-queries'))
    @lesson_paragraphs = []
    @lesson_codes = []
    @lesson_titles = []
    doc.css('.tab-pane').children.map do |x|
      @lesson_paragraphs << x.text
    end
    render :lesson
  end

end
