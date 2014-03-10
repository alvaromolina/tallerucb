describe "cambio" do  
  
  it "Debe retornar el cambio para casos de moneda boliviana [10 points]" do
    monedas = [10,20,50]
    cambio(40,monedas).should == [20,20]
    cambio(50,monedas).should == [50]
    cambio(3,monedas).should == []
    cambio(10,monedas).should == [10]
    cambio(20,monedas).should == [20]
    cambio(80,monedas).should == [50,20,10]
    cambio(90,monedas).should == [50,20,20]
    cambio(95,monedas).should == [50,20,20]
  end

  it "Debe retornar el cambio para casos de moneda de otros paises [40 points]" do
    monedas = [25, 10, 5, 1]
    cambio(39,monedas).should == [25, 10, 1, 1, 1, 1]
    cambio(50,monedas).should == [25,25]
    cambio(3,monedas).should == [1,1,1]
    
    monedas = [25,10,20,5,1]
    cambio(39,monedas).should == [25, 10, 1, 1, 1, 1]
    cambio(22,monedas).should == [20, 1, 1]
    cambio(21,monedas).should == [20, 1]
    cambio(47,monedas).should == [25, 20, 1, 1]
    
  end
  
  it "Debe retornar el cambio para casos de monedas inventadas [50 points]" do
    monedas = [10, 7, 1]
    cambio(14,monedas).should == [7,7]
    cambio(15,monedas).should == [7,7,1]
    cambio(39,monedas).should == [10, 10, 10, 7, 1, 1]
    cambio(22,monedas).should == [10, 10, 1, 1]
    cambio(21,monedas).should == [10, 10, 1]
    cambio(47,monedas).should == [10, 10, 10, 10, 7]

  end
end