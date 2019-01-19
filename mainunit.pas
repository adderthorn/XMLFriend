unit MainUnit;

{$TYPEDADDRESS ON}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, Menus, ComCtrls, DOM, XMLRead, LazUTF8, Clipbrd, About,
  fgoto, LCLType, LCLIntf, Grids, ActnList, StdActns, QDlg, options, IniFiles,
  helper, Types, Find, slice, SynEdit, XMLWrite, YNCDlg, clicksplitter;

type

  { TDocType }
  TDocType = (TLeft, TRight);

  { TFormMain }

  TFormMain = class(TForm)
    ActionShowStatusBar: TAction;
    ActionShowFiles: TAction;
    ActionResetSplitter: TAction;
    ActionSaveLeftAs: TAction;
    ActionSaveLeft: TAction;
    ActionViewSlice: TAction;
    ActionViewDoc: TAction;
    ActionFindNext: TAction;
    ActionExecute: TAction;
    ActionSaveRightAs: TAction;
    ActionShowRight: TAction;
    ActionShowLeft: TAction;
    ActionSaveRight: TAction;
    ActionCopyLeft: TAction;
    ActionCopyRight: TAction;
    ActionList: TActionList;
    BitBtnGo: TBitBtn;
    BitBtnLoadLeft: TBitBtn;
    BitBtnLoadRight: TBitBtn;
    ActionDelete: TEditDelete;
    EditName: TEdit;
    EditValue: TEdit;
    EditLeft: TEdit;
    EditRight: TEdit;
    GroupBoxLeft: TGroupBox;
    GroupBoxRight: TGroupBox;
    LabelNodeAtrributes: TLabel;
    MainMenu: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItemShowFiles: TMenuItem;
    MenuItemShowStatusBar: TMenuItem;
    MenuItemSep18: TMenuItem;
    MenuItemSep17: TMenuItem;
    MenuItemViewDoc: TMenuItem;
    MenuItemToSearch: TMenuItem;
    MenuItemSaveRightAs: TMenuItem;
    MenuItemSaveLeftAs: TMenuItem;
    MenuItemSep16: TMenuItem;
    MenuItemShowLeft: TMenuItem;
    MenuItemShowRight: TMenuItem;
    MenuItemSep15: TMenuItem;
    MenuItemDelete: TMenuItem;
    MenuItemSaveRight: TMenuItem;
    MenuItemSaveLeft: TMenuItem;
    MenuItemSep14: TMenuItem;
    MenuItemSave: TMenuItem;
    MenuItemOneRightToLeft: TMenuItem;
    MenuItemOneLeftToRight: TMenuItem;
    MenuItemMerge: TMenuItem;
    MenuItemSortDefault: TMenuItem;
    MenuItemSortZA: TMenuItem;
    MenuItemSortAZ: TMenuItem;
    MenuItemSort: TMenuItem;
    MenuItemSep13: TMenuItem;
    MenuItemSlice: TMenuItem;
    MenuItemReplacePubId: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItemFocusRight: TMenuItem;
    MenuItemFocusLeft: TMenuItem;
    MenuItemSep12: TMenuItem;
    MenuItemScanDups: TMenuItem;
    MenuItemSep11: TMenuItem;
    MenuItemOptions: TMenuItem;
    MenuItemTools: TMenuItem;
    MenuItemLocateAltPopup: TMenuItem;
    MenuItemLocateAlt: TMenuItem;
    MenuItemSep10: TMenuItem;
    MenuItemCollapseCurrent: TMenuItem;
    MenuItemCollapseAll: TMenuItem;
    MenuItemExpandCurrent: TMenuItem;
    MenuItemExpandAll: TMenuItem;
    MenuItemFullyCollapse: TMenuItem;
    MenuItemSep9: TMenuItem;
    MenuItemFullyExpand: TMenuItem;
    MenuItemCollapse: TMenuItem;
    MenuItemExpand: TMenuItem;
    MenuItemSep8: TMenuItem;
    MenuItemNew: TMenuItem;
    MenuItemGoTo: TMenuItem;
    MenuItemFindNext: TMenuItem;
    MenuItemShowDups: TMenuItem;
    MenuItemRU: TMenuItem;
    MenuItemLU: TMenuItem;
    MenuItemView: TMenuItem;
    MenuItemFindInTree: TMenuItem;
    MenuItemSearch: TMenuItem;
    MenuItemPopupFindTree: TMenuItem;
    MenuItemSep7: TMenuItem;
    MenuItemPopupCopyTree: TMenuItem;
    MenuItemPopupSelectAll: TMenuItem;
    MenuItemSep6: TMenuItem;
    MenuItemPopupPaste: TMenuItem;
    MenuItemPopupCopy: TMenuItem;
    MenuItemPopupCut: TMenuItem;
    MenuItemSep5: TMenuItem;
    MenuItemPopupUndo: TMenuItem;
    MenuItemSep4: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemSelectAll: TMenuItem;
    MenuItemSep3: TMenuItem;
    MenuItemPaste: TMenuItem;
    MenuItemCopy: TMenuItem;
    MenuItemCut: TMenuItem;
    MenuItemSep2: TMenuItem;
    MenuItemUndo: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemGo: TMenuItem;
    MenuItemSep1: TMenuItem;
    MenuItemLoadRight: TMenuItem;
    MenuItemLoadLeft: TMenuItem;
    MenuItemHelp: TMenuItem;
    MenuItemEdit: TMenuItem;
    MenuItemFile: TMenuItem;
    OpenDialogFormXml: TOpenDialog;
    PanelNodeInfo: TPanel;
    PanelTreeViews: TPanel;
    PanelListView: TPanel;
    PanelLoad: TPanel;
    PopupMenuTree: TPopupMenu;
    PopupMenuEditControls: TPopupMenu;
    SaveDialogFormXml: TSaveDialog;
    Splitter2: TSplitter;
    StatusBarMain: TStatusBar;
    StringGridAttributes: TStringGrid;
    TreeViewLeft: TTreeView;
    TreeViewRight: TTreeView;
    procedure ActionCopyLeftExecute(Sender: TObject);
    procedure ActionCopyRightExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionDeleteUpdate(Sender: TObject);
    procedure ActionExecuteExecute(Sender: TObject);
    procedure ActionFindNextExecute(Sender: TObject);
    procedure ActionResetSplitterExecute(Sender: TObject);
    procedure ActionSaveLeftAsExecute(Sender: TObject);
    procedure ActionSaveLeftExecute(Sender: TObject);
    procedure ActionSaveRightAsExecute(Sender: TObject);
    procedure ActionSaveRightExecute(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure ActionShowFilesExecute(Sender: TObject);
    procedure ActionShowStatusBarExecute(Sender: TObject);
    procedure ActionViewDocExecute(Sender: TObject);
    procedure ActionViewDocUpdate(Sender: TObject);
    procedure ActionViewSliceExecute(Sender: TObject);
    procedure BitBtnLoadLeftClick(Sender: TObject);
    procedure BitBtnLoadRightClick(Sender: TObject);
    procedure EditFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemCollapseClick(Sender: TObject);
    procedure MenuItemCopyClick(Sender: TObject);
    procedure MenuItemCutClick(Sender: TObject);
    procedure MenuItemEditClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemExpandClick(Sender: TObject);
    procedure MenuItemFindInTreeClick(Sender: TObject);
    procedure MenuItemFocusLeftClick(Sender: TObject);
    procedure MenuItemFocusRightClick(Sender: TObject);
    procedure MenuItemFullyCollapseClick(Sender: TObject);
    procedure MenuItemFullyExpandClick(Sender: TObject);
    procedure MenuItemGoClick(Sender: TObject);
    procedure MenuItemGoToClick(Sender: TObject);
    procedure MenuItemLocateAltClick(Sender: TObject);
    procedure MenuItemNewClick(Sender: TObject);
    procedure MenuItemOptionsClick(Sender: TObject);
    procedure MenuItemPasteClick(Sender: TObject);
    procedure MenuItemReplacePubIdClick(Sender: TObject);
    procedure MenuItemScanDupsClick(Sender: TObject);
    procedure MenuItemSortAZClick(Sender: TObject);
    procedure MenuItemToolsClick(Sender: TObject);
    procedure MenuItemViewsClick(Sender: TObject);
    procedure MenuItemSelectAllClick(Sender: TObject);
    procedure MenuItemUndoClick(Sender: TObject);
    procedure PopupMenuEditControlsPopup(Sender: TObject);
    procedure PopupMenuTreePopup(Sender: TObject);
    procedure StringGridAttributesContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure TreeViewClick(Sender: TObject);
    procedure FilePathChanged(Sender: TObject);
    procedure TreeViewLeftCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure RedrawTreeViews;
    procedure TreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeViewEnter(Sender: TObject);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SplDblClick(Sender: TObject);
  private
    IsLeftDirty, IsRightDirty: boolean;
    LeftDoc, RightDoc: TXMLDocument;
    LeftCodes, RightCodes: TStringList;
    LeftFile, RightFile: string;
    procedure ParseDoc(Doc: TXMLDocument; TV: TTreeView; Codes: TStringList);
    procedure HighlightCodes(Side: TDocType);
    procedure CompareCodes;
    procedure DoCopy(DocType: TDocType);
    procedure UpdateStatus(Msg: string);
    procedure MakeDocCleanDirty(DocType: TDocType; Clean: boolean);
    procedure SaveFile(DocType: TDocType; IsSaveAs: boolean);
  public
    AppSettings: TAppSettings;
    SelectedTree: TTreeView;
    function GetDoc(DocType: TDocType): Pointer;
  const
    INI_FILE = 'settings.ini';
    INI_SECT = 'Settings';
    INI_LEVEL = 'Level';
    INI_HEAD = 'HeaderNode';
    INI_UKEY = 'UniqueKey';
    INI_UVAL = 'UniqueValue';
    INI_SCAN_DUPS = 'ScanForDuplicates';
    INI_KEY_TYPE = 'KeyType';
    INI_SAVE = 'PreserveFiles';
    INI_LEFT = 'DefaultLeftDoc';
    INI_RIGHT = 'DefaultRightDoc';
    DEF_LEVEL = 1;
    DEF_KEY_TYPE = 0;
    DEF_KEY = 'Code';
    DEF_VALUE = '#text';
    DEF_HEAD = 'FormPattern';
  end;

var
  FormMain: TFormMain;

implementation

procedure TFormMain.FilePathChanged(Sender: TObject);
var
  CanExecute: boolean;
begin
  CanExecute:=(FileExists(EditLeft.Text) or FileExists(EditRight.Text));
  MenuItemGo.Enabled:=CanExecute;
  BitBtnGo.Enabled:=CanExecute;
end;

procedure TFormMain.MenuItemGoToClick(Sender: TObject);
begin
  FormFGoTo.Show;
end;

procedure TFormMain.MenuItemLocateAltClick(Sender: TObject);
var
  ATreeView, NewTreeView: TTreeView;
  CurrentNode: TTreeNode;
  CodeText, Msg: string;
  i: integer;
  Located: boolean;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  CurrentNode:=ATreeView.Selected;
  CodeText:=CurrentNode.Text;

  if ATreeView = TreeViewLeft then
    NewTreeView:=TreeViewRight
  else
    NewTreeView:=TreeViewLeft;

  i:=0;
  Located:=false;
  while (i < NewTreeView.Items.Count) and not Located do
  begin
    if (NewTreeView.Items[i].Level = 0) and
       (NewTreeView.Items[i].Text = CodeText) then
    begin
      Located:=true;
      Self.ActiveControl:=NewTreeView;
      CurrentNode:=NewTreeView.Items[i];
      CurrentNode.Selected:=true;
      CurrentNode.Expand(false);
    end;
    i+=1;
  end;
  if Located then
    Msg:='Node "' + CodeText + '" found.'
  else
    Msg:='Node not found!';
  UpdateStatus(Msg);
end;

procedure TFormMain.MenuItemNewClick(Sender: TObject);
var
  Reply: Integer;
  QD: TFormQDlg;
begin
  if IsLeftDirty or IsRightDirty then
  begin
    QD:=TFormQDlg.Create(Self, 'Are you sure you want to clear your workspace and start over?',
    'Are you sure?');
    Reply:=QD.ShowModal;
  if Reply = mrNo then
    Exit;
  end;
  EditLeft.Clear;
  EditRight.Clear;
  TreeViewLeft.Items.Clear;
  TreeViewRight.Items.Clear;
  Self.ActiveControl:=EditLeft;
  FreeAndNil(LeftDoc);
  FreeAndNil(RightDoc);
  FreeAndNil(LeftCodes);
  FreeAndNil(RightCodes);
  EditName.Clear;
  EditValue.Clear;
  StringGridAttributes.Clear;
  LeftFile:='';
  RightFile:='';

  StatusBarMain.Panels[0].Text:='Ready.';
  MakeDocCleanDirty(TLeft, true);
  MakeDocCleanDirty(TRight, true);
end;

procedure TFormMain.MenuItemOptionsClick(Sender: TObject);
var
  FrmOptions: TFormSettings;
begin
  FrmOptions:=TFormSettings.Create(Self, AppSettings);
  FrmOptions.ShowModal;
  AppSettings:=FrmOptions.AppSettings;
  FrmOptions.Free;
end;

procedure TFormMain.MenuItemPasteClick(Sender: TObject);
var
  Ctrl: TControl;
begin
  Ctrl:=Screen.ActiveControl;
  if Ctrl is TLabeledEdit and not TLabeledEdit(Ctrl).ReadOnly then
    TLabeledEdit(Ctrl).PasteFromClipboard
  else if Ctrl is TEdit then
    TEdit(Ctrl).PasteFromClipboard;
end;

procedure TFormMain.MenuItemReplacePubIdClick(Sender: TObject);
var
  Data: TDOMNode;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  Data:=TDOMNode(TTreeView(Self.ActiveControl).Selected.Data);
  Data.Attributes.GetNamedItem('public-id').NodeValue:='';
end;

procedure TFormMain.MenuItemScanDupsClick(Sender: TObject);
begin
  MenuItemScanDups.Checked:=not MenuItemScanDups.Checked;
  AppSettings.ScanDuplicates:=MenuItemScanDups.Checked;
end;

procedure TFormMain.MenuItemSortAZClick(Sender: TObject);
var
  ATreeView: TTreeView;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  ATreeView.SortType:=stText;
end;

procedure TFormMain.MenuItemToolsClick(Sender: TObject);
var
  e: boolean;
begin
  e:=false;
  if Self.ActiveControl is TTreeView and
     Assigned(TTreeView(Self.ActiveControl).Selected) then
  begin
    e:=true;
  end;
  MenuItemSlice.Enabled:=e;
end;

procedure TFormMain.RedrawTreeViews;
var
  ShowLeft: boolean;
  ShowRight: boolean;
  ShowDups: boolean;
  Node: TTreeNode;
begin
  ShowLeft:=MenuItemLU.Checked;
  ShowRight:=MenuItemRU.Checked;
  ShowDups:=MenuItemShowDups.Checked;

  for Node in TreeViewRight.Items do
  begin
    if Node.Level > AppSettings.Level then continue;
    if not Node.Text.StartsWith('**') then
      Node.Visible:=ShowRight
    else
      Node.Visible:=ShowDups;
  end;

  for Node in TreeViewLeft.Items do
  begin
    if Node.Level > AppSettings.Level then continue;
    if not Node.Text.StartsWith('**') then
      Node.Visible:=ShowLeft
    else
      Node.Visible:=ShowDups;
  end;
end;

procedure TFormMain.TreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = VK_RIGHT) or (Key = VK_LEFT)) and
     (ssAlt in Shift) then
     begin
       if Key = VK_LEFT then ActionCopyLeft.Execute;
       if Key = VK_RIGHT then ActionCopyRight.Execute;
       Key:=Word(#0);
     end;
end;

procedure TFormMain.TreeViewEnter(Sender: TObject);
begin
  SelectedTree:=TTreeView(Sender);
end;

procedure TFormMain.TreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Sender = Source then
  begin
    Accept:=false;
    exit;
  end;
  Accept:=true;
end;

procedure TFormMain.TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer
  );
begin
  if not (Sender is TTreeView) or not (Source is TTreeView)
     then exit;
  if Source = TreeViewLeft then
    DoCopy(TLeft)
  else if Source = TreeViewRight then
    DoCopy(TRight);
end;

procedure TFormMain.MenuItemViewsClick(Sender: TObject);
var
  Item: TMenuItem;
begin
  if not (Sender is TMenuItem) then exit;
  Item:=TMenuItem(Sender);
  item.Checked:=not Item.Checked;
  RedrawTreeViews;
end;

procedure TFormMain.MenuItemSelectAllClick(Sender: TObject);
var
  Ctrl: TControl;
begin
  Ctrl:=Screen.ActiveControl;
  if Ctrl is TCustomEdit then
    TCustomEdit(Ctrl).SelectAll
  else if Ctrl is TSynEdit then
    TSynEdit(Ctrl).SelectAll;
end;

procedure TFormMain.MenuItemUndoClick(Sender: TObject);
var
  Ctrl: TControl;
begin
  Ctrl:=Screen.ActiveControl;
  if Ctrl is TLabeledEdit and TLabeledEdit(Ctrl).CanUndo then
    TLabeledEdit(Ctrl).Undo
  else if Ctrl is TEdit then
    TEdit(Ctrl).Undo;
end;

procedure TFormMain.PopupMenuEditControlsPopup(Sender: TObject);
var
  Ctrl: TComponent;
  z, x, c, v, a: boolean;
begin
  if not (Sender is TPopupMenu) then exit;
  Ctrl:=TPopupMenu(Sender).PopupComponent;
  if Ctrl is TCustomEdit then
  begin
    a:=true;
    x:=not TCustomEdit(Ctrl).ReadOnly;
    c:=false;
    z:=false;
    v:=false;
    if TCustomEdit(Ctrl).SelLength > 0 then
      c:=true;
    if x then
    begin
      x:=c;
      z:=TCustomEdit(Ctrl).CanUndo;
      v:=Clipboard.HasFormat(PredefinedClipboardFormat(pcfText));
    end;
  end else if Ctrl is TStringGrid then
  begin
    z:=false;
    x:=false;
    c:=true;
    v:=false;
    a:=false;
  end else if Ctrl is TSynEdit then
  begin
    z:=false;
    x:=false;
    c:=false;
    if TSynEdit(Ctrl).SelStart <> TSynEdit(Ctrl).SelEnd then c:=true;
    v:=false;
    a:=true;
  end else
  begin
    z:=false;
    x:=false;
    c:=false;
    v:=false;
    a:=false;
  end;
  MenuItemPopupUndo.Enabled:=z;
  MenuItemPopupCut.Enabled:=x;
  MenuItemPopupCopy.Enabled:=c;
  MenuItemPopupPaste.Enabled:=v;
  MenuItemPopupSelectAll.Enabled:=a;
end;

procedure TFormMain.PopupMenuTreePopup(Sender: TObject);
var
  ATreeView: TTreeView;
  APopupMenu: TPopupMenu;
  ItemEnabled: boolean;
  i: integer;
begin
  APopupMenu:=TPopupMenu(Sender);
  ATreeView:=TTreeView(APopupMenu.PopupComponent);
  ItemEnabled:=false;
  If ATreeView.Items.Count > 0 then ItemEnabled:=true;
  for i:=0 to APopupMenu.Items.Count - 1 do
  begin
    APopupMenu.Items.Items[i].Enabled:=ItemEnabled;
  end;
end;

procedure TFormMain.StringGridAttributesContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  SG: TStringGrid;
  c, r: Longint;
begin
  if not (Sender is TStringGrid) then exit;
  SG:=TStringGrid(Sender);
  Self.ActiveControl:=SG;
  SG.MouseToCell(MousePos.x, MousePos.y, c, r);
  SG.Row:=r;
  SG.Col:=c;
  Handled:=false;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(INI_FILE);
  try
    with AppSettings do
    begin
      Level:=Ini.ReadInteger(INI_SECT, INI_LEVEL, DEF_LEVEL);
      UniqueKey:=Ini.ReadString(INI_SECT, INI_UKEY, DEF_KEY);
      UniqueValue:=Ini.ReadString(INI_SECT, INI_UVAL, DEF_VALUE);
      HeaderNode:=Ini.ReadString(INI_SECT, INI_HEAD, DEF_HEAD);
      ScanDuplicates:=Ini.ReadBool(INI_SECT, INI_SCAN_DUPS, true);
      KeyType:=Ini.ReadInteger(INI_SECT, INI_KEY_TYPE, DEF_KEY_TYPE);
      SaveFiles:=Ini.ReadBool(INI_SECT, INI_SAVE, false);
      if SaveFiles then
      begin
        EditLeft.Text:=Ini.ReadString(INI_SECT, INI_LEFT, '');
        EditRight.Text:=Ini.ReadString(INI_SECT, INI_RIGHT, '');
      end;
      MenuItemScanDups.Checked:=ScanDuplicates;
    end;
  finally
    Ini.Free;
  end;
  if SelectedTree = Nil then
    SelectedTree:=TreeViewLeft;
  //TClickSplitter(Splitter2).OnDblClick:=@SplDblClick;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:=TIniFile.Create(INI_FILE);
  try
    with AppSettings do
    begin
      Ini.WriteInteger(INI_SECT, INI_LEVEL, Level);
      Ini.WriteString(INI_SECT, INI_UKEY, UniqueKey);
      Ini.WriteString(INI_SECT, INI_UVAL, UniqueValue);
      Ini.WriteString(INI_SECT, INI_HEAD, HeaderNode);
      Ini.WriteBool(INI_SECT, INI_SCAN_DUPS, ScanDuplicates);
      Ini.WriteInteger(INI_SECT, INI_KEY_TYPE, KeyType);
      Ini.WriteBool(INI_SECT, INI_SAVE, SaveFiles);
      if SaveFiles then
      begin
        Ini.WriteString(INI_SECT, INI_LEFT, EditLeft.Text);
        Ini.WriteString(INI_SECT, INI_RIGHT, EditRight.Text);
      end;
    end;
  finally
    Ini.Free;
  end;
  FreeAndNil(LeftDoc);
  FreeAndNil(RightDoc);
  FreeAndNil(LeftCodes);
  FreeAndNil(RightCodes);
  FreeAndNil(TreeViewLeft);
  FreeAndNil(TreeViewRight);
  FreeAndNil(StringGridAttributes);
end;

procedure TFormMain.BitBtnLoadLeftClick(Sender: TObject);
var
  BLeftFile: string;
begin
  if OpenDialogFormXml.Execute then
  begin
    BLeftFile:=OpenDialogFormXml.FileName;
    if FileExists(BLeftFile) then
      EditLeft.Text:=BLeftFile;
  end;
end;

procedure TFormMain.ActionCopyRightExecute(Sender: TObject);
begin
  DoCopy(TLeft);
end;

procedure TFormMain.ActionDeleteExecute(Sender: TObject);
var
  Node, NodeToDelete: TDOMNode;
  DocType: TDocType;
  ATreeView: TTreeView;
  Level, i: integer;
begin
  if (Self.ActiveControl is TTreeView) then
  begin
    if (Self.ActiveControl.Name = 'TreeViewLeft') then
      DocType:=TLeft
    else
      DocType:=TRight;
    Node:=TDOMNode(TTreeView(Self.ActiveControl).Selected.Data);
    ATreeView:=TTreeView(Self.ActiveControl);
    Level:=ATreeView.Selected.Level;
    ATreeView.Selected.Delete;
    Node.Free;
    MakeDocCleanDirty(DocType, false);
  end;
end;

procedure TFormMain.ActionDeleteUpdate(Sender: TObject);
begin
  if Self.ActiveControl is TTreeView then
  begin
    TAction(Sender).Enabled:=Assigned(TTreeView(Self.ActiveControl).Selected);
  end;
end;

procedure TFormMain.ActionExecuteExecute(Sender: TObject);
var
  FileToRead: string;
begin
    UpdateStatus('Loading Left...');
  Application.ProcessMessages;
  FileToRead := EditLeft.Text;
  if Assigned(LeftDoc) then
  begin
    FreeAndNil(LeftDoc);
    TreeViewLeft.Items.Clear;
  end;
  if FileExists(FileToRead) then
  begin
    ReadXMLFile(LeftDoc, FileToRead);
    LeftFile:=FileToRead;
  end;
  if Assigned(LeftDoc) then
  begin
    LeftCodes:=TStringList.Create;
    ParseDoc(LeftDoc, TreeViewLeft, LeftCodes);
  end;

  UpdateStatus('Loading Right...');
  Application.ProcessMessages;
  FileToRead := EditRight.Text;
  if Assigned(RightDoc) then
  begin
    FreeAndNil(RightDoc);
    TreeViewRight.Items.Clear;
  end;
  if FileExists(FileToRead) then
  begin
    ReadXMLFile(RightDOc, FileToRead);
    RightFile:=FileToRead;
  end;
  if Assigned(RightDoc) then
  begin
    RightCodes:=TStringList.Create;
    ParseDoc(RightDoc, TreeViewRight, RightCodes);
  end;

  if Assigned(LeftDoc) and Assigned(RightDoc) and
     AppSettings.ScanDuplicates then
  begin
    UpdateStatus('Checking left for duplicates...');
    Application.ProcessMessages;
    HighlightCodes(TLeft);
    UpdateStatus('Checking right for duplicates...');
    Application.ProcessMessages;
    HighlightCodes(TRight);

    MenuItemLocateAlt.Enabled:=true;
  end;
  UpdateStatus('Finished!');
end;

procedure TFormMain.ActionFindNextExecute(Sender: TObject);
begin
  if FormFind.IsVisible then
  begin
    FormFind.FindNext;
  end;
end;

procedure TFormMain.ActionResetSplitterExecute(Sender: TObject);
begin
  SplDblClick(Sender);
end;

procedure TFormMain.ActionSaveLeftAsExecute(Sender: TObject);
begin
  SaveFile(TLeft, true);
end;

procedure TFormMain.ActionSaveLeftExecute(Sender: TObject);
begin
  SaveFile(TLeft, false);
end;

procedure TFormMain.ActionSaveRightAsExecute(Sender: TObject);
begin
  SaveFile(TRight, true);
end;

procedure TFormMain.ActionSaveRightExecute(Sender: TObject);
begin
  SaveFile(TRight, false);
end;

procedure TFormMain.ActionShowExecute(Sender: TObject);
begin
  if Sender = ActionShowLeft then
    TreeViewLeft.Visible:=ActionShowLeft.Checked
  else
    TreeViewRight.Visible:=ActionShowRight.Checked;
end;

procedure TFormMain.ActionShowFilesExecute(Sender: TObject);
begin
  PanelLoad.Visible:=TAction(Sender).Checked;
end;

procedure TFormMain.ActionShowStatusBarExecute(Sender: TObject);
begin
  StatusBarMain.Visible:=TAction(Sender).Checked;
end;

procedure TFormMain.ActionViewDocExecute(Sender: TObject);
begin
  if not FormSlice.IsVisible then FormSlice.Show;
  FormSlice.SliceDoc;
end;

procedure TFormMain.ActionViewDocUpdate(Sender: TObject);
begin
  if not Assigned(LeftDoc) or not Assigned(RightDoc) then
    TAction(Sender).Enabled:=false
  else
    TAction(Sender).Enabled:=true;
end;

procedure TFormMain.ActionViewSliceExecute(Sender: TObject);
begin
  if not FormSlice.IsVisible then FormSlice.Show;
  FormSlice.Slice;
end;

procedure TFormMain.ActionCopyLeftExecute(Sender: TObject);
begin
  DoCopy(TRight);
end;

procedure TFormMain.DoCopy(DocType: TDocType);
var
  ATreeView, DestTreeView: TTreeView;
  ADocument: TXMLDocument;
  Node, NewTreeNode: TTreeNode;
  DomData, ImportedNode, NewNode: TDOMNode;
  n: integer;
  DestDoc: TDocType;
begin
  case DocType of
    TLeft:
    begin
      ATreeView:=TreeViewLeft;
      DestTreeView:=TreeViewRight;
      ADocument:=RightDoc;
      DestDoc:=TRight;
    end;
    TRight:
    begin
      ATreeView:=TreeViewRight;
      DestTreeView:=TreeViewLeft;
      ADocument:=LeftDoc;
      DestDoc:=TLeft;
    end;
  end;
  Node:=ATreeView.Selected;
  if not Assigned(Node) then exit;
  if Node.Expanded then
    Node.Collapse(false);
  DomData:=TDOMNode(Node.Data);
  ImportedNode:=ADocument.ImportNode(DomData, true);
  NewNode:=ADocument;
  for n:=1 to AppSettings.Level do
    begin
      NewNode:=NewNode.ChildNodes[0];
    end;
  NewTreeNode:=DestTreeView.Items.AddChild(nil, Node.Text);
  NewNode.AppendChild(ImportedNode);
  NewTreeNode.Data:=ImportedNode;
  NewTreeNode.Selected:=true;
  UpdateStatus('Copied Node!');
  MakeDocCleanDirty(DestDoc, false);
end;

procedure TFormMain.BitBtnLoadRightClick(Sender: TObject);
var
  BRightFile: string;
begin
  if OpenDialogFormXml.Execute then
  begin
    BRightFile:=OpenDialogFormXml.FileName;
    if FileExists(BRightFile) then
      EditRight.Text:=BRightFile;
  end;
end;

procedure TFormMain.EditFileClick(Sender: TObject);
var
  Ctrl: TCustomEdit;
begin
  if not (Sender is TCustomEdit) then exit;
  Ctrl:=TCustomEdit(Sender);
  if (Ctrl.SelLength = 0) and
     not (Ctrl.SelStart = Length(Ctrl.Text)) and
     not (Ctrl.SelStart = 0) then
    Ctrl.SelectAll;
end;

procedure TFormMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  Msg: string;
  Dlg: TFormYNCDlg;
  DlgResult: integer;
begin
  if IsLeftDirty or IsRightDirty then
  begin
    Msg:='Do you want to save changes to your documents?';
    Dlg:=TFormYNCDlg.Create(Self, Msg, 'Form Normalizer');
    DlgResult:=Dlg.ShowModal;
    case DlgResult of
      mrYes:
      begin
        if IsLeftDirty then SaveFile(TLeft, false);
        if IsRightDirty then SaveFile(TRight, false);
        CloseAction:=caFree;
      end;
      mrNo:
        CloseAction:=caFree;
      mrCancel:
        CloseAction:=caNone;
    end;
  end;
end;

procedure TFormMain.MenuItemAboutClick(Sender: TObject);
begin
  FormAbout.ShowModal;
end;

procedure TFormMain.MenuItemCollapseClick(Sender: TObject);
var
  ATreeView: TTreeView;
  Node: TTreeNode;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  for Node in ATreeView.Items do
  begin
    Node.Collapse(false);
  end;
end;

procedure TFormMain.MenuItemCopyClick(Sender: TObject);
var
  Ctrl: TControl;
  SG: TStringGrid;
begin
  Ctrl := Screen.ActiveControl;
  if Ctrl is TLabeledEdit then
    TLabeledEdit(Ctrl).CopyToClipboard
  else if Ctrl is TEdit then
    TEdit(Ctrl).CopyToClipboard
  else if Ctrl is TStringGrid then
    begin
      SG:=TStringGrid(Ctrl);
      Clipboard.AsText:=SG.Cells[SG.Col, SG.Row];
    end
  else if Ctrl is TTreeView and Assigned(TTreeView(Ctrl).Selected) then
    Clipboard.AsText:=TTreeView(Ctrl).Selected.Text.Trim('**').Trim
  else if Ctrl is TSynEdit then
    TSynEdit(Ctrl).CopyToClipboard;
end;

procedure TFormMain.MenuItemCutClick(Sender: TObject);
var
  Ctrl: TControl;
  SG: TStringGrid;
begin
  Ctrl := Screen.ActiveControl;
  if Ctrl is TLabeledEdit then
    TLabeledEdit(Ctrl).CutToClipboard
  else if Ctrl is TEdit then
    TEdit(Ctrl).CutToClipboard
  else if Ctrl is TStringGrid then
  begin
    //Clipboard.AsText:=TStringGrid(Ctrl).ItemFocused.Caption;
    //if not TStringGrid(Ctrl).ReadOnly then
    //  TStringGrid(Ctrl).ItemFocused.Caption:='';
    SG:=TStringGrid(Ctrl);
    Clipboard.AsText:=SG.Cells[SG.Col, SG.Row];
  end
  else if Ctrl is TTreeView and Assigned(TTreeView(Ctrl).Selected) then
  begin
    Clipboard.AsText:=TTreeView(Ctrl).Selected.Text;
    if not TTreeView(Ctrl).ReadOnly then
    begin
      Clipboard.AsText:=TTreeView(Ctrl).Selected.Text;
      TTreeView(Ctrl).Selected.Text:='';
    end;
  end;
end;

procedure TFormMain.MenuItemEditClick(Sender: TObject);
var
  Ctrl: TControl;
  // It may seem like these are shitty variable names, but they
  // correspond to the standard shortcut keys for cut/copy/paste/undo
  c, x, z, v, a: boolean;
begin
  Ctrl:=Screen.ActiveControl;
  if Ctrl is TCustomEdit then
  begin
    x:=not TCustomEdit(Ctrl).ReadOnly;
    c:=false;
    if TCustomEdit(Ctrl).SelLength > 0 then
      c:=true;
    if x then x:=c;
    a:=true;
    z:=x;
    if x then
      z:=TCustomEdit(Ctrl).CanUndo;
    v:=Clipboard.HasFormat(PredefinedClipboardFormat(pcfText));
  end
  else if Ctrl is TTreeView then
  begin
    x:=false;
    z:=false;
    c:=true;
    v:=false;
    a:=false;
  end
  else if Ctrl is TStringGrid then
  begin
    z:=false;
    x:=false;
    c:=true;
    v:=false;
    a:=false;
  end
  else
  begin
    z:=false;
    x:=false;
    c:=false;
    v:=false;
    a:=false;
  end;
  MenuItemUndo.Enabled:=z;
  MenuItemCut.Enabled:=x;
  MenuItemCopy.Enabled:=c;
  MenuItemPaste.Enabled:=v;
  MenuItemSelectAll.Enabled:=a;
end;

procedure TFormMain.MenuItemExitClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFormMain.MenuItemExpandClick(Sender: TObject);
var
  ATreeView: TTreeView;
  Node: TTreeNode;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  for Node in ATreeView.Items do
  begin
    Node.Expand(false);
  end;
end;

procedure TFormMain.MenuItemFindInTreeClick(Sender: TObject);
begin
  FormFind.Show;
end;

procedure TFormMain.MenuItemFocusLeftClick(Sender: TObject);
begin
  Self.ActiveControl:=TreeViewLeft;
end;

procedure TFormMain.MenuItemFocusRightClick(Sender: TObject);
begin
  Self.ActiveControl:=TreeViewRight;
end;

procedure TFormMain.MenuItemFullyCollapseClick(Sender: TObject);
var
  ATreeView: TTreeView;
  Node: TTreeNode;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  Node:=ATreeView.Selected;
  if Assigned(Node) then
    Node.Collapse(true);
end;

procedure TFormMain.MenuItemFullyExpandClick(Sender: TObject);
var
  ATreeView: TTreeView;
  Node: TTreeNode;
begin
  if not (Self.ActiveControl is TTreeView) then exit;
  ATreeView:=TTreeView(Self.ActiveControl);
  Node:=ATreeView.Selected;
  if Assigned(Node) then
    Node.Expand(true);
end;

procedure TFormMain.MenuItemGoClick(Sender: TObject);
begin

end;

procedure TFormMain.TreeViewClick(Sender: TObject);
var
  ATreeView: TTreeView;
  Node: TDOMNode;
  Item: TListItem;
  i, r: Integer;
  NewNodeValue: string;
begin
  if Sender is TTreeView then
  begin
    ATreeView:=TTreeView(Sender);
    if not Assigned(ATreeView.Selected) then exit;
    Node := TDOMNode(ATreeView.Selected.Data);
    if not Assigned(Node) then exit;
    NewNodeValue:=Node.NodeValue;
    if Node.HasChildNodes and
       (Node.ChildNodes.Item[0].NodeName = '#text') then
    begin
      NewNodeValue:=Node.ChildNodes.Item[0].NodeValue;
    end;
    EditName.Text:=Node.NodeName;
    EditValue.Text:=NewNodeValue;

    StringGridAttributes.BeginUpdate;
    for r:=StringGridAttributes.RowCount - 1 downto 1 do
      StringGridAttributes.DeleteRow(r);
    if Assigned(Node.Attributes) then
    for i := 0 to Node.Attributes.Length - 1 do
    begin
      r:=i+1;
      StringGridAttributes.InsertRowWithValues(r, [
        Node.Attributes[i].NodeName,
        Node.Attributes[i].NodeValue
        ]);
      //StringGridValues.InsertRowWithValues(i,[Node.Attributes[i].NodeName,

      //Node.Attributes[i].NodeValue]);
      //Item.Caption:=Node.Attributes[i].NodeName;
      //Item.SubItems.Add(Node.Attributes[i].NodeValue);
    end;
    StringGridAttributes.EndUpdate;
    if FormSlice.IsVisible then FormSlice.Slice;
  end;
end;

procedure TFormMain.TreeViewLeftCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Text.Substring(0, 2) = '**' then
  begin
    Sender.Canvas.Font.Style:=[fsBold];
  end
  else
  begin
    Sender.Canvas.Font.Style:=[];
  end;
end;

procedure TFormMain.SplDblClick(Sender: TObject);
begin
  PanelTreeViews.Height:=496;
end;

procedure TFormMain.CompareCodes;
var
  i: integer;
begin
  //for i:= 0 to LeftCodes.Count - 1 do
  //begin
  //
  //end;
end;

procedure TFormMain.HighlightCodes(Side: TDocType);
var
  ATreeView: TTreeView;
  ACodeSet: TStringList;
  Node: TTreeNode;
begin
  if Side = TLeft then
  begin
    ATreeView:=TreeViewLeft;
    ACodeSet:=RightCodes;
  end else
  begin
    ATreeView:=TreeViewRight;
    ACodeSet:=LeftCodes;
  end;

  for Node in ATreeView.Items do
  begin
    if Node.Level > AppSettings.Level then continue;
    if ACodeSet.IndexOf(Node.Text) > -1 then
      Node.Text:='** ' + Node.Text + ' **';
  end;
end;

procedure TFormMain.ParseDoc(Doc: TXMLDocument; TV: TTreeView;
  Codes: TStringList);
var
  CodeItem: TTreeNode;
  NewLevel: integer;
  NewNode: TDOMNode;
  n: integer;
procedure DoFill(AnOwner: TTreeNode; Node: TDOMNode);
var
  i: Integer;
  AnItem: TTreeNode;
  TreeText, TextContent: string;
  AttributeNode: TDOMNode;
begin
  if not Assigned(Node) then exit;
  for i := 0 to Node.ChildNodes.Count - 1 do
  begin
    TreeText := Node.ChildNodes[i].NodeName;
    if TreeText = '#text' then
    begin
      //TV.Items.Item[TV.Items.Count - 1].Text:=Node.ChildNodes[i].NodeValue;
      continue;
    end;
    AnItem := TV.Items.AddChild(AnOwner, TreeText);
    AnItem.Data:=Node.ChildNodes[i];
    if TreeText = AppSettings.HeaderNode then
    begin
      CodeItem:=AnItem;
    end;
    if (TreeText = AppSettings.UniqueKey) and
       (AppSettings.KeyType = 0 {Node}) {and
       Assigned(CodeItem.Data)} then
    begin
      if not AppSettings.UniqueValue.StartsWith('#') then
      begin
        AttributeNode:=TDOMNode(CodeItem.Data).Attributes.GetNamedItem(
        AppSettings.UniqueValue);
        if Assigned(AttributeNode) then
          TextContent:=AttributeNode.NodeValue;
      end;
      if TextContent = '' then
        TextContent:=Node.ChildNodes[i].TextContent;
      CodeItem.Text:=TextContent;
      Codes.Add(TextContent);
    end
    else if (AppSettings.KeyType = 1 {Attribute}) then
    begin
      { TODO : Add attribute searching that makes more sense }
      //AttributeNode:=TDOMNode(CodeItem.Data).Attributes;
    end;
    if not Assigned(TV.Selected) then
      TV.Selected := AnItem;
    DoFill(AnItem, Node.ChildNodes[i]);
  end;
end;

begin
  try
    TV.Selected := nil;
    TV.Items.BeginUpdate;
    TV.Items.Clear;
    NewNode:=Doc;
    for n:=1 to AppSettings.Level do
    begin
      NewNode:=NewNode.ChildNodes[0];
    end;
    DoFill(nil, NewNode);
    TV.Items.EndUpdate;
    TreeViewClick(nil);
  except on E: Exception do
    raise E;
  end;
end;

procedure TFormMain.UpdateStatus(Msg: string);
begin
  StatusBarMain.Panels[0].Text:=Msg;
end;

procedure TFormMain.MakeDocCleanDirty(DocType: TDocType; Clean: boolean);
var
  GB: TGroupBox;
  Cap, TitleCap: string;
begin
  case DocType of
    TLeft:
    begin
      GB:=GroupBoxLeft;
      IsLeftDirty:=(not Clean);
      Cap:='Left*';
    end;
    TRight:
    begin
      GB:=GroupBoxRight;
      IsRightDirty:=(not Clean);
      Cap:='Right*';
    end;
  end;
  if Clean then Cap:=Cap.Substring(0, Cap.Length - 1);
  GB.Caption:=Cap;
  TitleCap:=Self.Caption;
  TitleCap:=TitleCap.TrimRight('*');
  if IsLeftDirty or IsRightDirty then
    TitleCap+='*';
  Self.Caption:=TitleCap;
  Application.Title:=TitleCap;
end;

procedure TFormMain.SaveFile(DocType: TDocType; IsSaveAs: boolean);
var
  DocToSave: TXMLDocument;
  FilePath: ^string;
  FileEdit: TEdit;
begin
  case DocType of
    TLeft:
    begin
      DocToSave:=LeftDoc;
      FilePath:=@LeftFile;
      FileEdit:=EditLeft;
    end;
    TRight:
    begin
      DocToSave:=RightDoc;
      FilePath:=@RightFile;
      FileEdit:=EditRight;
    end;
  end;
  if IsSaveAs then
  begin
    if SaveDialogFormXml.Execute then
    begin
      FilePath^:=SaveDialogFormXml.FileName;
    end
    else
    begin
      exit;
    end;
  end;
  FileEdit.Text:=FilePath^;
  WriteXmlFile(DocToSave, FilePath^);
  StatusBarMain.Panels.Items[0].Text:='Saved: ' + FilePath^;
  MakeDocCleanDirty(DocType, true);
end;

function TFormMain.GetDoc(DocType: TDocType): Pointer;
begin
  case DocType of
    TLeft:
      result:=@LeftDoc;
    TRight:
      result:=@RightDoc;
  end;
end;

{$R *.lfm}

end.

