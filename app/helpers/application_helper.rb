# frozen_string_literal: true

module ApplicationHelper
  def avatar_url(user)
    if user.image
      user.image
    else
      if user.avatar.present?
        user.avatar.url
      else
        'default_image.png'
      end
    end
  end
end
