class Merchant < ApplicationRecord

  store_accessor :extra, :phone_number, :website

  validates :name, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP


end
