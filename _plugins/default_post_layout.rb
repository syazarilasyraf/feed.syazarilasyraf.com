Jekyll::Hooks.register :posts, :pre_render do |post|
  post.data['layout'] ||= 'post'
end
