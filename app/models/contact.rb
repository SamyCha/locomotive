# frozen_string_literal: true

class Contact < MailForm::Base
  attribute :name,  validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate => true
  attribute :nickname, captcha: true

  def headers
    {
      subject: 'Devenir vendeuse',
      to: 'contact@les-armoires-de-paris.com',
      from: %("#{name}" <#{email}>)
    }
  end
end
