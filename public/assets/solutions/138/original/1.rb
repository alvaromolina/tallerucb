class User
  attr_accessor :name, :email
  
  def initialize(name="",email="")
    @name = name
    @email = email
  end
  
end


class Comment
  attr_accessor :comment, :user
  def initialize(comment="",user=User.new)
    @comment = comment
    @user = user
  end
end



class Post
  
  attr_accessor :title, :body, :comment, :user
  def initialize(title="", body="", comment="", user = User.new)
    @title = title
    @body = body
    @comment = comment
    @user = user
  end

  def promedio_num_letras
    words = body.split
    words.inject(0){|memo, word| memo += word.length} / words.count.to_f
  end

  def contar_palabras
    words = [title, body, comment.comment]
    words.join(" ").split.count
  end
  
  def user_name
    @user.name
  end
  
  
  def method_missing(meth, *args, &block)
    body.send meth, *args, &block
  end
  
end

post = Post.new("titulo","body",Comment.new("comment"), User.new("juan"))
puts post.promedio_num_letras
puts post.contar_palabras
post.body  = "una dos tres 4 5 6 granpalabra * *"
puts post.promedio_num_letras
puts post.contar_palabras
puts post.user_name
puts post.length
puts post.gsub(/\w/,'')
puts post.split.inspect
