describe "parse_email" do  
  
  it "Debe parsear correctamente el email [75 points]" do
    c = "445423 sss@dsd juan.perez@gmail.com mas texto..ss"
    parse_email(c).should == ["juan.perez", "gmail", "com"]
    c = "juan.perez@gmail.com mas texto..ss"
    parse_email(c).should == ["juan.perez", "gmail", "com"]
    c = "ssd sdsds juan.perez@gmail.com"
    parse_email(c).should == ["juan.perez", "gmail", "com"]
    c = "ssd sdsds usuario@gmail.net.com ssss we23234 das93933239@ss"
    parse_email(c).should == ["usuario", "gmail.net", "com"]
  end

  it "Debe devolver un array vacio si no hay un email [25 points]" do
    c = "s3933239 ddaskd 33"
    parse_email(c).should == []
    c = "ssd sdsds usuario@gmail ssss we23234 das93933239@ss"
    parse_email(c).should == []
    c = "ssd sdsds usuario@gmail.d ssss we23234 das93933239@ss"
    parse_email(c).should == []
  end
  
  
end