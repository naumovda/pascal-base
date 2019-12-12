program set_02;

type
  TBase = 0..9;

var
  Digit: TBase;
  SetM, SetN, ResultSet: set of TBase;
  M, N, M1, N1: longint;

begin
  write('Input M = ');
  readln(M);
  write('Input N = ');
  readln(N);
  writeln;

  M1 := M;
  N1 := N;

  SetM := [];
  while M1 > 0 do
  begin
    SetM := SetM + [M1 mod 10];
    M1 := M1 div 10;
  end;

  SetN := [];
  while N1 > 0 do
  begin
    SetN := SetN + [N1 mod 10];
    N1 := N1 div 10;
  end;

  ResultSet := SetM * SetN;

  writeln('Digits in ', M, ':');
  for Digit := 0 to 9 do
    if Digit in SetM then
      write(Digit, ' ');
  writeln;

  writeln('Digits in ', N, ':');
  for Digit := 0 to 9 do
    if Digit in SetN then
      write(Digit, ' ');
  writeln;

  writeln('Digits in both numbers:');
  for Digit := 0 to 9 do
    if Digit in ResultSet then
      write(Digit, ' ');
  writeln;

  writeln;
  writeln('Press Enter');
  readln;
end.

