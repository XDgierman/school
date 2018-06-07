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
TForm2 *Form2;
//---------------------------------------------------------------------------
__fastcall TForm2::TForm2(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm2::Button1Click(TObject *Sender)
{
        if(ComboBox1->ItemIndex ==0){
        Form1->punkty++;}
        Form3->Show();
        Form2->Hide();
}
//---------------------------------------------------------------------------




void __fastcall TForm2::FormCreate(TObject *Sender)
{
ComboBox1->Items->Add("Na³êczowianka");
ComboBox1->Items->Add("Kropla Beskidu");
ComboBox1->Items->Add("Powerade");
ComboBox1->Items->Add("Cappy");
}
//---------------------------------------------------------------------------

