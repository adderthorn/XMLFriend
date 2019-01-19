unit helper;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DOM, ExtCtrls;

type
  { TAppSettings }

  TAppSettings = record
    Level, KeyType: integer;
    UniqueKey, UniqueValue, HeaderNode, LeftFile, RightFile: string;
    ScanDuplicates: boolean;
    SaveFiles: boolean;
  end;

  TXmlConstructor = class
    public
      ResultantXml: string;
      constructor Create(Node: TDOMNode);
  end;

implementation

constructor TXmlConstructor.Create(Node: TDOMNode);
begin
  ResultantXml:='';
end;

end.

