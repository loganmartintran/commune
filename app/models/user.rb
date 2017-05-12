class User < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present? }
  before_save :format_name

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 254 }

  has_secure_password

  def format_name
    if name
      array = []
      name.split.each do |n|
        array << n.capitalize
      end
      self.name = array.join(" ")
    end
  end
end
