require 'spec_helper'
require 'rails_helper'
require 'wonolo/request'
require 'wonolo/connection'

RSpec.describe Request do
  it 'returns an existing connection object if present' do
    obj_id = Request.connection.object_id
    expect(Request.connection.object_id).to eql(obj_id)
  end

  it 'returns a valid response on the right path' do
    response = Request.get('info')
    expect(response).to be_a(Hash)
    expect(response).to have_key('utc_time_now')
  end

  it 'returns a error response on the wrong path' do
    response = Request.get('invalid_path')
    expect(response).to be_a(Hash)
    expect(response).to have_key(:errors)
  end

  it 'returns a valid response on the right path with query' do
    response = Request.get('jobs', { page: 1, per: 1 })
    expect(response).to be_a(Hash)
    expect(response).to have_key('jobs')
  end

  it 'returns a error response on the wrong path with query' do
    response = Request.get('invalid_path', { page: 1, per: 1 })
    expect(response).to be_a(Hash)
    expect(response).to have_key(:errors)
  end
end
