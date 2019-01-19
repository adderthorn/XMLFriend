unit About;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Menus, ExtCtrls, LCLIntf;

type

  { TFormAbout }

  TFormAbout = class(TForm)
    BitBtnOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MemoAbout: TMemo;
    PanelInfo: TPanel;
    procedure BitBtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Label4Click(Sender: TObject);
  private

  public

  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.lfm}

{ TFormAbout }

procedure TFormAbout.BitBtnOkClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormAbout.FormKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #27 then Self.Close;
end;

procedure TFormAbout.Label4Click(Sender: TObject);
begin
  Label4.Font.Color:=clPurple;
  OpenUrl('https://www.noahw.org/contact/');
end;

end.

