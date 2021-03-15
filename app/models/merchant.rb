class Merchant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  store_accessor :extra, :phone_number, :website

  validates :email, format: URI::MailTo::EMAIL_REGEXP


end
