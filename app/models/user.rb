class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
    
  scope :active_users, -> { where(isdeleted: false) }

  enum :role, { user: 0, admin: 1, super_admin: 2 }

  has_one :cart
  has_many :orders

  # def soft_delete
  #   byebug
  #   update(isdeleted: true)
  #   byebug
  #   update(active: false)
  # end

  def active_for_login?
    super && !isdeleted
  end

  after_create :send_welcome_email

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  #  def self.ransackable_attributes(auth_object = nil)
  #   # List only the columns you want to be searchable in ActiveAdmin
  #   authorizable_ransackable_attributes
  # end

  # def self.ransackable_associations(auth_object = nil)
  #   []
  # end

end
