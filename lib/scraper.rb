require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    students = []
    doc = Nokogiri::HTML(html)
    doc.css("div.roster-cards-container").css("div.student-card").each_with_index do |profile, index|
      student = {}
      students[index] = student
      student[:name] = profile.css("div.card-text-container").css("h4.student-name").inner_text.strip
      student[:location] = profile.css("div.card-text-container").css("p.student-location").inner_text.strip
      student[:profile_url] = profile.css("a").attribute("href").value
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    profile = {}
    doc = Nokogiri::HTML(html)
    doc.css("div.vitals-container").css("div.social-icon-container").css("a").attribute("href").each do |attribute|
      socials = []
      socials << attribute.value
    end
    socials
    binding.pry
  end

end
