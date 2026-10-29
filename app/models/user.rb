class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy
  belongs_to :staff, optional: true

  enum :role, {
    owner: "owner",
    mechanic: "mechanic",
    counter: "counter"
  }

  normalizes :email_address, with: ->(email) { email.strip.downcase }

  validates :email_address, presence: true,
                            format: { with: URI::MailTo::EMAIL_REGEXP },
                            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 10 }, allow_nil: true
end
