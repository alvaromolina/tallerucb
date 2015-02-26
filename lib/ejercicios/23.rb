describe "anagrams" do
  it "should handle an empty array [2 points]" do
    anags = []
    result = combinar_anagramas anags
    result.deepsort.should == []
  end

  it "should handle the most simple, single-character case with no repeats [2 points]" do
    anags = ['a', 'b', 'c']
    result = combinar_anagramas anags
    result.length.should == 3
    result.deepsort.should include ['a'], ['b'], ['c']
  end

  it "should handle the most simple, single-character case with capital letters but no repeats [2 points]" do
    anags = ['a', 'B', 'c']
    result = combinar_anagramas anags
    result.length.should == 3
    result.deepsort.should include ['a'], ['B'], ['c']
  end

  it "should handle a set with no repeated anagrams and words with distinct letters [10 points]" do
    anags = ['this', 'is', 'a', 'test']
    result = combinar_anagramas anags
    result.length.should == 4
    result.deepsort.should include ['this'], ['is'], ['a'], ['test']
  end

  it "should handle a set with no repeated anagrams, but words with similar letters [2 points]" do
    anags = ['aabbcc', 'abc']
    result = combinar_anagramas anags
    result.length.should == 2
    result.deepsort.should include ['aabbcc'], ['abc']

    anags = ['aabbcc', 'aabbc']
    result = combinar_anagramas anags
    result.length.should == 2
    result.deepsort.should include ['aabbcc'], ['aabbc']
  end

  it "should handle non-anagrams that have all but one letters the same [2 points]" do
    anags = ['reads', 'dear']
    result = combinar_anagramas anags
    result.length.should == 2
    result.deepsort.should include ['reads'], ['dear']
  end

  it "should handle a complicated case of some repeated anagrams, but no duplicates [25 points]" do
    anags = ['cars', 'racs', 'four', 'for', 'scar', 'potatoes', 'creams', 'scream']
    result = combinar_anagramas anags
    result.length.should == 5
    result.deepsort.should include ['cars', 'racs', 'scar'].sort, ['four'], ['for'], ['potatoes'], ['creams', 'scream'].sort
  end

  it "should handle a complicated case of some repeated anagrams, but no duplicates [25 points]" do
    anags = ['rat', 'panes', 'napes', 'dart', 'tard', 'tar', 'scar', 'snape']
    result = combinar_anagramas anags
    result.length.should == 4
    result.deepsort.should include ['rat', 'tar'].sort, ['panes', 'napes', 'snape'].sort, ['dart', 'tard'].sort, ['scar']
  end

  it "should handle a simple case of some repeated single-character inputs [2 points]" do
    anags = ['a', 'a', 'b', 'b', 'c', 'd']
    result = combinar_anagramas anags
    result.length.should == 4
    result.deepsort.should include ['a', 'a'], ['b', 'b'], ['c'], ['d']
  end

  it "should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]" do
    anags = ['cars', 'racs', 'four', 'for', 'scar', 'potatoes', 'creams', 'scream', 'scream', 'cars']
    result = combinar_anagramas anags
    result.length.should == 5
    result.deepsort.should include ['cars', 'cars', 'racs', 'scar'].sort, ['four'], ['for'], ['potatoes'], ['creams', 'scream', 'scream'].sort
  end

  it "should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]" do
    anags = ['tops', 'pots', 'spot', 'spots', 'stop', 'tops', 'sausage', 'stops']
    result = combinar_anagramas anags
    result.length.should == 3
    result.deepsort.should include ['pots', 'spot', 'stop', 'tops', 'tops'].sort, ['spots', 'stops'].sort, ['sausage']
  end

  it "should treat single-character capital letters as equal [2 points]" do
    anags = ['a', 'A']
    result = combinar_anagramas anags
    result.deepsort.should == [['A', 'a'].sort]
  end

  it "should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points]" do
    anags = ['a', 'a', 'A', 'a', 'D', 'b', 'b', 'c', 'd']
    result = combinar_anagramas anags
    result.length.should == 4
    result.deepsort.should include ['a', 'a', 'a', 'A'].sort, ['b', 'b'], ['c'], ['D', 'd'].sort
  end

  it "should treat two identical words with different cases as the same, and preserve case in output [2 points]" do
    anags = ['hello', 'HeLLo']
    result = combinar_anagramas anags
    result.deepsort.should == [['HeLLo', 'hello'].sort]
  end

  it "should treat many identical words with different cases as the same, and preserve case in output [8 points]" do
    anags = ['tOps', 'potS', 'spot', 'spots', 'stop', 'tops', 'sAUsage', 'STOPS']
    result = combinar_anagramas anags
    result.length.should == 3
    result.deepsort.should include ['potS', 'spot', 'stop', 'tOps', 'tops'].sort, ['STOPS', 'spots'].sort, ['sAUsage']
  end
end

module Enumerable
  def deepsort
    self.map(&:sort)
  end
end

