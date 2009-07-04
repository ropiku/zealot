Factory.define :user do |u|
  u.sequence(:identity_url) {|n| "user#{n}.example.com"}
  u.sequence(:nickname) {|n| "user#{n}"}
  u.sequence(:email) {|n| "email{n}@example.com" }
end