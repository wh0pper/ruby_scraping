class CoursesController < ApplicationController
  def index
    @course_names = scrapeCourses
    render :index
  end

  # def show
  #   @course =
  # end

  def scrapeCourses
    doc = Nokogiri::HTML(open('https://www.learnhowtoprogram.com/courses'))
    list = []
    doc.css('.container > .row > .col-xs-12 > form > ul > li').map do |x|
      list << x.text.strip
    end
    return list
  end

end
