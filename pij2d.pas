
type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Chart2: TChart;
    Series12: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
 f : file of Real;
 Fi : Array [0..21,0..90] of real;
 a,b,z,Z0,r,R0,fr,fz,az,ar,vz,vr,V,alpha,qm,t,dt,Ez,Er,dr : real;
 i,j,m,n,x,y : integer;
 te : textfile;
begin

/////////// AssignFile(F,'Fi.dat');
/////////// Reset(F);
/////////// Read(f,a); n:=Round(a);
/////////// Read(f,b); m:=Round(b);
/////////// For i:=0 to n do
///////////  for j:=0 to m do
///////////   begin
///////////    Read(f,Fi[i,j]);
///////////   end;
/////////// CloseFile(f);

/////////// AssignFile(te,'3.txt');
/////////// rewrite(te);
/////////// closefile(te);

For i:=0 to m do
Form1.Series1.AddXY(i,Fi[1,i]);
For i:=0 to m do
Form1.Series2.AddXY(i,Fi[2,i]);
For i:=0 to m do
Form1.Series3.AddXY(i,Fi[3,i]);
For i:=0 to m do
Form1.Series4.AddXY(i,Fi[4,i]);
For i:=0 to m do
Form1.Series5.AddXY(i,Fi[5,i]);
For i:=0 to m do
Form1.Series6.AddXY(i,Fi[6,i]);
For i:=0 to m do
Form1.Series7.AddXY(i,Fi[7,i]);
For i:=0 to m do
Form1.Series8.AddXY(i,Fi[8,i]);
For i:=0 to m do
Form1.Series9.AddXY(i,Fi[9,i]);
For i:=0 to m do
Form1.Series11.AddXY(i,Fi[10,i]);
For i:=0 to m do
Form1.Series10.AddXY(i,Fi[11,i]);
Form1.Chart1.UndoZoom;
Form1.Chart1.ZoomPercent(95);
V:=1000;
Qm:=StrToFloat(Form1.Edit1.Text);
Alpha:=0;
Vz:=V*Cos(Alpha);
Vr:=V*Sin(Alpha);
alpha:=StrToFloat(Form1.Edit2.Text);
r:=StrToFloat(Form1.Edit3.Text)/1000;
Form1.Series12.Clear;
dt:=1E-6;
t:=0;
z:=0;
repeat
 Z0:=Z;
 Repeat
 If Z0*1000>90 then Z0:=Z0-0.090;
 Until Z0<0.09;
 Y:=Trunc(Z0*1000);
 X:=10-Trunc(R*1000);//X:=11;
 //Ez:=0;
 Ez:=(Fi[x,y]-Fi[x,y+1])*8000/0.001;
 Er:=-1*(Fi[x,y]-Fi[x+1,y])*8000/0.001;
 Z:=Z+Vz*dt+Ez*qm*dt*dt/2;
 Vz:=Vz+Ez*qm*dt;
 R:=R+Vr*dt+Er*qm*dt*dt/2;
 Vr:=Vr+Er*qm*dt;
 t:=t+dt;
 append(te);
 write(te,z:8:6);
 write(te,' ');
 writeln(te,r:8:6);
 closefile(te);
 Form1.Series12.AddXY(z,r);

Application.ProcessMessages;
until (z>2.54)or(R>=0.0099);
end;

end.
