require 'nokogiri'
require 'open-uri'
require 'net/smtp'
require 'gmail'
require 'time'
garcia = Nokogiri::HTML(open('https://sites.google.com/site/msbgarciawh/hgs43xw---advanced-placement-world-history/hwx3-homework'))
#garcia.xpath("//b/span[@style='color:rgb(255,0,0)']").each do |hw|
    raw=hw.parent.parent.text

class Task < Struct.new(:content, :subject, :date, :notes)
    def time
        Time.parse @time
    end
    def self.submit(content, date='tod', subject='', notes='')
        Gmail.new('jake.waksbaum', 'yosef622') do |gmail|
            gmail.deliver do
                to 'Homework <project.102307597@todoist.net>'
                subject content
                body "<date #{date}> notes"
            end
        end
    end
end