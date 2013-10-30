require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "TupacBot"
channel = "#bitmaker"
greeting_prefix = "privmsg #{channel} :"
commands = ["hello", "hi", "hola", "yo", "wazup", "guten tag", "howdy", "salutations", "who the hell are you?"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Holla if ya hear me!"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  # was_greeted = false
  # commands.each do |c|
  #   asked_for_song = true if msg.include?(g)
  # end

  if msg.include?("hit em up")
          response = "Grab your glocks when you see 2Pac!"
          irc_server.puts "PRIVMSG #{channel} :#{response}"
  elsif msg.include?("biggie")
          response = "* Shoots Biggie *"
          irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
end