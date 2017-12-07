# frozen_string_literal: true

require File.expand_path '../spec_helper.rb', __FILE__

describe 'The simple main app' do
  it 'allows access to the home page' do
    get '/'
    expect(last_response).to be_ok
  end

  it 'allows to access the decider' do
    post '/decide', { 'elevator' => { 'capacity' => 6, 'current_floor' => 13, 'target_floors' => [2, 3, 4, 4, 10, 11], 'statistics' => 120 }, 'floors' => [{ 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => true, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => true, 'down' => true } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => true } }, { 'panel' => { 'up' => false, 'down' => false } }, { 'panel' => { 'up' => false, 'down' => true } }] }.to_json
    expect(last_response.body.to_i).to eq 4
  end
end
