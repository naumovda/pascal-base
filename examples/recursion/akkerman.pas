var
  s_count: BigInteger;
  s_depth: BigInteger;

function Akkerman(const m, n: BigInteger): BigInteger;
begin
  s_count := s_count + 1;
  s_depth := s_depth + 1;
  writeln(m,' ', n, ' ', s_depth);
  
  if m = 0 then
    Akkerman := n + 1
  else
    if n = 0 then
      Akkerman := Akkerman(m - 1, 1)
    else
      Akkerman := Akkerman(m - 1, Akkerman(m, n - 1));  
      
  s_depth := s_depth - 1;
end;

begin 
  s_count := 0;
  
  writeln(Akkerman(3,3));
  writeln('==>');
  writeln(s_count);
  writeln(s_depth);
end.