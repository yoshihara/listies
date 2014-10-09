require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  def test_first_login
    user = authentication
    assert_equal(user.uid, twitter_params['uid'])
  end

  def test_already_logined
    params = {
      uid:      twitter_params['uid'],
      nickname: twitter_params['info']['nickname'],
      name:     twitter_params['info']['name'],
      image:    twitter_params['info']['image'],
    }

    User.new(params).save!
    user = authentication
    assert_equal(user.uid, twitter_params['uid'])
  end

  private

  def authentication
    User.authentication(twitter_params)
  end

  def twitter_params
    {
      'provider' => 'twitter',
      'uid' => '123',
      'info' => {
        'nickname' => 'hyoshihara04',
        'name' => 'hyoshihara',
        'image' => 'https://pbs.twimg.com/profile_images/501327171231567872/hUi0EULf.jpeg'
      }
    }
  end
end
