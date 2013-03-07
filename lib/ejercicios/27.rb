describe "#palindromo?" do
  it "a) recognizes palindromes correctly [50 points]" do
    "A man a plan a canal Panama".palindromo?.should be_true
    "Madam Im Adam".palindromo?.should be_true
    "Do geese see God".palindromo?.should be_true
    "Murder for a jar of red rum".palindromo?.should be_true
    "Never odd or even".palindromo?.should be_true
    "Racecar".palindromo?.should be_true
    "Was it a car or a cat i saw".palindromo?.should be_true
  end
  
  it "b) recognizes palindromes correctly, with special characters [25 points]" do
    "A man, a plan, a canal -- Panama".palindromo?.should be_true
    "Madam, I'm Adam!".palindromo?.should be_true
    "Do geese see God?".palindromo?.should be_true
    "Murder for a jar of red rum.".palindromo?.should be_true
    "Never odd or & even.".palindromo?.should be_true
    "Racecar".palindromo?.should be_true
    "Was it # a car * or a cat i saw".palindromo?.should be_true
  end


  
  it "recognizes non palindromes correctly [25 points]" do
    "This is not a palindrome".palindromo?.should be_false
    "Trolls, ogres, orcs".palindromo?.should be_false
    "Lorem ipsum dolor sit amet.".palindromo?.should be_false
    "There's some punctuation up in here?!".palindromo?.should be_false
  end
end


