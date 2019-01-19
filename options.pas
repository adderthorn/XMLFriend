unit options;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DividerBevel, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, ButtonPanel, Menus, StdCtrls, Spin, helper, about;

type

  { TFormSettings }

  TFormSettings = class(TForm)
    ButtonPanel: TButtonPanel;
    CheckBoxSaveFiles: TCheckBox;
    DividerBevelXmlSettings: TDividerBevel;
    DividerBevelMainSettings: TDividerBevel;
    EditValue: TEdit;
    EditHeader: TEdit;
    EditKey: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MainMenu: TMainMenu;
    MenuItemAbout: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSep3: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemSep2: TMenuItem;
    MenuItemUndo: TMenuItem;
    MenuItemClose: TMenuItem;
    MenuItemSep1: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemReset: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemFile: TMenuItem;
    PanelSettings: TPanel;
    RadioGroupKeyType: TRadioGroup;
    SpinLevel: TSpinEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TOBject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemCloseClick(Sender: TObject);
    procedure MenuItemCopyClick(Sender: TObject);
    procedure MenuItemCutClick(Sender: TObject);
    procedure MenuItemPasteClick(Sender: TObject);
    procedure MenuItemResetClick(Sender: TObject);
    procedure MenuItemSaveClick(Sender: TObject);
    procedure MenuItemSelectAllClick(Sender: TObject);
    procedure MenuItemUndoClick(Sender: TObject);
  private
    procedure SaveSettings;
  public
    AppSettings: TAppSettings;
    constructor Create(AOwner: TComponent; AnAppSettings: TAppSettings);
      reintroduce;
  end;

var
  FormSettings: TFormSettings;

implementation

procedure TFormSettings.SaveSettings;
begin
  with AppSettings do
  begin
    Level:=SpinLevel.Value;
    UniqueKey:=EditKey.Text;
    UniqueValue:=EditValue.Text;
    HeaderNode:=EditHeader.Text;
    KeyType:=RadioGroupKeyType.ItemIndex;
    SaveFiles:=CheckBoxSaveFiles.Checked;
  end;
end;

procedure TFormSettings.FormCreate(Sender: TObject);
begin
  with AppSettings do
  begin
      SpinLevel.Value:=Level;
      EditKey.Text:=UniqueKey;
      EditValue.Text:=UniqueValue;
      EditHeader.Text:=HeaderNode;
      RadioGroupKeyType.ItemIndex:=KeyType;
      CheckBoxSaveFiles.Checked:=SaveFiles;
  end;
end;

procedure TFormSettings.MenuItemAboutClick(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TFormSettings.MenuItemCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormSettings.MenuItemCopyClick(Sender: TObject);
var
  AControl: TControl;
begin
  AControl:=Self.ActiveControl;
  if AControl is TSpinEdit then
    TSpinEdit(AControl).CopyToClipboard
  else if AControl is TEdit then
    TEdit(AControl).CopyToClipboard;

end;

procedure TFormSettings.MenuItemCutClick(Sender: TObject);
var
  AControl: TControl;
begin
  AControl:=Self.ActiveControl;
  if AControl is TSpinEdit then
    TSpinEdit(AControl).CutToClipboard
  else if AControl is TEdit then
    TEdit(AControl).CutToClipboard;

end;

procedure TFormSettings.MenuItemPasteClick(Sender: TObject);
var
  AControl: TControl;
begin
  AControl:=Self.ActiveControl;
  if AControl is TSpinEdit then
    TSpinEdit(AControl).PasteFromClipboard
  else if AControl is TEdit then
    TEdit(AControl).PasteFromClipboard;

end;

procedure TFormSettings.CloseButtonClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormSettings.MenuItemResetClick(Sender: TObject);
begin
  FormCreate(Sender);
end;

procedure TFormSettings.MenuItemSaveClick(Sender: TObject);
begin
  SaveSettings;
  Self.Close;
end;

procedure TFormSettings.MenuItemSelectAllClick(Sender: TObject);
var
  AControl: TControl;
begin
  AControl:=Self.ActiveControl;
  if AControl is TSpinEdit then
    TSpinEdit(AControl).SelectAll
  else if AControl is TEdit then
    TEdit(AControl).SelectAll;

end;

procedure TFormSettings.MenuItemUndoClick(Sender: TObject);
var
  AControl: TControl;
begin
  AControl:=Self.ActiveControl;
  if AControl is TSpinEdit then
    TSpinEdit(AControl).Undo
  else if AControl is TEdit then
    TEdit(AControl).Undo;

end;

procedure TFormSettings.OKButtonClick(Sender: TObject);
begin
  SaveSettings;
  Self.Close;
end;

constructor TFormSettings.Create(AOwner: TComponent;
  AnAppSettings: TAppSettings);
begin
  inherited Create(AOwner);
  AppSettings:=AnAppSettings;
end;

{$R *.lfm}

end.

