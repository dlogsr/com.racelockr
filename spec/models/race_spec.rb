require 'spec_helper'

describe Race do
	let(:user) { FactoryGirl.create(:user) }
	before do
		@race = user.races.build( name: "Racename", 
						  bibnumber: "1234",
						  time: "432053",
						  date: "2014-07-27",
						  split: "100000,200000,300000",
						  photos: "user/photo.jpg",
						  description: "Good race.")
	end

	subject {@race}
	it { should respond_to(:name)}
	it { should respond_to(:bibnumber)}
	it { should respond_to(:time)}
	it { should respond_to(:date)}
	it { should respond_to(:split)}
	it { should respond_to(:photos)}
	it { should respond_to(:description)}
	it { should respond_to(:user_id)}
	it { should respond_to(:user)}
	its(:user) { should eq user}

	it { should be_valid}

	describe "when user_id is not present" do
		before {@race.user_id = nil}
		it {should_not be_valid}
	end
end
