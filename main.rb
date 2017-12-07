require 'sinatra'
require 'sinatra/reloader' if development?
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
  elevator = params_json['elevator']
  # if elevator['capacity'] > 3
  #   target_level = most_requested_floor(elevator['target_floors'])
  # else
  target_level = (elevator['current_floor'] += 1) % 15
  # end

  target_level.to_json
end

def most_requested_floor(floors)
  counts = floors.inject(Hash.new(0)) { |h, v| h[v] += 1; h }
  floors.max_by { |v| counts[v] }
end

