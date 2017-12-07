require_relative '../elevator'
require File.expand_path '../spec_helper.rb', __FILE__

RSpec.describe Elevator do
  it 'returns the next floor where there are people waiting' do
    json_params = { 'elevator' => { 'capacity' => 6,
                                    'current_floor' => 6,
                                    'target_floors' => [2, 3],
                                    'statistics' => 120 },
                    'floors' => [{ 'panel' => { 'up' => false, 'down' => false } }, # 0
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 1
                                 { 'panel' => { 'up' => true, 'down' => false } }, # 2
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 3
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 4
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 5
                                 { 'panel' => { 'up' => true, 'down' => true } }, # 6
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 7
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 8
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 9
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 10
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 11
                                 { 'panel' => { 'up' => false, 'down' => true } }, # 12
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 13
                                 { 'panel' => { 'up' => false, 'down' => true } } # 14
                    ] }
    expect(described_class.new(json_params['elevator'], json_params['floors']).floor).to eq 2
  end

  it 'returns the next floor where there are people waiting' do
    json_params = { 'elevator' => { 'capacity' => 6,
                                    'current_floor' => 6,
                                    'target_floors' => [2, 3],
                                    'statistics' => 120 },
                    'floors' => [{ 'panel' => { 'up' => false, 'down' => false } }, # 0
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 1
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 2
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 3
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 4
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 5
                                 { 'panel' => { 'up' => true, 'down' => true } }, # 6
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 7
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 8
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 9
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 10
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 11
                                 { 'panel' => { 'up' => false, 'down' => true } }, # 12
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 13
                                 { 'panel' => { 'up' => false, 'down' => true } } # 14
                    ] }
    expect(described_class.new(json_params['elevator'], json_params['floors']).floor).to eq 12
  end

  it 'goes to the most wanted floor if we have at least 4 people' do
    json_params = { 'elevator' => { 'capacity' => 6,
                                    'current_floor' => 6,
                                    'target_floors' => [2, 3, 3, 3],
                                    'statistics' => 120 },
                    'floors' => [{ 'panel' => { 'up' => false, 'down' => false } }, # 0
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 1
                                 { 'panel' => { 'up' => true, 'down' => false } }, # 2
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 3
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 4
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 5
                                 { 'panel' => { 'up' => true, 'down' => true } }, # 6
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 7
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 8
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 9
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 10
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 11
                                 { 'panel' => { 'up' => false, 'down' => true } }, # 12
                                 { 'panel' => { 'up' => false, 'down' => false } }, # 13
                                 { 'panel' => { 'up' => false, 'down' => true } } # 14
                    ] }
    expect(described_class.new(json_params['elevator'], json_params['floors']).floor).to eq 3
  end
end
