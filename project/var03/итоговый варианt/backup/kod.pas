var xi,yi:array [1..5] of real;
y1: array [1..4] of real;
y2: array [1..3] of real;
y3: array [1..2] of real;
i,k: integer;
N3,x,q,w: real;

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
repeat
writeln ('Введите значение переменной х:');
readln (x);
if (x>xi[1]) or (x<xi[5]) then writeln('Ошибка.Заданное значение не попадает в интервал. ');
until (x>xi[1]) and (x<xi[5]);
for i:=2 to 4 do
if (x>xi[i-1]) and (x<xi[i]) then
begin
k:=i-1;
w:=xi[i-1];
end;
xi[1]:=xi[k];
for i:=2 to 5 do
xi[i]:=xi[1]+(i-1)*0.1;
writeln('Новые значения X: ');
for i:=1 to 5 do
write(xi[i]:5:2);
writeln;
q:= (x - w)/0.1;
writeln('q= ',q:2:3);
for i:= 1 to 5 do
N3:=yi[1]+q*y1[1]+y2[1]*((q*(q-1))/2)+y3[1]*((q*(q-1)*(q-2))/6);
writeln ('Значение интерполируемой переменной = ', N3:4:4);
end. 
