require 'sinatra'
require 'sinatra/reloader' if development?
require_relative 'elevator'
require 'json'

get '/' do
  'This is a sample elevator'
end

post '/decide' do
  content_type :json
  # {"elevator"=>{"capacity"=>6, "current_floor"=>13, "target_floors"=>[14, 14, 14, 14, 14, 14], "statistics"=>120}, "floors"=>[{"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>true, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>true, "down"=>true}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>true}}, {"panel"=>{"up"=>false, "down"=>false}}, {"panel"=>{"up"=>false, "down"=>true}}]}
  params_json = JSON.parse(request.body.read)

  # Do the calculations
  puts "Got: \n#{params_json}"
  elevator = Elevator.new(params_json['elevator'], params_json['floors'])
  target_level = elevator.floor

  target_level.to_json
end


