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
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Save1Click(TObject *Sender)
{
if( SaveDialog1->Execute() )
 {
  RichEdit1->Lines->SaveToFile( SaveDialog1->FileName );
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Open1Click(TObject *Sender)
{
 if( OpenDialog1->Execute() )
 {
  RichEdit1->Lines->LoadFromFile( OpenDialog1->FileName );
 }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Exit1Click(TObject *Sender)
{
Application->Terminate();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Paste1Click(TObject *Sender)
{
RichEdit1->PasteFromClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Copy1Click(TObject *Sender)
{
RichEdit1->CopyToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Cut1Click(TObject *Sender)
{
RichEdit1->CutToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::New1Click(TObject *Sender)
{
RichEdit1->Clear();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SelectAll1Click(TObject *Sender)
{
RichEdit1->SelectAll();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Font1Click(TObject *Sender)
{
if(FontDialog1->Execute()){
 RichEdit1->Font->Name=FontDialog1->Font->Name;
 RichEdit1->Font->Size = FontDialog1->Font->Size;}        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Colour1Click(TObject *Sender)
{
if(ColorDialog1->Execute())
{
RichEdit1->SelAttributes->Color = ColorDialog1->Color;
}        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Print1Click(TObject *Sender)
{
 if(PrintDialog1->Execute()){
       RichEdit1->Print("");

   }        
}
//---------------------------------------------------------------------------
