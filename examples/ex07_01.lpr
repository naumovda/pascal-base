program ex07_01;

type
  C1 = class
//    _x: integer;
    procedure SetX(x: integer);
  end;

  C2 = class
    _x: integer;
    procedure SetX(x: integer); virtual;
  end;

  C3 = class(C2)
    procedure SetX(x: integer); override;
  end;

procedure C1.SetX(x: integer);
begin
end;

procedure C2.SetX(x: integer);
begin
end;

procedure C3.SetX(x: integer);
begin
end;

var
  o1: C1;
  o2: C2;
  o3: C3;

begin
  o1 := C1.Create;
  o2 := C2.Create;
  o3 := C3.Create;

  writeln(o1.InstanceSize);
  writeln(o2.InstanceSize);
  writeln(o3.InstanceSize);

  readln;
end.

