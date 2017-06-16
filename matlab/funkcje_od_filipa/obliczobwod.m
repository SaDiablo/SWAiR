function y=obliczobwod(x)
x=obliczanielancucha(x)
niep=sum(mod(x,2));
parz=numel(x)-niep;
y=parz+niep*sqrt(2);