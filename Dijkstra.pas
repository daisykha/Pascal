USES Crt;
CONST maxN=5000;
VAR  a:Array[1..maxN,1..maxN] of Integer;
     d:Array[0..maxN] of LongInt;
     truoc:Array[1..maxN] of Integer;
     dd:Array[1..maxN] of Boolean;
     n,m:Integer;

PROCEDURE DocFile;
Var f:Text; u,v,i:Integer;
Begin
    Assign(f,'Dijkstra.inp'); Reset(f);
    Readln(f,n,m);
    FillChar(a,sizeof(a),0);
    For i:=1 to m do Readln(f,u,v,a[u,v]);
    Close(f);
End;

PROCEDURE Dijkstra(s:Integer);
Var u,v:Integer;
Begin
    For u:=0 to n do d[u]:=maxLongInt;
    FillChar(truoc,sizeof(truoc),0);
    FillChar(dd,sizeof(dd),False);
    d[s]:=0;
    Repeat
        u:=0;
        For v:=1 to n do
            if not(dd[v])and(d[v]<d[u]) then u:=v;
        if u=0 then exit;
        dd[u]:=True;
        For v:=1 to n do
            if (a[u,v]>0)and(d[v]>d[u]+a[u,v]) then
            begin
                d[v]:=d[u]+a[u,v];
                truoc[v]:=u;
            end;
    Until False;
End;

PROCEDURE InKQ;
Var u:Integer;
Begin
    Writeln('Khoang cach ngan nhat:');
    For u:=1 to n do Write('d[',u,']=',d[u],#32);
    Writeln;
    Writeln('Dinh truoc:');
    For u:=1 to n do Write('truoc[',u,']=',truoc[u],#32);
End;

BEGIN
    Clrscr;
    DocFile;
    Dijkstra(1);
    InKQ;
    Readln;
END.