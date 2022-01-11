USES CRT;
CONST maxN=1000; vc= MaxInt;   { vc: vo cuc }
VAR
ke:Array[0..maxN,0..maxN] of Integer;
i,N: Integer;
PROCEDURE DocFile;
Var f1:Text; u,v,k:Integer;
Begin
    Assign(f1,'DOTHI2.INP');
    Reset(f1);
    Read(f1,N);
    For u:= 1 to N do
        For v:= 1 to N do
                if u=v then ke[u,v]:=0
                else ke[u,v]:= vc;
        For i:= 1 to N do
        Begin
            Read(f1,u);
            While not EoLn(f1) do Read(f1,v,ke[u,v]);
            Readln(f1);
        End;

Close(f1);
End;

PROCEDURE Inkq;
Var u,v: Integer;
Begin
    For u:= 1 to N do
    Begin
        For v:= 1 to N do
                If ke[u,v] = vc then Write(#236:3)
                else Write(ke[u,v]:3);
        Writeln;

    End;
End;
BEGIN
CLRSCR;

DocFile;
Inkq;
Readln;
END.