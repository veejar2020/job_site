require 'spec_helper'

RSpec.describe Wonolo::User do

	it 'has errors attr_accessor via super' do
		obj = Wonolo::User.new
		expect(obj).to respond_to(:errors)
		expect(obj).to respond_to(:errors=)
	end

	it 'has first_name attr_accessor' do
		obj = Wonolo::User.new
		expect(obj).to respond_to(:first_name)
		expect(obj).to respond_to(:first_name=)
	end

	it 'has last_name attr_accessor' do
		obj = Wonolo::User.new
		expect(obj).to respond_to(:last_name)
		expect(obj).to respond_to(:last_name=)
	end

	it 'has email attr_accessor' do
		obj = Wonolo::User.new
		expect(obj).to respond_to(:email)
		expect(obj).to respond_to(:email=)
	end

end