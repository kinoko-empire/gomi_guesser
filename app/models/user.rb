class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # implemented enum from reading this article: https://jasonchee.me/notes/enum-with-sqlite/
  # api page for rails 8.0.0 here: https://api.rubyonrails.org/v8.0.0/classes/ActiveRecord/Enum.html
  enum :role, { admin: "admin", standard: "standard" }, prefix: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
