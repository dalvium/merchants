class Merchant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  store_accessor :extra, :phone_number, :website

  validates :email, format: URI::MailTo::EMAIL_REGEXP

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  pg_search_scope :search_name, against: :name

end
