//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int h,m,s;
String S,M,H;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
s=0;
m=0;
h=0;
Label1->Caption=s;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
if (s>=59) {m++; s=0;};
if (m>=59) {h++; m=0;};
if (h>=24) h=0;
if(s<10) S="0"+IntToStr(s);
else S=IntToStr(s);
if(m<10) M="0"+IntToStr(m);
else M=IntToStr(m);
if(h<10) H="0"+IntToStr(h);
else H=IntToStr(h);
s++;
Label1->Caption=H+":"+M+":"+S;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button1Click(TObject *Sender)
{
h++;        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button2Click(TObject *Sender)
{
m++;        
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Button3Click(TObject *Sender)
{
s=0;        
}
//---------------------------------------------------------------------------

