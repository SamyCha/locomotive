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

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def gravatar_for(user, size = 30, title = user.pseudo)
  image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
end

end
