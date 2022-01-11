USES CRT;
CONST maxN = 100000;
VAR a, id:Array[1..maxN] of LongInt;
    N: LongInt;
PROCEDURE DocFile;
Var f: Text; i: Integer;
Begin
        Assign(f,'BANGNHAC.INP'); Reset(f);
        Readln(f,N);

        For i:= 1 to N do Begin Read(f,a[i]); id[i]:= i; End;


        Close(f);


End;
PROCEDURE QuickSort(l, r: LongInt);
Var i, j, t: LongInt;
Begin
i:= L; j:= R;
   Repeat
        While a[id[i]]<a[id[L]] do Inc(i);
        While a[id[L]]<a[id[j]] do Dec(j);
        If i<=j then
        begin
            t:= id[i];
            id[i]:= id[j];
            id[j]:= t;
            Inc(i);
            Dec(j);
        end;
   Until i>j;
   If i<R then QuickSort(i,R);
   If L<j then QuickSort(L,j);


End;

PROCEDURE XuLy;
Var i: LongInt; Tong, boQua:Int64;
Begin
    QuickSort(1,N);
    Tong:= a[id[1]] ;  boQua:= 0;
    For i:= 2 to N do
        begin
            boQua:= boQua + a[id[i-1]];
            Tong:= Tong + (boQua * a[id[i]]);
        end;
        Writeln('Tong = ',Tong);
End;
PROCEDURE XuLy2;
Var i: LongInt; Tong:Int64;
Begin
    QuickSort(1,N);
    Tong:= 0 ;
    For i:= 1 to N do
        begin
            Tong:= Tong + (a[i]*id[i]   );
        end;
        Writeln('Tong = ',Tong);
End;
BEGIN
Clrscr;
DocFile;

XuLy;



Readln;
END.
