unit QDlg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, ButtonPanel;

type

  { TFormQDlg }

  TFormQDlg = class(TForm)
    BitBtnNo: TBitBtn;
    BitBtnYes: TBitBtn;
    ImageDlg: TImage;
    LabelMsg: TLabel;
    PanelMsg: TPanel;
    PanelBtn: TPanel;
    procedure BitBtnNoClick(Sender: TObject);
    procedure BitBtnYesClick(Sender: TObject);
  private

  public
    constructor Create(AOwner: TComponent; Message: string; QCaption: string);
      reintroduce;
  end;

var
  FormQDlg: TFormQDlg;

implementation

procedure TFormQDlg.BitBtnYesClick(Sender: TObject);
begin
  Self.ModalResult:=mrYes;
  Self.Close;
end;

procedure TFormQDlg.BitBtnNoClick(Sender: TObject);
begin
  Self.ModalResult:=mrNo;
  Self.Close;
end;

constructor TFormQDlg.Create(AOwner: TComponent; Message: string; QCaption: string);
begin
  inherited Create(AOwner);
  Self.Caption:=QCaption;
  LabelMsg.Caption:=Message;
end;

{$R *.lfm}

end.

