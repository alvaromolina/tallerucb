# 30% of total

describe Post, "#length" do
  it "La funcion length debe devolver el body.length[20 points]" do
    post = Post.new("titulo","body",Comment.new("comment"))
    post.length.should == 4
    post = Post.new("titulo 2 3","body 4 6 6 ddd dddwwww",Comment.new("comment ss"))
    post.length.should == 22
  end
end

describe Post, "#split" do
  it "La funcion split debe devolver el body.split[20 points]" do
    post = Post.new("titulo","body mas",Comment.new("comment"))
    post.split.should == ["body","mas"]
    post = Post.new("titulo 2 3","body,4,6,6,ddd,dddwwww",Comment.new("comment ss"))
    post.split(",").should == ["body","4","6","6","ddd","dddwwww"]
  end
end

describe Post, "#gsub" do
  it "La funcion gsub debe devolver el body.gsub[20 points]" do
    post = Post.new("titulo","body mas",Comment.new("comment"))
    post.gsub('mas','hola').should == "body hola"
    post = Post.new("titulo 2 3","body,4,6#6,ddd*dddwwww",Comment.new("comment ss"))
    post.gsub(/\W/,' ').should == "body 4 6 6 ddd dddwwww"
  end
end