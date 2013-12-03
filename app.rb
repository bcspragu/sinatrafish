require 'rubygems'
require 'sinatra'
require 'Open3'

get '/' do
  Open3.popen3('./stockfish') do |i,o,e,t|
    i.puts("position fen #{params[:fen]}")
    o.gets
    i.puts("go")
    o.gets
    o.gets
    return o.gets.split(' ')[1]
  end
end
