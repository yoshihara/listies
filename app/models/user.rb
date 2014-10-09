class User < ActiveRecord::Base
  validate :uid,  presence: true, uniqueness: true
  validate :name, presence: true
  validate :nickname, presence: true
  validate :image, presence: true

  def self.authentication(auth)
    begin
      params = {
        uid: auth['uid'],
        name: auth['info']['name'],
        nickname: auth['info']['nickname'],
        image: auth['info']['image'],
      }
    rescue
      return nil
    end

    user = self.where(uid: params[:uid]).first_or_initialize
    user.update_attributes(params)
    user
  end
end
