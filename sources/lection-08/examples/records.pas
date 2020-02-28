program laba3;

const
  DISC_COUNT = 2; //количество Дисциплин 
  SEM_COUNT  = 3; //кол-во семестров
  WORK_UNIT  = 36;

type
  TSemInfo = record //по семестрам
    Credit: char; //зачеты
    Exams: char; //экзамены    
    HourAudit: real; //Аудиточные часы в неделю 
  end;
  
  TDiscipline = record
    Code: string; 
    Dis: string; //сами дисциплины
    HourCU: real; //трудоемкость в ЗЕ 
    HourAstr: real; //трудоемкость в часах
    Semester: array [1..SEM_COUNT] of TSemInfo;
  end;

var
  WorkPlan: array[1..DISC_COUNT+1] of TDiscipline;      
  disc, sem, c_cred, c_exam: integer; 
 
begin
  writeln('Ввод рабочего учебного плана: ');
  
  for disc := 1 to DISC_COUNT do 
  begin
    write('   Код: ');
    readln(WorkPlan[disc].Code);
    write('   Дисциплина: ');
    readln(WorkPlan[disc].Dis); 
    write('   Трудоемкость в ЗЕ: ');
    readln(WorkPlan[disc].HourCU);    
   
    for sem := 1 to SEM_COUNT do 
      with WorkPlan[disc].Semester[sem] do   
      begin
        writeln('   Семестр №: ', sem);        
        write('      Зачет: ');
        readln(Credit);         
        write('      Экзамен: ');
        readln(Exams);           
        write('      Часы в неделю: ');
        readln(HourAudit);     
      end;
  end;
  
  with WorkPlan[DISC_COUNT+1] do
  begin
    Code := '';
    Dis := 'ИТОГО'; 
    HourCU := 0;      
    HourAstr := 0;

    for sem := 1 to SEM_COUNT do 
      with Semester[sem] do
      begin
        Credit := ' ';
        Exams := ' ';
        HourAudit := 0;
      end;    
  end;
  
  for disc := 1 to DISC_COUNT do 
  begin
    with WorkPlan[disc] do
      HourAstr := HourCU * WORK_UNIT;

    WorkPlan[DISC_COUNT+1].HourCU := WorkPlan[DISC_COUNT+1].HourCU 
      + WorkPlan[disc].HourCU;
    WorkPlan[DISC_COUNT+1].HourAstr := WorkPlan[DISC_COUNT+1].HourAstr 
      + WorkPlan[disc].HourAstr;
      
    for sem := 1 to SEM_COUNT do 
      WorkPlan[DISC_COUNT+1].Semester[sem].HourAudit := 
        WorkPlan[DISC_COUNT+1].Semester[sem].HourAudit + 
        WorkPlan[disc].Semester[sem].HourAudit;    
  end;
 
  writeln(); 
  writeln('Рабочий учебный план: '); 

  write('Дисциплина    ': 40);
  write('Трудоемкость ': 16);
  write('Зачеты ':2*SEM_COUNT+1);
  write(chr(9));
  write('Экзамены ':2*SEM_COUNT+1);  
  write(chr(9));  
  write('Семестры ');
  writeln;
  
  write('Код ': 8);
  write('Наименование ': 32);
  write('ЗЕ ':8);
  write('Час ':8);
  write('':4*SEM_COUNT+1);
  write(chr(9));
  write(chr(9));
  for sem := 1 to SEM_COUNT do 
    write(sem:4);   
  writeln;

  for disc := 1 to DISC_COUNT + 1do 
  begin
    write(WorkPlan[disc].Code:8);
    write(WorkPlan[disc].Dis:32); 
    write(WorkPlan[disc].HourCU:8);    
    write(WorkPlan[disc].HourAstr:8);    
    write(' ');
   
    c_cred := 0;
    for sem := 1 to SEM_COUNT do 
      if WorkPlan[disc].Semester[sem].Credit = '+' then
      begin
        write(sem);
        c_cred := c_cred + 1;
      end;
    write('': 2*SEM_COUNT - c_cred + 1);
    write(chr(9));
        
    c_exam := 0;
    for sem := 1 to SEM_COUNT do 
      if WorkPlan[disc].Semester[sem].Exams = '+' then
      begin
        write(sem);
        c_exam := c_exam + 1;
      end;
    write('': 2*SEM_COUNT - c_exam + 1);  
    write(chr(9));
   
    for sem := 1 to SEM_COUNT do 
      with WorkPlan[disc].Semester[sem] do   
        write(HourAudit:4:1);
        
    writeln;
  end;    
end.    
