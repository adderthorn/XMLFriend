unit slice;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynHighlighterXML, SynEdit, Forms, Controls,
  Graphics, Dialogs, ComCtrls, Menus, ActnList, StdActns, DOM, XMLWrite, Types;

type

  { TFormSlice }

  TFormSlice = class(TForm)
    FontDialog: TFontDialog;
    MenuItemZoomIn: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItemZoom: TMenuItem;
    MenuItemSep3: TMenuItem;
    ViewZoomNormal: TAction;
    ViewZoomOut: TAction;
    ViewZoomIn: TAction;
    MenuItemLineNumbers: TMenuItem;
    MenuItemStatusBar: TMenuItem;
    MenuItemWordWrap: TMenuItem;
    MenuItemSep2: TMenuItem;
    MenuItemFont: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSep1: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemClose: TMenuItem;
    MenuItemView: TMenuItem;
    MenuItemFormat: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemFile: TMenuItem;
    ViewLineNumbers: TAction;
    ViewStatusBar: TAction;
    FormatWordWrap: TAction;
    FormatFont: TAction;
    ActionClose: TAction;
    ActionList: TActionList;
    EditCopy: TEditCopy;
    EditSelectAll: TEditSelectAll;
    MainMenu: TMainMenu;
    StatusBar: TStatusBar;
    SynEditXml: TSynEdit;
    SynXMLSyn1: TSynXMLSyn;
    procedure ActionCloseExecute(Sender: TObject);
    procedure EditCopyExecute(Sender: TObject);
    procedure EditSelectAllExecute(Sender: TObject);
    procedure FormatFontExecute(Sender: TObject);
    procedure FormatWordWrapExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure SynEditXmlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SynEditXmlMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SynEditXmlMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ViewLineNumbersExecute(Sender: TObject);
    procedure ViewStatusBarExecute(Sender: TObject);
    procedure ViewZoomInExecute(Sender: TObject);
    procedure ViewZoomNormalExecute(Sender: TObject);
    procedure ViewZoomOutExecute(Sender: TObject);
  private
    TSliceTitle, TSliceFile: string;
    CurrentSize: integer;
    procedure SetSliceTitle(NewTitle: string);
    procedure SetSliceFile(NewFile: string);
    procedure WriteXmlToEdit(IsDoc: boolean = false);
    procedure UpdateLnCol(ASynEdit: TSynEdit);
  public
    DisplayNode: TDOMNode;
    ParentNode: string;
    DisplayDoc: ^TXMLDocument;
    property SliceTitle: string read TSliceTitle write SetSliceTitle;
    property SliceFile: string read TSliceFile write SetSliceFile;
    procedure Slice;
    procedure SliceDoc;
    constructor Create(AOwner: TComponent; Node: Pointer; ParentText: string);
      reintroduce;
  end;

var
  FormSlice: TFormSlice;

implementation

{$R *.lfm}

{ TFormSlice }

uses
  MainUnit;

procedure TFormSlice.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FreeAndNil(DisplayNode);
end;

procedure TFormSlice.SynEditXmlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  UpdateLnCol(TSynEdit(Sender));
end;

procedure TFormSlice.SynEditXmlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpdateLnCol(TSynEdit(Sender));
end;

procedure TFormSlice.SynEditXmlMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if (ssCtrl in Shift) then
  begin
    if WheelDelta > 0 then
      ViewZoomInExecute(Sender)
    else if WheelDelta < 0 then
      ViewZoomOutExecute(Sender);
    Handled:=true;
  end;
end;

procedure TFormSlice.ViewLineNumbersExecute(Sender: TObject);
begin
  SynEditXml.Gutter.Visible:=TAction(Sender).Checked;
end;

procedure TFormSlice.ViewStatusBarExecute(Sender: TObject);
begin
  StatusBar.Visible:=TAction(Sender).Checked;
end;

procedure TFormSlice.ViewZoomInExecute(Sender: TObject);
begin
  SynEditXml.Font.Size:=SynEditXml.Font.Size + 1;
end;

procedure TFormSlice.ViewZoomNormalExecute(Sender: TObject);
begin
  SynEditXml.Font.Size:=CurrentSize;
end;

procedure TFormSlice.ViewZoomOutExecute(Sender: TObject);
begin
  if SynEditXml.Font.Size > 1 then
    SynEditXml.Font.Size:=SynEditXml.Font.Size - 1;
end;

procedure TFormSlice.ActionCloseExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormSlice.EditCopyExecute(Sender: TObject);
begin
  SynEditXml.CopyToClipboard;
end;

procedure TFormSlice.EditSelectAllExecute(Sender: TObject);
begin
  SynEditXml.SelectAll;
end;

procedure TFormSlice.FormatFontExecute(Sender: TObject);
begin
  FontDialog.Font:=SynEditXml.Font;
  if FontDialog.Execute then
  begin
    SynEditXml.Font:=FontDialog.Font;
    CurrentSize:=FontDialog.Font.Size;
  end;
end;

procedure TFormSlice.FormatWordWrapExecute(Sender: TObject);
begin
  { TODO : Implement word wrap }
end;

procedure TFormSlice.WriteXmlToEdit(IsDoc: boolean = false);
var
  Doc: TXMLDocument;
  RootNode, ImportedNode: TDOMNode;
  XmlText: TStringStream;
begin
  try
    XmlText:=TStringStream.Create('');
    if not IsDoc then
    begin
      Doc:=TXMLDocument.Create;
      RootNode:=Doc.CreateElement(ParentNode);
      Doc.AppendChild(RootNode);
      ImportedNode:=Doc.ImportNode(DisplayNode, true);
      RootNode.AppendChild(ImportedNode);
    end
    else
    begin
      Doc:=DisplayDoc^;
    end;
    WriteXMLFile(Doc,XmlText);
    SynEditXml.Text:=XmlText.DataString;
  finally
    if not IsDoc then
      FreeAndNil(Doc);
    FreeAndNil(XmlText);
  end;
end;

procedure TFormSlice.SetSliceTitle(NewTitle: string);
begin
  TSliceTitle:=NewTitle;
  Self.Caption:=NewTitle;
end;

procedure TFormSlice.SetSliceFile(NewFile: string);
begin
  TSliceFile:=NewFile;
  StatusBar.Panels[0].Text:=NewFile;
end;

procedure TFormSlice.Slice;
var
  TreeNode: TTreeNode;
begin
  TreeNode:=FormMain.SelectedTree.Selected;
  DisplayNode:=TDOMNode(TreeNode.Data);
  if Assigned(DisplayNode.ParentNode) then
    ParentNode:=DisplayNode.ParentNode.NodeName
  else
    ParentNode:=FormMain.AppSettings.HeaderNode;
  SliceFile:=TreeNode.Text;
  WriteXmlToEdit;
end;

procedure TFormSlice.SliceDoc;
begin
  if FormMain.SelectedTree = FormMain.TreeViewLeft then
  begin
    DisplayDoc:=FormMain.GetDoc(TLeft);
  end
  else if FormMain.SelectedTree = FormMain.TreeViewRight then
  begin
    DisplayDoc:=FormMain.GetDoc(TRight);
  end;
  WriteXMLToEdit(true);
end;

procedure TFormSlice.UpdateLnCol(ASynEdit: TSynEdit);
var
  Cur: TPoint;
  Col, Ln: integer;
begin
  Cur:=TPoint(ASynEdit.CaretXY);
  Ln:=Cur.y;
  Col:=Cur.x;
  StatusBar.Panels.Items[1].Text:='Ln ' + IntToStr(Ln) + ', Col ' +
    IntToStr(Col);
end;

constructor TFormSlice.Create(AOwner: TComponent; Node: Pointer;
  ParentText: string);
begin
  inherited Create(AOwner);
  DisplayNode:=TDOMNode(Node);
  ParentNode:=ParentText;
  WriteXmlToEdit;
  CurrentSize:=SynEditXml.Font.Size;
end;

end.

