unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef;

type
  Tdm = class(TDataModule)
    connInteli: TFDConnection;
    CountryTable: TFDQuery;
    FDUpdateSQLCountry: TFDUpdateSQL;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Country2: TFDQuery;
    FDUpdateSQLCountry2: TFDUpdateSQL;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Country2PAI_ID: TIntegerField;
    Country2PAI_DESCRICAO: TWideStringField;
    CountryTablePAI_ID: TIntegerField;
    CountryTablePAI_COD_IBGE: TWideStringField;
    CountryTablePAI_DESCRICAO: TWideStringField;
    CountryTablePAI_SIGLA: TWideStringField;
    CountryTablePAI_CODIGO: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
