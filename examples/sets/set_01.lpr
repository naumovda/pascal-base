program set_01;
var
  c: char;
  s: set of char;

begin
  write('Enter a string (Ctrl+Z - end if input): ');
  s := [];
  repeat
    read(c);
    if EOLN then
      break;
    include(s, c); //или так: s := s + [c];
  until false;
  readln;

  //пересечение множества s и множества английских букв
  s := s * ['A'..'Z','a'..'z'];

  //выводим множество
  for c := chr(32) to chr(255) do
    if c in s then
      write(c, ' ');
  writeln;

  writeln('Press Enter');
  readln;
end.

