{
	������ � ������� ComplexUnit

	version 0.2
}

program ComplexProgram;

uses
  ComplexUnit; //���������� ������ ������ � ������������ �������
  
var
  a, b, c, d, e, f, g: TComplex;
begin
  //������������� � = 2+4i
  Init(2, 4, a);  
  //������������� b = -1+5i
  Init(-1, 5, b);  
  //������������� c = i
  c := C_IM_ONE;  
  //������������� e = 1
  e := C_ONE;
  
  //������� ����� ���� �����
  AddC(a, b, d);  
  //������� ������������ ���� �����
  MulC(d, c, f);  
  //������� ������� ���� �����
  MulC(e, f, g);
  
  //������� �����
  writeln('A=');
  Out(a);
  writeln;
  
  //���������� �������������� � ������
  writeln('B=', CToString(b));
  
  //������� � ���������������� �����
  writeln('C=', CToStringForm(c, cofExp));
  
  //��������� ����� ������ �� ��������� ��� ������������������
  SetDefaultForm(cofTrg);
  
  //������ ����� ����� � ������������������ �����
  writeln('D=', CToString(d));
  
  //������� ������ � �������� ������������ �����
  writeln;
  writeln('module D=', GetModule(d));
  writeln('argument D=', GetArgument(d));
  
  //��� �� ���������� ���� �����������?
  writeln;
  writeln('������� ������=', CGetError);
  writeln;
  
  //��������� �������� �������� ����
  writeln('argument (0,0)=', GetArgument(C_ZERO)); //�������� �������� 0, ��..
  writeln(CGetErrorMessage); //����������� ������� ������
  CClearError; //���������� ������� ������
  
end.