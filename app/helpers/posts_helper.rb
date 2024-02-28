module PostsHelper
  def hide_users_name(users_name)
    hidden_name = ''
    users_name.split('').each { |_| hidden_name += '?' }
    hidden_name
  end
end
