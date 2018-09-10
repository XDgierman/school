//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
int r,g,b;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RadioButton1Click(TObject *Sender)
{
Panel1->Color=RGB(255,0,0);
if (CheckBox1->Checked) Panel1->Caption="255,0,0";
else Panel1->Caption="";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RadioButton2Click(TObject *Sender)
{
Panel1->Color=RGB(0,255,0);
if (CheckBox1->Checked) Panel1->Caption="0,255,0";
else Panel1->Caption="";
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RadioButton3Click(TObject *Sender)
{
Panel1->Color=RGB(0,0,255);
if (CheckBox1->Checked) Panel1->Caption="0,0,255";
else Panel1->Caption="";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ScrollBar1Change(TObject *Sender)
{
r=ScrollBar1->Position;
Panel1->Color=RGB(r,g,b);
if (CheckBox1->Checked) Panel1->Caption=IntToStr(r)+","+(g)+","+(b);
else Panel1->Caption="";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ScrollBar2Change(TObject *Sender)
{
g=ScrollBar2->Position;
Panel1->Color=RGB(r,g,b);
if (CheckBox1->Checked) Panel1->Caption=IntToStr(r)+","+(g)+","+(b);
else Panel1->Caption="";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ScrollBar3Change(TObject *Sender)
{
b=ScrollBar3->Position;
Panel1->Color=RGB(r,g,b);
if (CheckBox1->Checked) Panel1->Caption=IntToStr(r)+","+(g)+","+(b);
else Panel1->Caption="";
}
//---------------------------------------------------------------------------
