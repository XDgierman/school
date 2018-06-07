//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
#include "Unit3.h"
#include "Unit4.h"
#include "Unit5.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm4 *Form4;
//---------------------------------------------------------------------------
__fastcall TForm4::TForm4(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm4::Button1Click(TObject *Sender)
{
        Form1->punkty++;
        Form5->Show();
        Form4->Hide();
        Form5->Label1->Caption="Twój wynik wynosi " + IntToStr(Form1->punkty);
}
//---------------------------------------------------------------------------


void __fastcall TForm4::Button2Click(TObject *Sender)
{
        Form5->Show();
        Form4->Hide();
}
//---------------------------------------------------------------------------


