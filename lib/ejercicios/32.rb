describe "add_currency" do

  it "Debe recibir correctamente nuevos valores [100 points]" do
    Numeric.add_currency(:mx_peso,0.12)
    2.mx_pesos.should == 0.24
    1.mx_peso.should == 0.12
    10.34.mx_pesos.should == 1.2408
    Numeric.add_currency(:bolivar,0.1822)
    2.bolivars.should == 0.3644
    1.bolivar.should == 0.3644
    10.34.mx_pesos.should == 1.883948
  end

end