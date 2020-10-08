require 'nokogiri'
require 'open-uri'


def array_listes_communes
array_email = []
   page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
 
   page.xpath('//p/a[@class="lientxt"]').each do |link|
       array_email << link["href"][1..-1]
   end
   puts array_email
   return array_email
  end

def list_email # nouvelle def qui reprends celle du dessus 

  array_list_email =[] #créer une nouvelle array

  array_listes_communes.length.times do |i| #création d'une boucle que prend en compte la longueure 
      page3 = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/#{array_listes_communes[i]}"))
      email = page3.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
      array_list_email << email
  end
  puts array_list_email
  return array_list_email

end
list_email
