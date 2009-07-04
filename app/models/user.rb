class User < ActiveRecord::Base
  validates_presence_of   :identity_url
  validates_uniqueness_of :identity_url
  
  validates_uniqueness_of :nickname
  validates_uniqueness_of :email
  
  def self.from_remember_token(token)
    first(:conditions => ["remember_token = ? AND remember_token_expires_at > ?", token, Time.now])
  end
  
  def remember_me
    return false unless respond_to?(:remember_token)

    self.remember_token = ActiveSupport::SecureRandom.hex(10)
    self.remember_token_expires_at = Time.now + 30.days

    save

    {:value => self.remember_token, :expires => self.remember_token_expires_at}
  end

  def forget_me
    self.remember_token = self.remember_token_expires_at = nil
    self.save
  end
end
