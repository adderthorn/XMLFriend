unit FindComplex;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  ComCtrls, Buttons, ExtCtrls, StdCtrls, ActnList;

type

  { TForm1 }

  TForm1 = class(TForm)
    ActionCancel: TAction;
    ActionFindNext: TAction;
    ActionList1: TActionList;
    BtnNext: TBitBtn;
    BtnCancel: TBitBtn;
    BtnOptions: TButton;
    EditFind: TLabeledEdit;
    LabelOptionsLabel: TLabel;
    PageControl: TPageControl;
    TabSheetGoTo: TTabSheet;
    TabSheetReplace: TTabSheet;
    TabSheetFind: TTabSheet;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

