require 'nokogiri'
require 'open-uri'


def mairie_val_d_oise_scrapping
page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
array_list_mairie = []
list_mairie = page.xpath('//tr/td[position() >= 1 and position() <= 3]/p/a').each do |values|
    array_list_mairie << values.text.downcase
  end
  puts array_list_mairie
end

mairie_val_d_oise_scrapping

def email_scrapping
page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"))

end





# //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[3]/p/a[61]
# /html/body/table/tbody/tr[4]/td 
# /html/body/table/tbody/tr[2]/td/table/tbody/tr/td[2]
# //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]


# ///table/tbody/tr[2]/td/table/tbody/tr/td #ableige
# ///table/tbody/tr[2]/td/table/tbody/tr/td[3]/p/a[61] #wy dit joly village
# /html/body/table/tbody/tr[2]/td/table/tbody/tr/td[1]/div/a # l'annuaire


