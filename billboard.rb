require 'socket'
require 'nokogiri'
require 'open-uri'

server = "chat.freenode.net"
port = "6667"
nick = "BillboardBot"
channel = "#bitmaker"

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Type 'chart' to see the Top 5 songs on the Billobard Hot 100!"


until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg


  if msg.include?("chart")
    page = Nokogiri::HTML(open("http://www.billboard.com/charts/hot-100/"))

    song1 = "#1: " + page.css('h1')[1].text.rstrip  + " by " + page.css('p a')[1].text
    song2 = "#2: " + page.css('h1')[2].text.rstrip  + " by " + page.css('p a')[2].text
    song3 = "#3: " + page.css('h1')[3].text.rstrip  + " by " + page.css('p a')[3].text
    song4 = "#4: " + page.css('h1')[4].text.rstrip  + " by " + page.css('p a')[4].text
    song5 = "#5: " + page.css('h1')[5].text.rstrip  + " by " + page.css('p a')[5].text
    songs = [song1, song2, song3, song4, song5]

    songs.each { |s| irc_server.puts "PRIVMSG #{channel} : #{s}" }
    end

end



