describe "format_number" do  
  
  it "Debe retornar el numero formateado para enteros [50 points]" do
    format_number(10000).should == "10,000"
    format_number(123456789101112).should == "123,456,789,101,112"
    format_number(1).should == "1"
    format_number(12).should == "12"
    format_number(123).should == "123"
    format_number(1234).should == "1,234"
  end

  it "Debe retornar el numero formateado para decimales [50 points]" do
    format_number(10000.00).should == "10,000.0"
    format_number(123456789101112.23).should == "123,456,789,101,112.23"
    format_number(1.1111111).should == "1.1111111"
    format_number(12.21312312412312).should == "12.21312312412312"
    format_number(123.01).should == "123.01"
    format_number(1234.20).should == "1,234.2"
  end
  
end