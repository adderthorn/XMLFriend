unit Find;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, ComCtrls, ActnList;

type

  { TSearchDirection }
  TSearchDirection = (TUp, TDown);

  { TFindInfo }
  TFindInfo = record
    SearchTree: TTreeView;
    SearchDirection: TSearchDirection;
    SearchText: string;
    Index: integer;
    MatchCase, ReachedEnd: Boolean;
  end;

  { TFormFind }
  TFormFind = class(TForm)
    ActionCancel: TAction;
    ActionFindNext: TAction;
    ActionList: TActionList;
    BitBtnCancel: TBitBtn;
    BitBtnFindNext: TBitBtn;
    CheckBoxCase: TCheckBox;
    EditSearch: TLabeledEdit;
    GroupBoxDirection: TGroupBox;
    RadioButtonDown: TRadioButton;
    RadioButtonUp: TRadioButton;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionFindNextExecute(Sender: TObject);
    procedure EditSearchChange(Sender: TObject);
  private

  public
    FindInfo: TFindInfo;
    procedure FindNext(TrimDupSymbol: boolean = true);
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AFindInfo: TFindInfo);
      reintroduce; overload;
  end;

var
  FormFind: TFormFind;

implementation

uses
  MainUnit, slice;

{$R *.lfm}

{ TFormFind }

constructor TFormFind.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  with FindInfo do
  begin
    Index:=0;
    SearchDirection:=TDown;
    SearchText:='';
    MatchCase:=false;
    SearchTree:=nil;
    ReachedEnd:=false;
  end;
end;

constructor TFormFind.Create(AOwner: TComponent; AFindInfo: TFindInfo);
begin
  inherited Create(AOwner);
  FindInfo:=AFindInfo;
end;

procedure TFormFind.ActionFindNextExecute(Sender: TObject);
begin
  FindNext;
end;

procedure TFormFind.ActionCancelExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormFind.EditSearchChange(Sender: TObject);
begin
  BitBtnFindNext.Enabled:=true;
end;

procedure TFormFind.FindNext(TrimDupSymbol: boolean = true);
var
  SearchStr, Msg, TreeText: string;
  ATreeView: TTreeView;
  TimeToStop: boolean;
begin
  ATreeView:=FormMain.SelectedTree;
  SearchStr:=EditSearch.Text;
  if (FindInfo.SearchText <> SearchStr) or FindInfo.ReachedEnd then
  begin
    with FindInfo do
    begin
      Index:=-1;
      SearchText:=SearchStr;
    end;
  end;
  TimeToStop:=false;
  repeat
    if RadioButtonDown.Checked then
    begin
      Inc(FindInfo.Index);
      TimeToStop:=(FindInfo.Index >= ATreeView.Items.Count - 1);
    end
    else
    begin
      Dec(FindInfo.Index);
      TimeToStop:=(FindInfo.Index <= 0);
    end;
    TreeText:=ATreeView.Items.Item[FindInfo.Index].Text;
    if TrimDupSymbol then
    begin
      TreeText:=TreeText.Trim('**').Trim;
    end;
    if (not CheckBoxCase.Checked and (CompareText(SearchStr, TreeText) = 0))
    or (CheckBoxCase.Checked and (CompareStr(SearchStr, TreeText) = 0)) then
    begin
      ATreeView.Selected:=ATreeView.Items.Item[FindInfo.Index];
      FindInfo.ReachedEnd:=false;
      break;
    end;
    FindInfo.ReachedEnd:=true;
  until (TimeToStop){ and
        (FindInfo.Index <= 0)};
  //for i:=FindInfo.Index to ATreeView.Items.Count do
  //begin
  //  if not FindInfo.MatchCase then
  //  begin
  //    if ATreeView.Items.Item[i].Text.ToLower = SearchStr.ToLower then
  //    begin
  //      ATreeView.Selected:=ATreeView.Items.Item[i];
  //      FindInfo.ReachedEnd:=false;
  //      break;
  //    end;
  //    FindInfo.ReachedEnd:=true;
  //  end;
  //end;
  if FindInfo.ReachedEnd then
  begin
    Msg:='Reached the end of the ';
    if ATreeView = FormMain.TreeViewLeft then
      Msg:=Msg + 'left'
    else if ATreeView = FormMain.TreeViewRight then
      Msg:=Msg + 'right';
    Msg:=Msg + ' tree. No more results.';
    ShowMessage(Msg);
  end;
end;

end.

