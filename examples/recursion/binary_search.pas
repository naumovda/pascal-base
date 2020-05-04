var
  a: array of integer;  

function left_bound(arr: array of integer; key: integer): integer;
var
  left, right, middle: integer;
begin
  left := -1;
  right := length(arr);

  while right - left > 1 do
  begin
    middle := left + (right - left) div 2; //(right + left) div 2;
    
    if arr[middle] < key then 
      left := middle
    else 
      right := middle;
  end;
  
  Result := left;
end;

function right_bound(arr: array of integer; key: integer): integer;
var
  left, right, middle: integer;
begin
  left := -1;
  right := length(arr);

  while right - left > 1 do
  begin
    middle := left + (right - left) div 2; //(right + left) div 2;
    
    if arr[middle] <= key then 
      left := middle
    else 
      right := middle;
  end;
  
  Result := right;
end;

begin
  a := Arr(0, 1, 2, 2, 2, 4, 4, 5, 5, 5);  

  writeln(left_bound(a, 7)); 
  writeln(right_bound(a, 7)); 
end.