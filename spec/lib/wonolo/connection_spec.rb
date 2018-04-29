require 'spec_helper'
require 'rails_helper'
require 'wonolo/connection'

RSpec.describe Connection do
  let(:conn) { Connection.new }

  it 'returns the base url for the wonolo platform api' do
    expect(Connection::BASE_URL).to eql('https://api-test.wonolo.com/api_v2')
  end

  it 'returns a connection object' do
    expect(conn.api).to be_instance_of(Faraday::Connection)
  end

  it 'sets api_token on object initiation' do
    expect(conn.token).not_to be_nil
  end

  it 'does not call assign_token when token is active' do
    conn.instance_variable_set(:@token_expiry, Time.now + 1.day)
    expect(conn).not_to receive(:assign_token)
    conn.api_token
  end

  it 'returns api_token that was already obtained' do
    conn.instance_variable_set(:@token_expiry, Time.now + 1.day)
    conn.instance_variable_set(:@token, 'dummy')
    expect(conn.api_token).to eql('dummy')
  end

  it 'calls the assign_token method when token expires' do
    conn.instance_variable_set(:@token_expiry, Time.now - 1.minute)
    expect(conn).to receive(:assign_token).once
    conn.api_token
  end

  it 'sets new api_token when the old token expires' do
    conn.instance_variable_set(:@token_expiry, Time.now - 1.minute)
    conn.instance_variable_set(:@token, 'dummy')
    conn.api_token
    expect(conn.token_expiry).to be > Time.now
  end
end
