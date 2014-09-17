FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
      		admin true
      	end
	end

	factory :micropost do
		content "Lorem ipsum"
		user
	end

	factory :race do
		name "Test Race"
		date "2014-09-15"
		racetype 1
		user
		# race
	end
end