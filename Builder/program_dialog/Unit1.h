//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Menus.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TMainMenu *MainMenu1;
        TMenuItem *File1;
        TMenuItem *New1;
        TMenuItem *Open1;
        TMenuItem *Save1;
        TMenuItem *Exit1;
        TSaveDialog *SaveDialog1;
        TOpenDialog *OpenDialog1;
        TRichEdit *RichEdit1;
        TMenuItem *Edit1;
        TMenuItem *Paste1;
        TMenuItem *Copy1;
        TMenuItem *Cut1;
        TMenuItem *SelectAll1;
        TMenuItem *Options1;
        TMenuItem *Font1;
        TMenuItem *Colour1;
        TMenuItem *Print1;
        TFontDialog *FontDialog1;
        TColorDialog *ColorDialog1;
        TPrintDialog *PrintDialog1;
        void __fastcall Save1Click(TObject *Sender);
        void __fastcall Open1Click(TObject *Sender);
        void __fastcall Exit1Click(TObject *Sender);
        void __fastcall Paste1Click(TObject *Sender);
        void __fastcall Copy1Click(TObject *Sender);
        void __fastcall Cut1Click(TObject *Sender);
        void __fastcall New1Click(TObject *Sender);
        void __fastcall SelectAll1Click(TObject *Sender);
        void __fastcall Font1Click(TObject *Sender);
        void __fastcall Colour1Click(TObject *Sender);
        void __fastcall Print1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
