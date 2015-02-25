# 30 pts for part A
describe "juego_rpt" do
  # this is given for free in the outline
  it "should raise ErrorNumeroJugadores if there are not exactly two players [1 point]" do
    lambda { juego_rpt([ ["Allen", "T"] ]) }.should raise_error(ErrorNumeroJugadores)
  end

  it "should raise NoExisteMovida if there is some strategy that is not R, P, or T [4 points]" do
    lambda { juego_rpt([ ["Allen", "A"], ["Richard", "P"] ]) }.should raise_error(NoExisteMovida)
  end

  it "should return the correct winner in a simple RPT game with a clear winner [15 points]" do
    juego_rpt([ ["Dave", "P"], ["Armando", "T"] ])[0].should == "Armando"
    juego_rpt([ ["Richard", "R"], ["Michael", "P"] ])[0].should == "Michael"
    juego_rpt([ ["Richard", "T"], ["Allen", "R"] ])[0].should == "Allen"
  end

  it "should return the first player in the case of a tie [10 points]" do
    juego_rpt([ ["Allen", "P"], ["Richard", "P"] ])[0].should == "Allen"
    juego_rpt([ ["David", "T"], ["Omer", "T"] ])[0].should == "David"
    juego_rpt([ ["Dave", "R"], ["Armando", "R"] ])[0].should == "Dave"
  end
end

end
