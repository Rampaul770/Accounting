unit UFiltroListadosAsientos;

interface

uses Classes, comctrls, Controls, Db, DBClient, DBCtrls, Dialogs, ExtCtrls,
     Forms, Graphics, Mask, Messages, StdCtrls, SysUtils, Windows,
     frxClass, frxDBSet, frxExportPDF,
     UFiltroListadosAsientosModel;
     
type
  TWFiltroListadosAsientos = class(TForm)
    GroupBox1: TGroupBox;
    CDSFiltro: TClientDataSet;
    DSFiltro: TDataSource;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditFECHA_DESDE: TDBEdit;
    EditFECHA_HASTA: TDBEdit;
    Label3: TLabel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    EditFECHA_IMPRIMIR: TDBEdit;
    EditASIENTO_DESDE: TDBEdit;
    EditASIENTO_HASTA: TDBEdit;
    CheckBoxSoloAsientosDesc: TCheckBox;
    RadioGroupINFORME: TDBRadioGroup;
    CheckBoxFormatoOficial: TCheckBox;
    RadioGroupConcepto: TDBRadioGroup;
    RadioGroupOrden: TDBRadioGroup;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBoxCD_ANALITICA: TDBLookupComboBox;
    ComboBoxDELEGACION: TDBLookupComboBox;
    ComboBoxDEPARTAMENTO: TDBLookupComboBox;
    ComboBoxSECCION: TDBLookupComboBox;
    ComboBoxPROYECTO: TDBLookupComboBox;
    ComboBoxDS_ANALITICA: TDBLookupComboBox;
    CheckBoxSoloAsientosMezcla: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    lTitulo: TLabel;
    Shape1: TShape;
    BtnProcess: TButton;
    CDSFiltroASIENTO_DESDE: TIntegerField;
    CDSFiltroASIENTO_HASTA: TIntegerField;
    CDSFiltroFECHA_DESDE: TDateField;
    CDSFiltroFECHA_HASTA: TDateField;
    CDSFiltroFECHA_IMPRIMIR: TDateField;
    CDSFiltroINFORME: TStringField;
    CDSFiltroORDEN: TStringField;
    CDSFiltroTIPO_CONCEPTO: TStringField;
    CDSFiltroCUENTA: TStringField;
    CDSFiltroID_DELEGACION: TStringField;
    CDSFiltroID_DEPARTAMENTO: TStringField;
    CDSFiltroID_SECCION: TStringField;
    CDSFiltroID_PROYECTO: TStringField;
    PDFExport: TfrxPDFExport;
    Enlace1: TfrxDBDataset;
    FastReportAsientos: TfrxReport;
    FastReportAsientosExpandido: TfrxReport;
    frxReport1: TfrxReport;
    procedure BtnProcessClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FModel :TFiltroListadosAsientosModel;
    procedure CallBackReportEntries;
  public
    TipoListado: Integer;
  end;

var WFiltroListadosAsientos: TWFiltroListadosAsientos;

implementation

uses DM, DMConta, Globales;

{$R *.DFM}

procedure TWFiltroListadosAsientos.FormCreate(Sender: TObject);
var nPrimerAsiento :Integer;
    nUltimoAsiento :Integer;
    dPrimeraFecha  :TDateTime;
    dUltimaFecha   :TDateTime;
begin
   FModel := TFiltroListadosAsientosModel.Create(DMRef.BDContab);
   Self.Caption := '';

   CDSFiltro.CreateDataSet;
   CDSFiltro.Active := True;
   CDSFiltro.Append;

   DMContaRef.ObtenerFiltrosDiario(nPrimerAsiento, nUltimoAsiento, dPrimeraFecha, dUltimaFecha);
   CDSFiltroASIENTO_DESDE.Value    := nPrimerAsiento;
   CDSFiltroASIENTO_HASTA.Value    := nUltimoAsiento;
   CDSFiltroFECHA_DESDE.AsDateTime := dPrimeraFecha;
   CDSFiltroFECHA_HASTA.AsDateTime := dUltimaFecha;
   CDSFiltroFECHA_IMPRIMIR.Value   := Date;
   CDSFiltroINFORME.AsString       := 'N';
   CDSFiltroORDEN.AsString         := 'A';
   CDSFiltroTIPO_CONCEPTO.AsString := 'T';
end;

procedure TWFiltroListadosAsientos.FormDestroy(Sender: TObject);
begin
   FModel.Free;
end;

procedure TWFiltroListadosAsientos.BtnProcessClick(Sender: TObject);
begin
   {Force next control selection}
   Perform(wm_NextDlgCtl, 0, 0);
   Config.SetAccountingType(CDSFiltroTIPO_CONCEPTO.AsString);
   Self.Enabled := False;
   try
      case TipoListado of
         INF_ASIENTOS: begin
            Enlace1.DataSet := FModel.DM.QInformesConta;
            FModel.LanzarInfAsientos(CallBackReportEntries,
                                     CDSFiltroASIENTO_DESDE.AsInteger  ,
                                     CDSFiltroASIENTO_HASTA.AsInteger  ,
                                     CDSFiltroFECHA_DESDE.AsDateTime   ,
                                     CDSFiltroFECHA_HASTA.AsDateTime   ,
                                     CDSFiltroFECHA_IMPRIMIR.AsDateTime,
                                     CDSFiltroTIPO_CONCEPTO.AsString   ,
                                     CDSFiltroCUENTA.AsString          ,
                                     CDSFiltroID_DELEGACION.AsString   ,
                                     CDSFiltroID_DEPARTAMENTO.AsString ,
                                     CDSFiltroID_SECCION.AsString      ,
                                     CDSFiltroID_PROYECTO.AsString     ,
                                     CDSFiltroOrden.AsString   = 'A'   ,
                                     CDSFiltroInforme.AsString = 'N'   ,
                                     CheckBoxSoloAsientosDesc.Checked  ,
                                     CheckBoxSoloAsientosMezcla.Checked,
                                     CheckBoxFormatoOficial.Checked    );
         end;
      end;
   finally
      Self.Enabled := True;
   end;
end;

procedure TWFiltroListadosAsientos.CallBackReportEntries;
begin
   PDFExport.Author          := 'senCille Accounting';
   PDFExport.ShowDialog      := False;
   PDFExport.OpenAfterExport := True;

   if CDSFiltroInforme.AsString = 'N'{ormal} then begin
      PDFExport.FileName := 'Asientos.pdf';
      FastReportAsientos.Variables['ENTERPRISE_NAME'] := ''''+DMRef.QParametrosNOMBREFISCAL.AsString+'''';
      FastReportAsientos.Variables['USER_NAME'      ] := ''''+Config.LoggedUser+'''';

      FastReportAsientos.PrepareReport(True);
      FastReportAsientos.Export(PDFExport);
   end
   else begin
      PDFExport.FileName := 'AsientosDetallado.pdf';
      FastReportAsientosExpandido.Variables['ENTERPRISE_NAME'] := ''''+DMRef.QParametrosNOMBREFISCAL.AsString+'''';
      FastReportAsientosExpandido.Variables['USER_NAME'      ] := ''''+Config.LoggedUser+'''';

      FastReportAsientosExpandido.PrepareReport(True);
      FastReportAsientosExpandido.Export(PDFExport);
   end;
end;

procedure TWFiltroListadosAsientos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F9: begin
         BtnProcess.Click;
      end;
   end;
end;

procedure TWFiltroListadosAsientos.FormShow(Sender: TObject);
begin
   EditASIENTO_DESDE.SetFocus;
end;

end.
