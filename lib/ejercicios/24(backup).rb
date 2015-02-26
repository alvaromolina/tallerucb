# 30% of total
describe Post do
  it "Debe funcionar el constructor [10 points]" do
    post = Post.new("titulo","body","comment")
  end
  it "Deben funcionar los accessors  [10 points]" do
    post = Post.new("titulo","body","comment")
    post.title = "new"
    post.body = "hola"
    post.comment = "hello"
    post.body.should == "hola"
    post.comment.should == "hello"
  end
  
end
describe Post, "#promedio_num_letras" do
  it "La funcion promedio_num_letras debe devolver el promedio numero de letras en body [40 points]" do
    post = Post.new("titulo","body","comment")
    post.promedio_num_letras.should == 4.0
    post.body  = "una dos tres 4 5 6 granpalabra"
    post.promedio_num_letras.should == 3.4285714285714284
  end
end

describe Post, "#contar_palabras" do
  it "La funcion contar_palabras debe devolver el numero de palabras en title, body y comment [40 points]" do
    post = Post.new("titulo","body","comment")
    post.contar_palabras.should == 3
    post = Post.new("titulo 2 3","body 4 6 6","comment ss")
    post.contar_palabras.should == 9
  end
end