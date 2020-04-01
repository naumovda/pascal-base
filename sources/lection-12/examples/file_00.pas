var
  f: file of integer;
begin 
  assign(f, 'in_00.dat');
  rewrite(f);
  close(f);
end.