function y= wypelnijsrodkifigur(x)
z=~x;
z=czyszczeniebrzegow(z);
y=logical(x+z);

end