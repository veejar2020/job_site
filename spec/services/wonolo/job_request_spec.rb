require 'spec_helper'

RSpec.describe Wonolo::JobRequest do
	it 'has errors attr_accessor via super' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:errors)
		expect(obj).to respond_to(:errors=)
	end

	it 'has request_name attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:request_name)
		expect(obj).to respond_to(:request_name=)
	end

	it 'has id attr_reader' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:id)
		expect(obj).to respond_to(:id=)
	end

	it 'has description attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:description)
		expect(obj).to respond_to(:description=)
	end

	it 'has classification attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:classification)
		expect(obj).to respond_to(:classification=)
	end

	it 'has wage attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:wage)
		expect(obj).to respond_to(:wage=)
	end

	it 'has start_time attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:start_time)
		expect(obj).to respond_to(:start_time=)
	end

	it 'has duration attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:duration)
		expect(obj).to respond_to(:duration=)
	end

	it 'has address attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:address)
		expect(obj).to respond_to(:address=)
	end

	it 'has city attr_accessor' do
		obj = Wonolo::JobRequest.new
		expect(obj).to respond_to(:city)
		expect(obj).to respond_to(:city=)
	end

	it 'should return list of job requests' do
		response = Wonolo::JobRequest.list(1)
		expect(response).to be_an(Array)
		expect(response.first).to be_an_instance_of(Wonolo::JobRequest)
	end

end