uses
  System, System.Text;
  
const
  DEBUG = true;
  
function OutInBinaryCode(value: single): string;
begin  
  var arr := BitConverter.GetBytes(value);
  
  var str : string := ''; {= new StringBuilder(arr.Length * 2)};
   
  foreach var b : byte in arr do 
    {str.Append(Convert.ToString(b, 2).PadLeft(8,'0'));}
    str := Convert.ToString(b, 2).PadLeft(8,'0') + str;
  
  var s, p, m: integer;
  
  if DEBUG then
  begin
    s := arr[3] div 128;
    p := (arr[3] mod 128) * 2 + arr[2] div 128;
    m := ((arr[2] mod 128) shr 16) +  (arr[1] shr 8) + arr[0];
  
    writeln('s:', s);
    writeln('p:', p, '(', p - 127 ,')');
    writeln('m:', m);
  end;
    
  Result := {str.ToString} str;
end;

begin
  var d1: {real} single := 0.5;
  var d2: {real} single := 0.2;
  
  writeln(OutInBinaryCode(d1));
  writeln(OutInBinaryCode(d2));  
end.