require 'spec_helper'

RSpec.describe Wonolo::Base do

	it 'return per page constant' do
		expect(Wonolo::Base::PER_PAGE).to eql(10)
	end

	it 'has errors attr_accessor' do
		obj = Wonolo::Base.new
		expect(obj).to respond_to(:errors)
		expect(obj).to respond_to(:errors=)
	end

end