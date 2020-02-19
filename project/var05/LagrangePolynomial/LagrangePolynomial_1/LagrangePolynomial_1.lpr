{************************************************************}
{                                                            }
{                 Проект LagrangePolynomial                  }
{     Copyright (c) 2019  ФГБОУ ВО РГРТУ им. В.Ф. Уткина     }
{                       ФВТ/кафедра КТ                       }
{                                                            }
{     Разработчик: ст. гр. 848 Климчук Н.В.                  }
{     Модифицирован: 20 декабря 2019 года                    }
{                                                            }
{************************************************************}

program LagrangePolynomial_1;

{$codepage utf8}

var
     x, x1, x2, x3, x4, x5: extended;
     a, b, c, d, e, f, g, h, i, j, k: extended;

begin
     writeln('Программа разработана для интерполяции');
     writeln('математических функций многочленом Лагранжа');
     writeln('*******************************************************');
     writeln('Интерполяционный многочлен в форме Лагранжа – это');
     writeln('математическая функция позволяющая записать полином');
     writeln('n-степени, который будет соединять все заданные');
     writeln('точки из набора значений, полученных опытным путём');
     writeln('или методом случайной выборки в различные моменты');
     writeln('времени с непостоянным временным шагом измерений');
     writeln('*******************************************************');
     writeln('Рекомендуемый набор значений: 5 элементов');
     writeln('Каждому введённому элементу будет соответствовать');
     writeln('определённая переменная: x1, x2, x3, x4, x5');
     writeln('Значения переменным будут присваиваться строго');
     writeln('в порядке ввода данных самим пользователем');
     writeln('*******************************************************');
     writeln('Вводить значения необходимо через пробел');
     writeln('Для продолжения введите данные...');
     readln(x1, x2, x3, x4, x5);
     writeln('Введённые данные...');
     writeln('x1 = ', x1:5:4);
     writeln('x2 = ', x2:5:4);
     writeln('x3 = ', x3:5:4);
     writeln('x4 = ', x4:5:4);
     writeln('x5 = ', x5:5:4);
     writeln('Для продолжения введите x...');
     readln(x);
     writeln('Введённые данные...');
     writeln('x = ', x:5:4);
     writeln('Для продолжения нажмите Enter...');
     readln();

     // Вычисление f(x1);
     a:=((x-x2)*(x-x3)*(x-x4)*(x-x5))/((x1-x2)*(x1-x3)*(x1-x4)*(x1-x5));

     // Вычисление f(x2);
     b:=((x-x1)*(x-x3)*(x-x4)*(x-x5))/((x2-x1)*(x2-x3)*(x2-x4)*(x2-x5));

     // Вычисление f(x3);
     c:=((x-x1)*(x-x2)*(x-x4)*(x-x5))/((x3-x1)*(x3-x2)*(x3-x4)*(x3-x5));

     // Вычисление f(x4);
     d:=((x-x1)*(x-x2)*(x-x3)*(x-x5))/((x4-x1)*(x4-x2)*(x4-x3)*(x4-x5));

     // Вычисление f(x5);
     e:=((x-x1)*(x-x2)*(x-x3)*(x-x4))/((x5-x1)*(x5-x2)*(x5-x3)*(x5-x4));

     // Вычисление L(x);
     f:=a+b+c+d+e;

     // Вычисление x1 - f(x1);
     g:=(x1-a);

     // Вычисление x2 - f(x2);
     h:=(x2-b);

     // Вычисление x3 - f(x3);
     i:=(x3-c);

     // Вычисление x4 - f(x4);
     j:=(x4-d);

     // Вычисление x5 - f(x5);
     k:=(x5-e);

     // Вывод результатов;
     writeln('Промежуточные результаты');
     writeln('f(x1) = ', a:5:4);
     writeln('f(x2) = ', b:5:4);
     writeln('f(x3) = ', c:5:4);
     writeln('f(x4) = ', d:5:4);
     writeln('f(x5) = ', e:5:4);

     writeln('Итоговые результаты');
     writeln('L(x) = ', f:5:4);

     writeln('Дополнительные результаты');
     writeln('x1 - f(x1) = ', g:5:4);
     writeln('x2 - f(x2) = ', h:5:4);
     writeln('x3 - f(x3) = ', i:5:4);
     writeln('x4 - f(x4) = ', j:5:4);
     writeln('x5 - f(x5) = ', k:5:4);

     writeln('Для завершения работы нажмите Enter...');
     readln();
end.
