require 'spec_helper'

describe "RacePages" do 
	subject { page }

	let(:user) {FactoryGirl.create(:user)}
	before { sign_in user}

	describe "race creation" do
		before { visit race_path }
		let(:submit) {"Add race"}

		# describe "with "
end