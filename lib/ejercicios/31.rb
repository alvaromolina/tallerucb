# 30% of total
describe User do
  it "Debe funcionar el constructor [5 points]" do
    user = User.new("usuario","email")
    user = User.new
  end
  it "Deben funcionar los accessors  [5 points]" do
    user = User.new("usuario","email")
    user.name = "user"
    user.email = "emai"
    user.name.should == "user"
    user.email.should == "emai"
  end
  
end

describe Post, "#user" do
  it "Se debe aumentar el atributo user a Post [10 points]" do
    post = Post.new("titulo","body",Comment.new("comment"), User.new("usuario","email"))
    post.user.name.should == "usuario"
    post.user = User.new("us","email")
    post.user.name.should == "us"
  end
end


describe Post, "#user_name" do
  it "Se debe aumentar el metodo user_name a Post [10 points]" do
    post = Post.new("titulo","body",Comment.new("comment"), User.new("usuario","email"))
    post.user_name.should == "usuario"
  end
end

describe Comment do

  it "Debe funcionar el constructor [5 points]" do
    comment = Comment.new("comm",User.new)
    comment = Comment.new
  end
  it "Deben funcionar los accessors  [5 points]" do
    comment = Comment.new("comm",User.new)
    comment.comment = "c"
    comment.user = User.new("user","mail")
    comment.user.name.should == "user"
    comment.comment.should == "c"
  end
  
end

describe Post, "#contar_palabras" do
  it "La funcion contar_palabras debe devolver el numero de palabras en title, body y comment [40 points]" do
    post = Post.new("titulo","body",Comment.new("comment"))
    post.contar_palabras.should == 3
    post = Post.new("titulo 2 3","body 4 6 6 ddd dddwwww",Comment.new("comment ss"))
    post.contar_palabras.should == 11
  end
end