require_relative '../elevator'
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe Elevator do
  def json_params
    { 'elevator' => { 'capacity' => 6,
                      'current_floor' => 6,
                      'target_floors' => [2, 3],
                      'statistics' => 120 },
      'floors' => [{ 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => true, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => true, 'down' => true } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => true } },
                   { 'panel' => { 'up' => false, 'down' => false } },
                   { 'panel' => { 'up' => false, 'down' => true } }
      ] }
  end
  it 'returns the next floor where there are people waiting' do
    expect(described_class.new(json_params['elevator'], json_params['floors']).floor).to eq 12
  end
end
