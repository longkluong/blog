# This is used for the old Jekyll Responsive Image
# Jekyll::Hooks.register :posts, :pre_render do |post, payload|
#     docExt = post.extname.tr('.', '')
#     post.content.gsub!(/!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/, '{% picture path: \2 \3 %}')
#     post.content.gsub! 'path: /', 'path: ' #you can probably optimise this a bit
#   end

Jekyll::Hooks.register :documents, :pre_render do |document, payload|
  docExt = document.extname.tr('.', '')
  # only process if we deal with a markdown file
  if payload['site']['markdown_ext'].include? docExt
    newContent = document.content.gsub(/!\[(.*)\]\(([^\)]+)\)(?:{:([^}]+)})*/, '<div>{% picture post-cover \2 --alt \1  %}</div>')
    document.content = newContent
  end
end