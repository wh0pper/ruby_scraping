class CoursesController < ApplicationController
  def index
    course_names = scrapeCourses
    @courses = []
    course_names.each do |x|
      Course.create(name: x)
    end
    @courses = Course.all
    render :index
  end

  def show
    @course = Course.find(params[:id])
    scrapeWeeks(@course)
    @weeks = Week.all
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

  def scrapeWeeks(course)
    url = "https://www.learnhowtoprogram.com/#{course.name.downcase}"
    doc = Nokogiri::HTML(open(url))
    doc.css('.sections-list > .section > a').each_with_index do |x, i|
      week = Week.create(description: x.text, number: i, course_id: course.id)
      # binding.pry
    end
  end
end
