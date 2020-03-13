uses
  Utils;
  
const
  SIZE = 10000;

type
  TIndex = 1..SIZE;
  TListIndex = 1..SIZE*SIZE;
  TElem = integer;
  TMatrix = array[TIndex, TIndex] of TElem;
  TList = array[TListIndex] of TElem;

procedure Init(var m: TMatrix; start, finish: TElem);
begin
  randomize;
  
  for var i:TIndex := 1 to SIZE do
    for var j:TIndex := 1 to SIZE do
      m[i,j] := random(finish-start)+start;
end;

procedure Print(const m: TMatrix; msg: string);
var
  i, j: TIndex;
begin
  writeln(msg);  
  
  for i := 1 to SIZE do
  begin
    for j := 1 to SIZE do
      write(m[i,j]:6);      
    writeln;
  end;
  
  writeln;
end;

function AddToList(Elem: TElem; var L: TList; var Length: TListIndex):boolean;
var
  k: TIndex;  
  find: boolean;
begin
  find := false;
  
  for k := 1 to Length do
    if L[k] = Elem then
    begin 
      find := true;
      break;
    end;
  
  if not find then
  begin
    Length := Length + 1;
    L[Length] := Elem;
  end;
  
  AddToList := find;
end;

procedure ClearList(Elem: TElem; var L: TList; var Length: TListIndex);
var
  k: TIndex;  

  start, finish: TIndex;
begin
  //exit;
  
  start := 0;
 
  for k := 1 downto length do
    if L[k] >= Elem then
      begin
        start := start + 1;
        L[start] := L[k];
      end;
    
  length := start;
end;

procedure GetMaxOfRepeated(const m: TMatrix; var MaxValue: TElem; 
  var RepeatedExists: boolean);
var
  i, j, k: TIndex;
  
  L: TList;
  len: TListIndex;
  
  max: TElem;
  find: boolean;
begin
  RepeatedExists := false;
  
  len := 0;
  
  for i := 1 to SIZE do
    for j := 1 to SIZE do
      if not RepeatedExists then
      begin
        find := AddToList(m[i, j], L, len);
        
        if find then 
        begin
          RepeatedExists := true;          
          
          max := m[i, j];
          
          ClearList(max, L, len);
        end;
      end
      else
        if m[i,j] > max then
        begin
          find := AddToList(m[i, j], L, len);
          
          if find then 
          begin
            max := m[i, j];
            
            ClearList(max, L, len);
          end;
        end;      
  
  writeln('list len=', len);
  
  MaxValue := max;
end;

procedure GetMaxOfRepeated2(const m: TMatrix; var MaxValue: TElem; 
  var RepeatedExists: boolean);
var
  i, j, i1, j1: TIndex;
  
  max: TElem;
  find, skip: boolean;
begin
  RepeatedExists := false; 
 
  for i := 1 to SIZE do
    for j := 1 to SIZE do
    begin
      skip := false;
      
      for i1 := i to SIZE do
      begin
        for j1 := j+1 to SIZE do            
          if m[i,j] = m[i1, j1] then           
            if not RepeatedExists then
              begin
                RepeatedExists := true;                    
                max := m[i, j];                               
                skip := true;
                break;
              end
            else
              if m[i,j] > max then
              begin       
                max := m[i, j];
                skip := true;
                break;
              end;
         if skip then break;
       end;
    end;
  
  MaxValue := max;
end;

procedure GetMaxOfRepeated3(const m: TMatrix; var MaxValue: TElem; 
  var RepeatedExists: boolean);
var
  i, j, k: TIndex;
  
  L: array of TElem;
  
  len: TListIndex;
begin
  SetLength(L, SIZE*SIZE+1);
  
  RepeatedExists := false; 
  
  len := 0;
  for i := 1 to SIZE do
    for j := 1 to SIZE do
    begin
      len := len + 1;
      L[len] := m[i,j]
    end;
    
  System.Array.Sort(L);
  //sort(L);
  
  k := len;  
  while (k > 0) and not RepeatedExists do
  begin
    if L[k] = L[k-1] then           
      RepeatedExists := true;                    
    
    k := k - 1;
  end;
  
  if RepeatedExists then
    MaxValue := L[k]
  else
    MaxValue := 0;
end;

var
  m: TMatrix;
  MaxValue: TElem; 
  RepeatedExists: boolean;
  
  start_time, end_time: DateTime;    
begin
  Init(m, 10, 1000);  
  
  //Print(m, 'Matrix:');
  
  start_time := DateTime.Now;
  
  //GetMaxOfRepeated(m, MaxValue, RepeatedExists);
  //GetMaxOfRepeated2(m, MaxValue, RepeatedExists);
  //GetMaxOfRepeated3(m, MaxValue, RepeatedExists);
  
  end_time := DateTime.Now;
  
  if RepeatedExists then
    writeln(MaxValue, 'is the maximum of repeated elements!')
  else
    writeln('No one repeated elements...');
  
  writeln(end_time - start_time);
  
end.  
