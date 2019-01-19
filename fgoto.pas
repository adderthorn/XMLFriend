unit fgoto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons;

type

  { TFormFGoTo }

  TFormFGoTo = class(TForm)
    BitBtnCancel: TBitBtn;
    BitBtnGoTo: TBitBtn;
    EditLine: TLabeledEdit;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure EditLineChange(Sender: TObject);
    procedure EditLineKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  FormFGoTo: TFormFGoTo;

implementation

{$R *.lfm}

{ TFormFGoTo }

procedure TFormFGoTo.BitBtnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormFGoTo.EditLineChange(Sender: TObject);
var
  n, i: integer;
  OldText, NewText: string;
begin
  if not TryStrToInt(EditLine.Text, n) then
  begin
    i:=0;
    OldText:=EditLine.Text;
    NewText:='';
    while (i < OldText.Length) and TryStrToInt(OldText[i], n) do
    begin
      NewText:=NewText+OldText[i];
      i+=1;
    end;
    EditLine.Text:=NewText;
  end;
  NewText:=EditLine.Text;
  BitBtnGoTo.Enabled:=(NewText.Length > 0);
end;

procedure TFormFGoTo.EditLineKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8, #127]) then
    Key:=#0;
end;

end.

