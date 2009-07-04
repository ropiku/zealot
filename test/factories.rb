Factory.define :user do |u|
  u.sequence(:identity_url) {|n| "user#{n}.example.com"}
  u.sequence(:nickname) {|n| "user#{n}"}
  u.sequence(:email) {|n| "email#{n}@example.com" }
end

Factory.define :spot do |s|
  s.name "Fifi"
  s.latitude 44.43644582483315 + rand / 100
  s.longitude 26.105189323425293 + rand / 10
end

Factory.define :rating do |r|
  r.association :user, :factory => :user
  r.association :spot, :factory => :spot
  r.rating rand(4) + 1
end

Factory.define :tag do |t|
  t.sequence(:name) {|n| "tag#{n}"}
end
