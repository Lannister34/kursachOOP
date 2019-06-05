module UsersHelper
  
  # Возвращает граватар для данного пользователя
  def gravatar_for(user, options = { size: 35 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: "*Аватар не загрузился*  ", class: "gravatar")
  end
end
