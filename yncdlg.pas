unit YNCDlg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ButtonPanel, Buttons, StdCtrls;

type

  { TFormYNCDlg }

  TFormYNCDlg = class(TForm)
    BtnCancel: TBitBtn;
    BtnSave: TBitBtn;
    BtnDontSave: TBitBtn;
    Image1: TImage;
    LabelMsg: TLabel;
    PanelBtn: TPanel;
    PanelMsg: TPanel;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnDontSaveClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private

  public
    constructor Create(AnOwner: TComponent; Message: string; MCaption: string);
      reintroduce;
  end;

var
  FormYNCDlg: TFormYNCDlg;

implementation

{$R *.lfm}

{ TFormYNCDlg }

procedure TFormYNCDlg.BtnSaveClick(Sender: TObject);
begin
  Self.ModalResult:=mrYes;
end;

procedure TFormYNCDlg.BtnDontSaveClick(Sender: TObject);
begin
  Self.ModalResult:=mrNo;
end;

procedure TFormYNCDlg.BtnCancelClick(Sender: TObject);
begin
  Self.ModalResult:=mrCancel;
end;

constructor TFormYNCDlg.Create(AnOwner: TComponent; Message: string;
  MCaption: string);
begin
  inherited Create(AnOwner);
  Self.Caption:=MCaption;
  LabelMsg.Caption:=Message;
end;

end.

