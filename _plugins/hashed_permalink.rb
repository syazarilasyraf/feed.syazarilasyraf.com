require 'digest'

Jekyll::Hooks.register :posts, :pre_render do |post|
  unless post.data['permalink']
    hash = Digest::MD5.hexdigest(post.basename)[0..5]
    post.data['permalink'] = "/p/#{hash}"
  end
end
