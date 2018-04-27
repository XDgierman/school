//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
Button1->Caption="+";
Button2->Caption="-";
Button3->Caption="*";
Button4->Caption="/";
Edit1->Text="";
}
//---------------------------------------------------------------------------

