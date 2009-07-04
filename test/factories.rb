Factory.define :user do |u|
  u.sequence(:identity_url) {|n| "user#{n}.example.com"}
  u.sequence(:nickname) {|n| "user#{n}"}
  u.sequence(:email) {|n| "email{n}@example.com" }
end

Factory.define :spot do |s|
  s.name "Fifi"
  s.latitude 44.43 + rand / 100
  s.longitude 26.1 + rand / 10
end

Factory.define :rating do |r|
  r.association :user, :factory => :user
  r.association :spot, :factory => :spot
end
