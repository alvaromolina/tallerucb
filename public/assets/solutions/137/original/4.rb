class Post
  attr_accessor :title, :body, :comment
  def initialize(title, body, comment)
    @title = title
    @body = body
    @comment = comment
  end

  def promedio_num_letras
    words = body.split
    words.inject(0){|memo, word| memo += word.length} / words.count.to_f
  end

  def contar_palabras
    words = [title, body, comment]
    words.join(" ").split.count
  end
end

    post = Post.new("titulo","body","comment")
    puts post.promedio_num_letras
    puts post.contar_palabras
    post.body  = "una dos tres 4 5 6 granpalabra * *"
    puts post.promedio_num_letras
    puts post.contar_palabras
    

