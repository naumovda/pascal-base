const
  size=10;

type
  TIndex = 1..size;
  TElem = real;
  TIndexSet = set of TIndex;
  TMatrix = array[TIndex, TIndex] of TElem;
  
function isEqual(const m:TMatrix; size, row: TIndex):boolean;
var
  i: TIndex;
begin
  if row > size then
  begin
    isEqual := false;
    exit;
  end;
  
  for i := 1 to n do
    if m[row, i] <> m[i, row] then
    begin
      isEqual := false;
      exit;
    end;
    
  isEqual := true;  
end;

procedure Coincidence(const m:TMatrix; n:TIndex; 
  var s:TIndexSet);
var
  i: TIndex;  
begin
  s := [];
  for i := 1 to n do
    if isEqual(m, n, i) then
      s := s + [i];
end;  
