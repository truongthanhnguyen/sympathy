class User < ApplicationRecord
  devise :omniauthable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable

  has_many :identities

  def match_with identity
    self.update_attributes email: identity.email if
      self.email? && identity.email
    self.update_attributes name: identity.name if
      self.name? && identity.name
    self.update_attributes avatar: identity.image if
      self.avatar? && identity.image
    if self.persisted?
      identity.update_attributes user_id: self.id
      return FormUser.find self.id
    else
      return self
    end
  end
end
