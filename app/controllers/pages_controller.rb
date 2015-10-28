class PagesController < ApplicationController
  def home
    @html_doc = Nokogiri::HTML("<html><body><h1>Mr. Belvedere Fan Club</h1></body></html>")
    @tmp = @html_doc.css("h1")[0].text

    #@doc = Nokogiri::HTML(open("http://www.24h.com.vn/bong-da/ozil-la-vua-kien-tao-premier-league-va-chau-au-c48a744243.html"))
    #@doc = File.open("app/views/shared/_doc.html") { |f| Nokogiri::HTML(f) }

    @doc = Nokogiri::HTML(File.open("app/views/shared/_doc.html")) do |config|
      config.nonet
    end
    logger.debug "count h1 \n #{@doc.css('h1').count}"
    @doc_xml = Nokogiri::XML(File.open("app/views/shared/shows.xml"))

    @doc_xml2 = Nokogiri::XML(File.read("app/views/shared/parts.xml"))
    @car_tires = @doc_xml2.xpath('//car:tire', 'car' => 'http://alicesautoparts.com/')
    @bike_tires = @doc_xml2.xpath('//bike:tire', 'bike' => 'http://bobsbikes.com/')
  end
end
