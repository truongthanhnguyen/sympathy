class Identity < ActiveRecord
  belongs_to :user
  validates :uid, :provider, presence: true
  validates :uid, uniqueness: {scope: :provider}

  class << self
    def find_for_oauth auth
      identity = find_by provider: auth.provider, uid: auth.uid
      identity = create(uid: auth.uid, provider: auth.provider) unless identity
      identity.accesstoken = auth.credentials.token
      identity.refreshtoken = auth.credentials.refresh_token
      identity.name = auth.info.name
      identity.email = auth.info.email
      identity.nickname = auth.info.nickname
      identity.image = auth.info.image
      identity.phone = auth.info.phone
      identity.urls = (auth.info.urls || "").to_json
      identity.save
      identity
    end
  end
end
