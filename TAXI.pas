CONST maxN=100;
VAR
        a:Array[1..10] of Integer;
        f:Array[1..maxN] of LongInt;
        dd:Array[1..maxN] of Integer;
        N: Byte;
PROCEDURE DocFile;
Var ff:Text; i:Byte;
Begin
        Assign(ff,'TAXI.INP'); Reset(ff) ;
        For i:= 1 to 10 do
        begin
            Read(ff,a[i]);
            F[i]:= a[i];
        end;
        Readln(ff);
        Readln(ff,N);


        Close(ff);
End;









PROCEDURE TaoBang;
Var  i,j: Integer;
Begin
    FillChar(dd,Sizeof(dd),0);

    For i:= 11 to N do
    begin
        F[i]:= maxLongInt;
        For j:= 1 to 10 do
             If F[i]>F[i-j]+a[j] then
             begin
                 F[i]:= F[i-j]+a[j];
                 dd[i]:= j;
             end;




       end;

End;

PROCEDURE InKQ;
Var i,j: Integer; fo: Text;
Begin
    Assign(fo,'TAXI.OUT'); Rewrite(fo);

    Writeln(fo,F[N]);

    i:= N;
    While i>10 do
    begin
        j:= dd[i];
        Writeln(fo,j,#32,a[j]);
        i:= i-j;
    end;
    Writeln(fo,i,#32,a[i]);
    Close(fo);

End;
BEGIN

DocFile;
TaoBang;
InKQ;



END.