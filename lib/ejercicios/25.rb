# 30% of total
describe "single history_accessor" do
  before(:each) do
    class Course
      history_accessor :instructor
    end
  end
  it "Retornar nil el primer elemento [6 points]" do
    cs169 = Course.new
    cs169.instructor = "Armando Fox"

    cs169.instructor_history[0].should == nil
  end
  it "Debe guardar los valores pasados y para multiples instancias [9 points]" do
    cs169 = Course.new
    cs188 = Course.new

    cs169.instructor = "Armando Fox"
    cs188.instructor = "Dan Klein"
    cs188.instructor = "Pieter Abbeel"

    cs169.instructor_history[0].should == nil
    cs188.instructor_history[0].should == nil
    cs188.instructor_history[1].should == "Dan Klein"
  end
  it "Debe guardar los valores pasados y para multiples variables [15 points]" do
    cs169 = Course.new
    cs188 = Course.new

    cs169.instructor = "Armando Fox"
    cs169.instructor = "Fox Armando"
    cs188.instructor = "Dan Klein"
    cs188.instructor = "Pieter Abbeel"

    cs169.instructor_history[0].should == nil
    cs169.instructor_history[1].should == "Armando Fox"
    cs188.instructor_history[0].should == nil
    cs188.instructor_history[1].should == "Dan Klein"
  end
end

describe "multiple history_accessor" do
  before(:each) do
    class Course
      history_accessor :instructor
      history_accessor :year
    end
  end
  it "Retornar nil el primer elemento  [14 points]" do
    cs169 = Course.new
    cs169.instructor = "Armando Fox"

    cs169.instructor_history[0].should == nil
  end
  it "Debe guardar los valores pasados y para multiples instancias [21 points]" do
    cs169 = Course.new
    cs188 = Course.new

    cs169.instructor = "Armando Fox"
    cs188.instructor = "Dan Klein"
    cs188.instructor = "Pieter Abbeel"

    cs169.instructor_history[0].should == nil
    cs188.instructor_history[0].should == nil
    cs188.instructor_history[1].should == "Dan Klein"
  end
  it "Debe guardar los valores pasados y para multiples variables [35 points]" do
    cs169 = Course.new
    cs188 = Course.new
    cs169.instructor = "Armando Fox"
    cs169.instructor = "Fox Armando"
    cs169.year = 2011
    cs169.year = 2012
    cs188.instructor = "Dan Klein"
    cs188.instructor = "Pieter Abbeel"
    cs188.year = 2009
    cs188.year = 2010
    cs188.year = 2011
    cs188.year = 2012
    cs169.instructor_history[0].should == nil
    cs169.instructor_history[1].should == "Armando Fox"
    cs188.instructor_history[0].should == nil
    cs188.instructor_history[1].should == "Dan Klein"
    cs169.year_history[0].should == nil
    cs169.year_history[1].should == 2011
    cs188.year_history[0].should == nil
    cs188.year_history[1].should == 2009
    cs188.year_history[2].should == 2010
    cs188.year_history[3].should == 2011
  end
end
