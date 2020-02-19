unit project_raznosti1;

var
xi,yi, y1, y2, y3: real;
i,k: integer;
f,x,q,z: real;
begin
writeln ('Заданные значения узлов:');
Writeln ('№ | x | y ');
writeln ('---------------');
xi[1]:=1.6; yi[1]:=1.6416;
xi[2]:=1.7; yi[2]:=2.3961;
xi[3]:=1.8; yi[3]:=3.3536;
xi[4]:=1.9; yi[4]:=4.5441;
xi[5]:=2.0; yi[5]:=6.0000;

for i:=1 to 5 do
writeln (i-1,' | ', xi[i]:2:2,' | ', yi[i]:2:3);

writeln ('Разности первого порядка:');
for i:=1 to 4 do
begin
y1[i]:=yi[i+1]-yi[i];
write (' y1=', y1[i]:4:4);
end;
writeln;

writeln ('Разности второго порядка:');
for i:=1 to 3 do
begin
y2[i]:=y1[i+1]-y1[i];
write(' y2=',y2[i]:4:4);
end;
writeln;

Writeln ('Разности третьего порядка:');
for i:=1 to 2 do
begin
y3[i]:=y2[i+1]-y2[i];
write(' y3=',y3[i]:4:4);
end;
writeln;



