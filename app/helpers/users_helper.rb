module UsersHelper
  def avatar_for(user, size)
    image_tag(user.avatar.url(size), alt: "#{user.first_name} #{user.second_name}",
              class: "avatar-#{size}",
              'data-big': "#{image_tag(user.avatar.url(:medium),
                                       alt: "#{user.first_name} #{user.second_name}",
                                       class: "avatar-medium")}")
  end

  def have_avatar?
    !@user.avatar_file_name.nil?
  end

end
