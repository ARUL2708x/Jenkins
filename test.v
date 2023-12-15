module halfbynor (a,b,sum,carry);
  input a,b;
  output sum,carry;
  assign sum=~(~(~(~a|b))|~(a|~b) ) ;
  assign carry=~(~a|~b)  ;
endmodule


module tb;
  reg a,b;
  wire sum,carry;
  halfbynor all (.a(a),.b(b),.sum(sum),.carry(carry));
  initial 
    begin 
      a=0;b=0;
      #2 a=0;b=1;
      #2 a=1;b=0;
      #2 a=1;b=1;
      #2;
    end
  initial
    begin
      $monitor("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
      $dumpfile("dump.vcd");
      $dumpvars();
    end 
    endmodule
      
