require 'nokogiri'
require 'open-uri'



page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/haute-savoie.html"))
links = page.css("a.lientxt")
liste = links.each{|departement|
	a = "http://annuaire-des-mairies.com" + departement['href'].slice!(1..33)
#	puts a
	mailv = Nokogiri::HTML(open(a))
	mailv.css('p:contains("@")').each do |node|
		puts node.text
	end

}


