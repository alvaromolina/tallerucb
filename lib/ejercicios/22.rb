describe "in" do  
  
  it "Debe transformar correctamente los valores de las monedas euros, dolars , yens y bolivians [75 points]" do

    2.dollars.in(:euros).should == 1.521311475409836
    2.dollars.in(:bolivians).should == 13.92
    10.euros.in(:dollars).should == 13.14655172413793
    15.yens.in(:euros).should == 0.12295081967213115
    20.euros.in(:yens).should == 2440.0
    1.in(:dollars).should == 0.14367816091954022
  end

  it "Debe transformar correctamente los valores para valores singulares euro, dolar, yen y bolivian [25 points]" do
    1.dollar.in(:dollars).should == 1.00
    1.euro.in(:euro).should == 1.00
    1.yen.in(:yen).should == 1.00
    1.bolivian.in(:bolivian).should == 1.00
  end
  
  
end