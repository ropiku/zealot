# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zealot_session',
  :secret      => '1caba0f4b1f4c70366f52040560f27ff52a78ec1c8f8648f294c74f2b62335a0a17a44d6d83803da12b0d3ebf03420705438fc2007f0b88405f0186f77746577'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
