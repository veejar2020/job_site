require 'spec_helper'

RSpec.describe Wonolo::Job do

	it 'has errors attr_accessor via super' do
		obj = Wonolo::Job.new
		expect(obj).to respond_to(:errors)
		expect(obj).to respond_to(:errors=)
	end

	it 'has finished_at attr_accessor' do
		obj = Wonolo::Job.new
		expect(obj).to respond_to(:finished_at)
		expect(obj).to respond_to(:finished_at=)
	end

	it 'has w2_hourly_rate attr_accessor' do
		obj = Wonolo::Job.new
		expect(obj).to respond_to(:w2_hourly_rate)
		expect(obj).to respond_to(:w2_hourly_rate=)
	end

	it 'has worker attr_accessor' do
		obj = Wonolo::Job.new
		expect(obj).to respond_to(:worker)
		expect(obj).to respond_to(:worker=)
	end

	it 'has employer attr_accessor' do
		obj = Wonolo::Job.new
		expect(obj).to respond_to(:employer)
		expect(obj).to respond_to(:employer=)
	end

	it 'should initialize with worker and employer' do
		obj = Wonolo::Job.new
		expect(obj.worker).to be_nil
		expect(obj.employer).to be_nil
	end

	it 'should return list of jobs for a job request id' do
		response = Wonolo::Job.find(1, 9624)
		expect(response).to be_an(Array)
		expect(response.first).to be_an_instance_of(Wonolo::Job)
		expect(response.first.worker).to be_an_instance_of(Wonolo::User)
		expect(response.first.employer).to be_an_instance_of(Wonolo::User)
	end
end