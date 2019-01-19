program FormNormalizer;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, MainUnit, About, Find, fgoto, QDlg, options, helper,
  slice, YNCDlg, FindComplex, clicksplitter
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='XML Friend';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormFind, FormFind);
  Application.CreateForm(TFormFGoTo, FormFGoTo);
  Application.CreateForm(TFormQDlg, FormQDlg);
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormSlice, FormSlice);
  Application.CreateForm(TFormYNCDlg, FormYNCDlg);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

