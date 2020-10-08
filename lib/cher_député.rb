require 'nokogiri'
require 'open-uri'
require 'pry'

def prenom_depute
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  array_list_depute = []

  lists_depute = page.xpath('//td[1]/a')
  
  lists_depute.each do |prenom|
    new_prenom = prenom.text.split.drop (1)
    array_list_depute << new_prenom.first
  end


 print array_list_depute
end


def nom_depute
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))
  array_name_depute = []

  lists_depute = page.xpath('//td[1]/a')

  lists_depute.each do |nom|
    new_nom = nom.text.split.drop (2)
    array_name_depute << new_nom
    end

    print array_name_depute
  end

 def list_url_deputy
  page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/tableau"))

  array_list_deputy_url =[]

  page.xpath('//tr/td/a').each do |link|

    array_list_deputy_url << link ["href"] [1..-1]
  end
    puts array_list_deputy_url

    return array_list_deputy_url
  end


def email_deputy (list_url_deputy)

  array_email_deputy = []

  5.times do |i|
    page2: Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/#{list_url_deputy[i]}"))
    mail = page2.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
  end
    array_email_deputy << mail.text
  
    puts array_email_deputy
 end

email_deputy
