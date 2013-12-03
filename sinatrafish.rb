require 'sinatra'
require 'Open3'

get '/' do
  Open3.popen3('./stockfish') do |i,o,e,t|
    i.puts("position fen #{params[:fen]}")
    puts o.gets
    i.puts("go")
    puts o.gets
    puts o.gets
    move = o.gets
    puts move
    return move.split(' ')[1]
  end
end
