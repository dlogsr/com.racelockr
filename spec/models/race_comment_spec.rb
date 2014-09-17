require 'spec_helper'

describe RaceComment do
  let(:user) { FactoryGirl.create(:user)}
  let(:race) { FactoryGirl.create(:race)}
  before { @race_comment = race.race_comments.build(content: "Lorem ipsum", user_id: user.id)}

  subject {@race_comment}

  it { should respond_to(:content)}
  it { should respond_to(:user_id)}
  it { should respond_to(:race_id)}
  #it { should respond_to(:user)}
  its(:race) { should eq race}

  it { should be_valid}

  describe "when user_id is not present" do
  	before { @race_comment.user_id = nil}
  	it {should_not be_valid}
  end

  describe "when race_id is not present" do
    before { @race_comment.race_id = nil}
    it {should_not be_valid}
  end

  describe "with blank content" do
  	before {@race_comment.content = " "}
  	it {should_not be_valid}
  end

  # describe "with content that is too long" do
  # 	before {@micropost.content = "a" * 141}
  # 	it {should_not be_valid}
  # end
end
