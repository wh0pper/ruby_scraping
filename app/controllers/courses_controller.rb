class CoursesController < ApplicationController
  def index
    course_names = scrapeCourses
    @courses = []
    course_names.each do |x|
      course = Course.create(name: x)
    end
    # binding.pry
    @courses = Course.all
    render :index
  end

  def show
    @course = Course.find(params[:id])
  end

  def scrapeCourses
    doc = Nokogiri::HTML(open('https://www.learnhowtoprogram.com/courses'))
    course_names = []
    # course_links = []
    doc.css('.container > .row > .col-xs-12 > form > ul > li').map do |x|
      course_names << x.text.strip
      # course_links << x.css('a')[0]['href']
    end

    return course_names #, course_links
  end

end
