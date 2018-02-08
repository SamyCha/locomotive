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

#pour avoir le formulaire sign-up en HP
 def resource_name
    :user
  end

  def resource_class
     User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
