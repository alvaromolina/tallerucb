describe "#contar_palabras" do
  it "contar_palabras properly [50 points]" do
    sample1 = contar_palabras "what the what the what"
    sample1["what"].should == 3
    sample1["the"].should == 2

    sample2 = contar_palabras "blah blah blah blah blah"
    sample2.should == {"blah" => 5}

    sample3 = contar_palabras "thats this and thats that"
    sample3.should == {"thats" => 2, "this" => 1, "and" => 1, "that" => 1}
  end
  
  it "contar_palabras properly with special characters [25 points]" do
    sample1 = contar_palabras "A man, a plan, a canal -- Panama"
    sample1["a"].should == 3
    sample1["man"].should == 1
    sample1["canal"].should == 1
    sample1["panama"].should == 1
  end

  it "is not sensitive to case [25 points]" do
    sample1 = contar_palabras "there is UPPER upper case"
    sample1["upper"].should == 2
  end
end