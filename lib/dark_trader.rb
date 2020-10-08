 require 'nokogiri'
 require 'open-uri'

def cryptocurrencies_scrapping

  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
array_lists_cryptocurrencies =[]
  lists_cryptocurrencies = page.xpath('//td[2]/div')
    lists_cryptocurrencies.each do |crypto|
      array_lists_cryptocurrencies << crypto.text
    end
    return array_lists_cryptocurrencies
end

def values_scrapping

  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
array_lists_values=[]
  lists_values = page.xpath('//td[5]/a')
    lists_values.each do |values|
      new_values =values.text.delete!'$'','
      array_lists_values << new_values.to_f
    end
    return array_lists_values
end

def hash_in_array
  new_array_lists_values = values_scrapping
  new_array_liste_crypto = cryptocurrencies_scrapping  
  array_of_hash = []
    new_array_liste_crypto.each_with_index do |x, y|
      array_of_hash << {x => (new_array_lists_values)[y]}
    end
  print array_of_hash
end

hash_in_array
 


