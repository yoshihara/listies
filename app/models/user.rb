class User < ActiveRecord::Base
  validate :uid,  presence: true, uniqueness: true
  validate :name, presence: true
  validate :nickname, presence: true
  validate :image, presence: true
end
