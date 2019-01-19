unit clicksplitter;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ExtCtrls;

type
  TClickSplitter = class(TSplitter)
    published
      property OnDblClick;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TClickSplitter]);
end;

end.

