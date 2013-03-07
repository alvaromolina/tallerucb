describe "#palindromo?" do
  it "a) recognizes palindromes correctly [50 points]" do
    palindromo?("A man a plan a canal Panama").should be_true
    palindromo?("Madam Im Adam").should be_true
    palindromo?("Do geese see God").should be_true
    palindromo?("Murder for a jar of red rum").should be_true
    palindromo?("Never odd or even").should be_true
    palindromo?("Racecar").should be_true
    palindromo?("Was it a car or a cat i saw").should be_true
  end
  
  it "b) recognizes palindromes correctly, with special characters [25 points]" do
    palindromo?("A man, a plan, a canal -- Panama").should be_true
    palindromo?("Madam, I'm Adam!").should be_true
    palindromo?("Do geese see God?").should be_true
    palindromo?("Murder for a jar of red rum.").should be_true
    palindromo?("Never odd or & even.").should be_true
    palindromo?("Racecar").should be_true
    palindromo?("Was it # a car * or a cat i saw").should be_true
  end


  
  it "recognizes non palindromes correctly [25 points]" do
    palindromo?("This is not a palindrome").should be_false
    palindromo?("Trolls, ogres, orcs").should be_false
    palindromo?("Lorem ipsum dolor sit amet.").should be_false
    palindromo?("There's some punctuation up in here?!").should be_false
  end
end


