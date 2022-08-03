unit UDados;

interface

uses
  System.Classes, uDWDataModule, uDWAbout, uRESTDWServerEvents,
  uDWJSONObject, Data.DB, IdHashMessageDigest, StrUtils, System.DateUtils,
  FMX.Dialogs,
  uDWConsts, IdBaseComponent, IdCoder, IdCoder3to4,
  IdCoderMIME, Soap.EncdDecd, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TTDados = class(TServerMethodDataModule)
    DWEvents: TDWServerEvents;
    conexaoPG: TFDConnection;
    linkPG: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    sqlEmpresas: TFDQuery;
    sqlEmpresasempr_id: TLargeintField;
    sqlEmpresasempr_nome: TStringField;
    sqlEmpresasempr_razao: TStringField;
    sqlEmpresasempr_cnpj: TStringField;
    sqlEmpresasempr_data_cad: TSQLTimeStampField;
    sqlEmpresasempr_status: TStringField;
    sqlEmpresaPorCNPJ: TFDQuery;
    sqlEmpresaPorCNPJempr_id: TLargeintField;
    sqlEmpresaPorCNPJempr_nome: TStringField;
    sqlEmpresaPorCNPJempr_razao: TStringField;
    sqlEmpresaPorCNPJempr_cnpj: TStringField;
    sqlEmpresaPorCNPJempr_data_cad: TSQLTimeStampField;
    sqlEmpresaPorCNPJempr_status: TStringField;
    sqlUsuarios: TFDQuery;
    sqlUsuariosusua_id: TLargeintField;
    sqlUsuariosusua_nome: TStringField;
    sqlUsuariosusua_cpf: TStringField;
    sqlUsuariosusua_email: TStringField;
    sqlUsuariosusua_senha: TStringField;
    sqlUsuariosusua_data_cad: TSQLTimeStampField;
    sqlUsuariosusua_status: TStringField;
    sqlUsuariosPorEmpresa: TFDQuery;
    sqlUsuariosPorEmpresausua_id: TLargeintField;
    sqlUsuariosPorEmpresausua_nome: TStringField;
    sqlUsuariosPorEmpresausua_cpf: TStringField;
    sqlUsuariosPorEmpresausua_email: TStringField;
    sqlUsuariosPorEmpresausua_senha: TStringField;
    sqlUsuariosPorEmpresausua_data_cad: TSQLTimeStampField;
    sqlUsuariosPorEmpresausua_status: TStringField;
    sqlUsuariosPorID: TFDQuery;
    sqlUsuariosPorIDusua_id: TLargeintField;
    sqlUsuariosPorIDusua_nome: TStringField;
    sqlUsuariosPorIDusua_cpf: TStringField;
    sqlUsuariosPorIDusua_email: TStringField;
    sqlUsuariosPorIDusua_senha: TStringField;
    sqlUsuariosPorIDusua_data_cad: TSQLTimeStampField;
    sqlUsuariosPorIDusua_status: TStringField;
    sqlUsuariosPorEmail: TFDQuery;
    sqlUsuariosPorEmailusua_id: TLargeintField;
    sqlUsuariosPorEmailusua_nome: TStringField;
    sqlUsuariosPorEmailusua_cpf: TStringField;
    sqlUsuariosPorEmailusua_email: TStringField;
    sqlUsuariosPorEmailusua_senha: TStringField;
    sqlUsuariosPorEmailusua_data_cad: TSQLTimeStampField;
    sqlUsuariosPorEmailusua_status: TStringField;
    sqlEmpresasempr_questor_empresa: TIntegerField;
    sqlEmpresasempr_questor_estabelecimento: TIntegerField;
    sqlEmpresaPorCNPJempr_questor_empresa: TIntegerField;
    sqlEmpresaPorCNPJempr_questor_estabelecimento: TIntegerField;
    sqlEmpresasPorEmail: TFDQuery;
    sqlEmpresasPorEmailempr_id: TLargeintField;
    sqlEmpresasPorEmailempr_nome: TStringField;
    sqlEmpresasPorEmailempr_razao: TStringField;
    sqlEmpresasPorEmailempr_cnpj: TStringField;
    sqlEmpresasPorEmailempr_questor_empresa: TIntegerField;
    sqlEmpresasPorEmailempr_questor_estabelecimento: TIntegerField;
    sqlEmpresasPorEmailempr_data_cad: TSQLTimeStampField;
    sqlEmpresasPorEmailempr_status: TStringField;
    conexaoQuestor: TFDConnection;
    sqlFuncionarios: TFDQuery;
    sqlFuncionariosCODIGOFUNCCONTR: TIntegerField;
    sqlFuncionariosCODIGOEMPRESA: TSmallintField;
    sqlFuncionariosDATAADM: TDateField;
    sqlFuncionariosNOMEFUNC: TStringField;
    sqlFuncionariosNOMESOCIAL: TStringField;
    sqlFuncionariosDESCRSIT: TStringField;
    sqlSolicitacoes: TFDQuery;
    sqlSolicitacoesPorEmpresa: TFDQuery;
    sqlSolicitacoesPorOperador: TFDQuery;
    sqlSolicitacoessoli_id: TLargeintField;
    sqlSolicitacoessoli_id_empresa: TIntegerField;
    sqlSolicitacoessoli_id_usuario: TIntegerField;
    sqlSolicitacoessoli_id_operador: TIntegerField;
    sqlSolicitacoessoli_id_categoria: TIntegerField;
    sqlSolicitacoessoli_id_prioridade: TIntegerField;
    sqlSolicitacoessoli_data_cad: TSQLTimeStampField;
    sqlSolicitacoessoli_data_fim: TSQLTimeStampField;
    sqlSolicitacoessoli_avaliacao: TIntegerField;
    sqlSolicitacoessoli_assunto: TStringField;
    sqlSolicitacoessoli_conteudo: TMemoField;
    sqlSolicitacoessoli_status: TStringField;
    sqlSolicitacoesPorEmpresasoli_id: TLargeintField;
    sqlSolicitacoesPorEmpresasoli_id_empresa: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_id_usuario: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_id_operador: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_id_categoria: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_id_prioridade: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_data_cad: TSQLTimeStampField;
    sqlSolicitacoesPorEmpresasoli_data_fim: TSQLTimeStampField;
    sqlSolicitacoesPorEmpresasoli_avaliacao: TIntegerField;
    sqlSolicitacoesPorEmpresasoli_assunto: TStringField;
    sqlSolicitacoesPorEmpresasoli_conteudo: TMemoField;
    sqlSolicitacoesPorEmpresasoli_status: TStringField;
    sqlSolicitacoesPorOperadorsoli_id: TLargeintField;
    sqlSolicitacoesPorOperadorsoli_id_empresa: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_id_usuario: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_id_operador: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_id_categoria: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_id_prioridade: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_data_cad: TSQLTimeStampField;
    sqlSolicitacoesPorOperadorsoli_data_fim: TSQLTimeStampField;
    sqlSolicitacoesPorOperadorsoli_avaliacao: TIntegerField;
    sqlSolicitacoesPorOperadorsoli_assunto: TStringField;
    sqlSolicitacoesPorOperadorsoli_conteudo: TMemoField;
    sqlSolicitacoesPorOperadorsoli_status: TStringField;
    sqlSolicitacoesPorID: TFDQuery;
    sqlSolicitacoesPorIDsoli_id: TLargeintField;
    sqlSolicitacoesPorIDsoli_id_empresa: TIntegerField;
    sqlSolicitacoesPorIDsoli_id_usuario: TIntegerField;
    sqlSolicitacoesPorIDsoli_id_operador: TIntegerField;
    sqlSolicitacoesPorIDsoli_id_categoria: TIntegerField;
    sqlSolicitacoesPorIDsoli_id_prioridade: TIntegerField;
    sqlSolicitacoesPorIDsoli_data_cad: TSQLTimeStampField;
    sqlSolicitacoesPorIDsoli_data_fim: TSQLTimeStampField;
    sqlSolicitacoesPorIDsoli_avaliacao: TIntegerField;
    sqlSolicitacoesPorIDsoli_assunto: TStringField;
    sqlSolicitacoesPorIDsoli_conteudo: TMemoField;
    sqlSolicitacoesPorIDsoli_status: TStringField;
    sqlSolicitacoesMensagens: TFDQuery;
    sqlSolicitacoesMensagensmens_id: TLargeintField;
    sqlSolicitacoesMensagensmens_id_solicitacao: TIntegerField;
    sqlSolicitacoesMensagensmens_id_usuario: TIntegerField;
    sqlSolicitacoesMensagensmens_id_operador: TIntegerField;
    sqlSolicitacoesMensagensmens_data: TSQLTimeStampField;
    sqlSolicitacoesMensagensmens_avaliacao: TIntegerField;
    sqlSolicitacoesMensagensmens_conteudo: TMemoField;
    sqlSolicitacoesMensagensmens_anexo: TMemoField;
    sqlSolicitacoesMensagensmens_status: TStringField;
    sqlSolicitacoesMensagensmens_origem: TStringField;
    sqlSolicitacoesnome_operador: TStringField;
    sqlSolicitacoesnome_usuario: TStringField;
    sqlSolicitacoesMensagensnome_operador: TStringField;
    sqlSolicitacoesMensagensnome_usuario: TStringField;
    sqlSolicitacoesfuncao_operador: TStringField;
    sqlSolicitacoesfuncao_usuario: TStringField;
    sqlSolicitacoesMensagensfuncao_operador: TStringField;
    sqlSolicitacoesMensagensfuncao_usuario: TStringField;
    sqlUsuariosusua_funcao: TStringField;
    sqlUsuariosPorEmpresausua_funcao: TStringField;
    sqlUsuariosPorIDusua_funcao: TStringField;
    sqlUsuariosPorEmailusua_funcao: TStringField;
    sqlGeral: TFDQuery;
    sqlVincularEmpresaUsuario: TFDQuery;
    sqlVincularEmpresaUsuariousue_id: TLargeintField;
    sqlVincularEmpresaUsuariousue_id_usuario: TIntegerField;
    sqlVincularEmpresaUsuariousue_id_empresa: TIntegerField;
    sqlOperadores: TFDQuery;
    sqlOperadoresPorID: TFDQuery;
    sqlOperadoresPorEmail: TFDQuery;
    sqlOperadoresoper_id: TLargeintField;
    sqlOperadoresoper_nome: TStringField;
    sqlOperadoresoper_cpf: TStringField;
    sqlOperadoresoper_email: TStringField;
    sqlOperadoresoper_senha: TStringField;
    sqlOperadoresoper_data_cad: TSQLTimeStampField;
    sqlOperadoresoper_status: TStringField;
    sqlOperadoresoper_funcao: TStringField;
    sqlOperadoresPorIDoper_id: TLargeintField;
    sqlOperadoresPorIDoper_nome: TStringField;
    sqlOperadoresPorIDoper_cpf: TStringField;
    sqlOperadoresPorIDoper_email: TStringField;
    sqlOperadoresPorIDoper_senha: TStringField;
    sqlOperadoresPorIDoper_data_cad: TSQLTimeStampField;
    sqlOperadoresPorIDoper_status: TStringField;
    sqlOperadoresPorIDoper_funcao: TStringField;
    sqlOperadoresPorEmailoper_id: TLargeintField;
    sqlOperadoresPorEmailoper_nome: TStringField;
    sqlOperadoresPorEmailoper_cpf: TStringField;
    sqlOperadoresPorEmailoper_email: TStringField;
    sqlOperadoresPorEmailoper_senha: TStringField;
    sqlOperadoresPorEmailoper_data_cad: TSQLTimeStampField;
    sqlOperadoresPorEmailoper_status: TStringField;
    sqlOperadoresPorEmailoper_funcao: TStringField;
    sqlObtemDadosUsuario: TFDQuery;
    sqlObtemDadosUsuarioid: TLargeintField;
    sqlObtemDadosUsuarioemail: TStringField;
    sqlObtemDadosUsuariotipo: TMemoField;
    sqlObtemDadosUsuarionome: TStringField;
    sqlOperadoresoper_perm_empresas: TStringField;
    sqlOperadoresoper_perm_usuarios: TStringField;
    sqlOperadoresoper_perm_operadores: TStringField;
    sqlOperadoresPorIDoper_perm_empresas: TStringField;
    sqlOperadoresPorIDoper_perm_usuarios: TStringField;
    sqlOperadoresPorIDoper_perm_operadores: TStringField;
    sqlOperadoresPorEmailoper_perm_empresas: TStringField;
    sqlOperadoresPorEmailoper_perm_usuarios: TStringField;
    sqlOperadoresPorEmailoper_perm_operadores: TStringField;
    sqlObtemDadosUsuarioperm_empresas: TStringField;
    sqlObtemDadosUsuarioperm_usuarios: TStringField;
    sqlObtemDadosUsuarioperm_operadores: TStringField;
    sqlEstatisticasSolicitacoes: TFDQuery;
    sqlEstatisticasSolicitacoessoli_status: TStringField;
    sqlEstatisticasSolicitacoescount: TLargeintField;
    procedure DWEventsEventsGetDataHoraReplyEvent(var Params: TDWParams; var Result: string);
    procedure DWEventsEventsMvtoBancarioEnviarOfxReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsEmpresasReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
    procedure DWEventsEventsUsuariosReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsFuncionariosReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsSolicitacoesReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsVincularUsuarioEmpresaReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsOperadoresReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsObtemDadosUsuarioReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsObtemEstatisticasSolicitacoesReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
    procedure DWEventsEventsDesvincularUsuarioEmpresaReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
  private
    { Private declarations }
    function GetOfxCabecalho(arquivo: String): String;
    function GetOfxTransacoes(arquivo: String): String;
    function ConverterBase64Cabecalho(base64: String): String;
    function ConverterBase64Transacoes(base64: String): String;
    function ConverteBooleanRecebido(Info: Integer): Boolean;
    procedure GeraLog(Texto: String);
  public
    { Public declarations }
  end;

var
  TDados: TTDados;

implementation

uses
  uDWJSON, System.JSON, ofxreader, IdGlobal, System.SysUtils, Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

function TTDados.ConverteBooleanRecebido(Info: Integer): Boolean;
begin

  if Info = 0 then
    Result := false;

  if Info = 0 then
    Result := true;
end;

function TTDados.ConverterBase64Cabecalho(base64: String): String;
var
  NomeArquivo, ArquivoTratado: String;
  Input: TStringStream;
  Output: TBytesStream;
  IdMD5: TIdHashMessageDigest5;
begin

  ArquivoTratado := base64;

  ArquivoTratado := Copy(ArquivoTratado, Pos('base64,', ArquivoTratado) + 7, Length(ArquivoTratado));

  try

    IdMD5 := TIdHashMessageDigest5.Create;

    Input := TStringStream.Create(ArquivoTratado, TEncoding.ASCII);
    Output := TBytesStream.Create;
    Soap.EncdDecd.DecodeStream(Input, Output);
    NomeArquivo := IdMD5.HashStringAsHex(DateTimeToStr(Now)) + '.ofx';
    Output.SaveToFile(ExtractFileDir(GetCurrentDir) + '\' + NomeArquivo);
    Result := GetOfxCabecalho(ExtractFileDir(GetCurrentDir) + '\' + NomeArquivo);

  finally
    IdMD5.Free;
    Input.Free;
    Output.Free;
  end;
end;

procedure TTDados.GeraLog(Texto: String);
var
  arq: TextFile;
  Caminho: String;
  textocompleto: String;
begin
  try
    ForceDirectories('c:\Connect\Log\');
    Caminho := 'c:\Connect\Log\log_' + FormatDateTime('dd-mm-yyyy', Now) + '.txt';
    AssignFile(arq, Caminho);
    if FileExists(Caminho) then
      Append(arq)
    else
      Rewrite(arq);
    textocompleto := DateTimeToStr(Now) + '  -  ' + Texto;
    Writeln(arq, textocompleto);
  finally
    CloseFile(arq);
  end;
end;

function TTDados.GetOfxCabecalho(arquivo: String): String;
var
  OFXReader1: TOFXReader;
  i: Integer;
  LJson, LJsonObject: TJSONObject;
  LArr: TJSONArray;

begin
  try
    OFXReader1 := TOFXReader.Create(nil);

    OFXReader1.OFXFile := arquivo;
    try
      OFXReader1.Import;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;

    // Create JSON
    LJsonObject := TJSONObject.Create;
    LJsonObject.AddPair(TJSONPair.Create('Banco', OFXReader1.BankID));
    LJsonObject.AddPair(TJSONPair.Create('Agencia', OFXReader1.BranchID));
    LJsonObject.AddPair(TJSONPair.Create('Conta', OFXReader1.AccountID));

    LJsonObject.AddPair(TJSONPair.Create('Saldo Final', OFXReader1.FinalBalance));

    Result := LJsonObject.ToString;

  finally
    LJsonObject.Free;
    FreeAndNil(OFXReader1);
  end;
end;

function TTDados.GetOfxTransacoes(arquivo: String): String;
var
  OFXReader1: TOFXReader;
  i: Integer;
  lista: TJSONObject;
  Indice: TJSONArray;
begin
  try
    OFXReader1 := TOFXReader.Create(nil);

    OFXReader1.OFXFile := arquivo;
    try
      OFXReader1.Import;
    except
      on E: Exception do
        raise Exception.Create('Error Message: ' + E.Message);
    end;

    // Create JSON
    Indice := TJSONArray.Create;

    for i := 0 to OFXReader1.Count - 1 do
    begin

      lista := TJSONObject.Create;

      lista.AddPair('indice', IntToStr(i));
      lista.AddPair('transacao', OFXReader1.Get(i).ID);
      lista.AddPair('documento', OFXReader1.Get(i).Document);
      lista.AddPair('data', DateToStr(OFXReader1.Get(i).MovDate));
      lista.AddPair('tipo', OFXReader1.Get(i).MovType);
      lista.AddPair('valor', OFXReader1.Get(i).Value);
      lista.AddPair('descricao', OFXReader1.Get(i).Description);

      if StrToFloat(ReplaceStr(OFXReader1.Get(i).Value, '.', ',')) > 0 then
        lista.AddPair('es', 'E')
      else
        lista.AddPair('es', 'S');

      Indice.Add(lista);

    end;
    Result := Indice.ToString;

  finally
    lista.Free;
    FreeAndNil(OFXReader1);
  end;
end;

procedure TTDados.ServerMethodDataModuleCreate(Sender: TObject);
begin
  conexaoPG.Connected := true;
end;

function TTDados.ConverterBase64Transacoes(base64: String): String;
var
  NomeArquivo, ArquivoTratado: String;
  Input: TStringStream;
  Output: TBytesStream;
  IdMD5: TIdHashMessageDigest5;
begin
  ArquivoTratado := base64;

  ArquivoTratado := Copy(ArquivoTratado, Pos('base64,', ArquivoTratado) + 7, Length(ArquivoTratado));

  try

    IdMD5 := TIdHashMessageDigest5.Create;

    Input := TStringStream.Create(ArquivoTratado, TEncoding.ASCII);
    Output := TBytesStream.Create;
    Soap.EncdDecd.DecodeStream(Input, Output);
    NomeArquivo := IdMD5.HashStringAsHex(DateTimeToStr(Now)) + '.ofx';
    Output.SaveToFile(ExtractFileDir(GetCurrentDir) + '\' + NomeArquivo);
    Result := GetOfxTransacoes(ExtractFileDir(GetCurrentDir) + '\' + NomeArquivo);

  finally
    IdMD5.Free;
    Input.Free;
    Output.Free;
  end;
end;

procedure TTDados.DWEventsEventsDesvincularUsuarioEmpresaReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  dados, devolvido: TJSONObject;
  usuario, empresa: Integer;
begin

  if RequestType = TRequestType.rtPost then
  begin

    try
      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      usuario := dados.GetValue<Integer>('usuario');
      empresa := dados.GetValue<Integer>('empresa');

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      sqlGeral.Active := false;
      sqlGeral.SQL.Text := 'DELETE FROM USUARIOS_EMPRESAS WHERE USUE_ID_USUARIO = ' + IntToStr(usuario) + ' AND USUE_ID_EMPRESA = ' + IntToStr(empresa);
      sqlGeral.ExecSQL;

      devolvido.AddPair('status', 'Empresa Desvinculada com Sucesso!');
      Result := devolvido.ToString;
      StatusCode := 200;

    finally
      dados.DisposeOf;
      devolvido.DisposeOf;
    end;
  end;

end;

procedure TTDados.DWEventsEventsEmpresasReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  empresa, dados, devolvido: TJSONObject;
  listaEmpresas: TJSONArray;
  i: Integer;
  cnpj: String;
begin

  GeraLog('EndPoint Acionado: Empresas');

  sqlEmpresas.Active := false;
  sqlEmpresas.Active := true;

  GeraLog('Dataset Atualizado');

  if RequestType = TRequestType.rtGet then
  begin

    GeraLog('Método Detectado: GET');

    cnpj := Params.ItemsString['0'].AsString;

    GeraLog('CNPJ Capturado: ' + cnpj);

    try

      if cnpj = 'empresas' then
      begin

        GeraLog('Método sem CNPJ');

        if sqlEmpresas.RecordCount > 0 then
        begin

          try
            listaEmpresas := TJSONArray.Create;

            for i := 0 to sqlEmpresas.RecordCount - 1 do
            begin

              empresa := TJSONObject.Create;

              empresa.AddPair('id', TJSONNumber.Create(sqlEmpresasempr_id.AsInteger));
              empresa.AddPair('nome', sqlEmpresasempr_nome.AsString);
              empresa.AddPair('razao', sqlEmpresasempr_razao.AsString);
              empresa.AddPair('cnpj', sqlEmpresasempr_cnpj.AsString);
              empresa.AddPair('questor_empresa', TJSONNumber.Create(sqlEmpresasempr_questor_empresa.AsInteger));
              empresa.AddPair('questor_estabelecimento', TJSONNumber.Create(sqlEmpresasempr_questor_estabelecimento.AsInteger));
              empresa.AddPair('data_cadastro', DateToStr(sqlEmpresasempr_data_cad.AsDateTime));
              empresa.AddPair('status', sqlEmpresasempr_status.AsString);

              listaEmpresas.Add(empresa);
              sqlEmpresas.Next;

            end;

            StatusCode := 200;
            Result := listaEmpresas.ToString;
          finally

            listaEmpresas.DisposeOf;
            sqlEmpresas.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;
      end;

      if cnpj <> 'empresas' then
      begin

        if Pos('@', cnpj) > 0 then
        begin

          GeraLog('Método com Email');

          sqlEmpresasPorEmail.Active := false;
          sqlEmpresasPorEmail.Params.ParamByName('EMAIL').AsString := cnpj;
          sqlEmpresasPorEmail.Active := true;

          if sqlEmpresasPorEmail.RecordCount > 0 then
          begin

            GeraLog('Encontrou o E-mail');

            try

              listaEmpresas := TJSONArray.Create;

              for i := 0 to sqlEmpresasPorEmail.RecordCount - 1 do
              begin

                empresa := TJSONObject.Create;

                empresa.AddPair('id', TJSONNumber.Create(sqlEmpresasPorEmailempr_id.AsInteger));
                empresa.AddPair('nome', sqlEmpresasPorEmailempr_nome.AsString);
                empresa.AddPair('razao', sqlEmpresasPorEmailempr_razao.AsString);
                empresa.AddPair('cnpj', sqlEmpresasPorEmailempr_cnpj.AsString);
                empresa.AddPair('questor_empresa', TJSONNumber.Create(sqlEmpresasPorEmailempr_questor_empresa.AsInteger));
                empresa.AddPair('questor_estabelecimento', TJSONNumber.Create(sqlEmpresasPorEmailempr_questor_estabelecimento.AsInteger));
                empresa.AddPair('data_cadastro', DateToStr(sqlEmpresasPorEmailempr_data_cad.AsDateTime));
                empresa.AddPair('status', sqlEmpresasPorEmailempr_status.AsString);
                empresa.AddPair('usuario', cnpj);

                listaEmpresas.Add(empresa);

                GeraLog('Adicionado Informação ao Array: ' + empresa.ToString);

                sqlEmpresasPorEmail.Next;
              end;

              StatusCode := 200;
              Result := listaEmpresas.ToString;
            finally

              GeraLog('Chegou na Limpeza de Memória');
              listaEmpresas.DisposeOf;
              sqlEmpresasPorEmail.Active := false;

            end;

          end
          else
          begin
            StatusCode := 403;
          end;

        end
        else
        begin

          GeraLog('Método com CNPJ');

          sqlEmpresaPorCNPJ.Active := false;
          sqlEmpresaPorCNPJ.Params.ParamByName('CNPJ').AsString := cnpj;
          sqlEmpresaPorCNPJ.Active := true;

          if sqlEmpresaPorCNPJ.RecordCount > 0 then
          begin

            try

              empresa := TJSONObject.Create;

              empresa.AddPair('id', TJSONNumber.Create(sqlEmpresaPorCNPJempr_id.AsInteger));
              empresa.AddPair('nome', sqlEmpresaPorCNPJempr_nome.AsString);
              empresa.AddPair('razao', sqlEmpresaPorCNPJempr_razao.AsString);
              empresa.AddPair('cnpj', sqlEmpresaPorCNPJempr_cnpj.AsString);
              empresa.AddPair('questor_empresa', TJSONNumber.Create(sqlEmpresaPorCNPJempr_questor_empresa.AsInteger));
              empresa.AddPair('questor_estabelecimento', TJSONNumber.Create(sqlEmpresaPorCNPJempr_questor_estabelecimento.AsInteger));
              empresa.AddPair('data_cadastro', DateToStr(sqlEmpresaPorCNPJempr_data_cad.AsDateTime));
              empresa.AddPair('status', sqlEmpresaPorCNPJempr_status.AsString);

              StatusCode := 200;
              Result := empresa.ToString;
            finally

              empresa.DisposeOf;
              sqlEmpresaPorCNPJ.Active := false;

            end;

          end
          else
          begin
            StatusCode := 204;
            Result := '[]';
          end;

        end;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPost then
  begin

    GeraLog('Método Detectado: POST');

    try

      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      if dados.Size > 0 then
      begin

        try

          sqlEmpresas.Append;
          sqlEmpresasempr_nome.AsString := dados.GetValue<String>('nome');
          sqlEmpresasempr_razao.AsString := dados.GetValue<String>('razao');
          sqlEmpresasempr_cnpj.AsString := dados.GetValue<String>('cnpj');
          sqlEmpresasempr_questor_empresa.AsString := dados.GetValue<String>('questor_empresa');
          sqlEmpresasempr_questor_estabelecimento.AsString := dados.GetValue<String>('questor_estabelecimento');
          sqlEmpresasempr_data_cad.AsDateTime := Now;
          sqlEmpresasempr_status.AsString := 'N';
          sqlEmpresas.Post;

          StatusCode := 201;
          devolvido.AddPair('status', 'Cadastro Realizado com Sucesso!');
          devolvido.AddPair('codigo', TJSONNumber.Create(sqlEmpresasempr_id.AsInteger));

          Result := devolvido.ToString;
        finally

          dados.DisposeOf;
          devolvido.DisposeOf;
          sqlEmpresas.Active := false;

        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Falha ao Criar Cadastro!');
        Result := devolvido.ToString;
      end;
    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPut then
  begin

    GeraLog('Método Detectado: PUT');

    try

      cnpj := Params.ItemsString['0'].AsString;

      GeraLog('CNPJ Capturado: ' + cnpj);

      if cnpj <> 'empresas' then
      begin

        GeraLog('Método com CNPJ');

        dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

        devolvido := TJSONObject.Create;

        sqlEmpresaPorCNPJ.Active := false;
        sqlEmpresaPorCNPJ.Params.ParamByName('CNPJ').AsString := cnpj;
        sqlEmpresaPorCNPJ.Active := true;

        GeraLog('Atualização de Cadastro, CNPJ: ' + cnpj);

        if sqlEmpresaPorCNPJ.RecordCount > 0 then
        begin

          try

            sqlEmpresaPorCNPJ.Edit;
            sqlEmpresaPorCNPJempr_nome.AsString := dados.GetValue<String>('nome');
            sqlEmpresaPorCNPJempr_razao.AsString := dados.GetValue<String>('razao');
            sqlEmpresaPorCNPJempr_cnpj.AsString := dados.GetValue<String>('cnpj');
            sqlEmpresaPorCNPJempr_questor_empresa.AsString := dados.GetValue<String>('questor_empresa');
            sqlEmpresaPorCNPJempr_questor_estabelecimento.AsString := dados.GetValue<String>('questor_estabelecimento');
            sqlEmpresaPorCNPJ.Post;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Atualizado com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlEmpresaPorCNPJ.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'CNPJ Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'CNPJ Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtDelete then
  begin

    GeraLog('Método Detectado: DELETE');

    try

      if cnpj <> 'empresas' then
      begin

        cnpj := Params.ItemsString['0'].AsString;

        GeraLog('CNPJ Capturado: ' + cnpj);

        GeraLog('Método com CNPJ');

        devolvido := TJSONObject.Create;

        sqlEmpresaPorCNPJ.Active := false;
        sqlEmpresaPorCNPJ.Params.ParamByName('CNPJ').AsString := cnpj;
        sqlEmpresaPorCNPJ.Active := true;

        GeraLog('Atualização de Cadastro, CNPJ: ' + cnpj);

        if sqlEmpresaPorCNPJ.RecordCount > 0 then
        begin

          try

            sqlEmpresaPorCNPJ.Delete;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Removido com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlEmpresaPorCNPJ.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'CNPJ Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'CNPJ Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

end;

procedure TTDados.DWEventsEventsFuncionariosReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  funcionario, dados, devolvido: TJSONObject;
  listafuncionarios: TJSONArray;
  i: Integer;
  codEmpresa: String;

begin

  GeraLog('EndPoint Acionado: Funcionarios');

  sqlFuncionarios.Active := false;
  sqlFuncionarios.Active := true;

  GeraLog('Dataset Atualizado');

  if RequestType = TRequestType.rtGet then
  begin

    GeraLog('Método Detectado: GET');

    codEmpresa := Params.ItemsString['0'].AsString;

    GeraLog('codEmpresa Capturado: ' + codEmpresa);

    try

      if codEmpresa <> 'funcionarios' then
      begin

        GeraLog('Método com codEmpresa');

        sqlFuncionarios.Active := false;
        sqlFuncionarios.Params.ParamByName('empresa').AsInteger := StrToInt(codEmpresa);
        sqlFuncionarios.Active := true;

        if sqlFuncionarios.RecordCount > 0 then
        begin

          try
            listafuncionarios := TJSONArray.Create;

            for i := 0 to sqlFuncionarios.RecordCount - 1 do
            begin

              funcionario := TJSONObject.Create;

              funcionario.AddPair('id', TJSONNumber.Create(sqlFuncionariosCODIGOFUNCCONTR.AsInteger));
              funcionario.AddPair('nome', sqlFuncionariosNOMEFUNC.AsString);
              funcionario.AddPair('nome_social', sqlFuncionariosNOMESOCIAL.AsString);
              funcionario.AddPair('empresa', sqlFuncionariosCODIGOEMPRESA.AsString);
              funcionario.AddPair('data_admissao', DateToStr(sqlFuncionariosDATAADM.AsDateTime));
              funcionario.AddPair('situacao', sqlFuncionariosDESCRSIT.AsString);

              listafuncionarios.Add(funcionario);
              sqlFuncionarios.Next;

            end;

            StatusCode := 200;
            Result := listafuncionarios.ToString;
          finally

            listafuncionarios.DisposeOf;
            sqlFuncionarios.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  // if RequestType = TRequestType.rtPost then
  // begin
  //
  // GeraLog('Método Detectado: POST');
  //
  // try
  //
  // dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;
  //
  // devolvido := TJSONObject.Create;
  //
  // GeraLog('Dados Recebidos: ' + dados.ToString);
  //
  // if dados.Size > 0 then
  // begin
  //
  // try
  //
  // sqlFuncionarios.Append;
  // sqlfuncionariosempr_nome.AsString := dados.GetValue<String>('nome');
  // sqlfuncionariosempr_razao.AsString := dados.GetValue<String>('razao');
  // sqlfuncionariosempr_codEmpresa.AsString := dados.GetValue<String>('codEmpresa');
  // sqlfuncionariosempr_questor_funcionario.AsString := dados.GetValue<String>('questor_funcionario');
  // sqlfuncionariosempr_questor_estabelecimento.AsString := dados.GetValue<String>('questor_estabelecimento');
  // sqlfuncionariosempr_data_cad.AsDateTime := Now;
  // sqlfuncionariosempr_status.AsString := 'N';
  // sqlFuncionarios.Post;
  //
  // StatusCode := 201;
  // devolvido.AddPair('status', 'Cadastro Realizado com Sucesso!');
  // devolvido.AddPair('codigo', TJSONNumber.Create(sqlfuncionariosempr_id.AsInteger));
  //
  // Result := devolvido.ToString;
  // finally
  //
  // dados.DisposeOf;
  // devolvido.DisposeOf;
  // sqlFuncionarios.Active := False;
  //
  // end;
  //
  // end
  // else
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', 'Falha ao Criar Cadastro!');
  // Result := devolvido.ToString;
  // end;
  // except
  //
  // On E: Exception do
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', E.Message);
  // Result := devolvido.ToString;
  // end;
  //
  // end;
  //
  // end;
  //
  // if RequestType = TRequestType.rtPut then
  // begin
  //
  // GeraLog('Método Detectado: PUT');
  //
  // try
  //
  // codEmpresa := Params.ItemsString['0'].AsString;
  //
  // GeraLog('codEmpresa Capturado: ' + codEmpresa);
  //
  // if codEmpresa <> 'funcionarios' then
  // begin
  //
  // GeraLog('Método com codEmpresa');
  //
  // dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;
  //
  // devolvido := TJSONObject.Create;
  //
  // sqlfuncionarioPorcodEmpresa.Active := False;
  // sqlfuncionarioPorcodEmpresa.Params.ParamByName('codEmpresa').AsString := codEmpresa;
  // sqlfuncionarioPorcodEmpresa.Active := True;
  //
  // GeraLog('Atualização de Cadastro, codEmpresa: ' + codEmpresa);
  //
  // if sqlfuncionarioPorcodEmpresa.RecordCount > 0 then
  // begin
  //
  // try
  //
  // sqlfuncionarioPorcodEmpresa.Edit;
  // sqlfuncionarioPorcodEmpresaempr_nome.AsString := dados.GetValue<String>('nome');
  // sqlfuncionarioPorcodEmpresaempr_razao.AsString := dados.GetValue<String>('razao');
  // sqlfuncionarioPorcodEmpresaempr_codEmpresa.AsString := dados.GetValue<String>('codEmpresa');
  // sqlfuncionarioPorcodEmpresaempr_questor_funcionario.AsString := dados.GetValue<String>('questor_funcionario');
  // sqlfuncionarioPorcodEmpresaempr_questor_estabelecimento.AsString := dados.GetValue<String>('questor_estabelecimento');
  // sqlfuncionarioPorcodEmpresa.Post;
  //
  // StatusCode := 200;
  // devolvido.AddPair('status', 'Cadastro Atualizado com Sucesso!');
  // Result := devolvido.ToString;
  //
  // finally
  //
  // sqlfuncionarioPorcodEmpresa.Active := False;
  //
  // end;
  //
  // end
  // else
  // begin
  // StatusCode := 204;
  // devolvido.AddPair('status', 'codEmpresa Não Encontrado na Base de Dados');
  // Result := devolvido.ToString;
  // end;
  //
  // end
  // else
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', 'codEmpresa Não Informado na Requisição');
  // Result := devolvido.ToString;
  // end;
  //
  // except
  //
  // On E: Exception do
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', E.Message);
  // Result := devolvido.ToString;
  // end;
  //
  // end;
  //
  // end;
  //
  // if RequestType = TRequestType.rtDelete then
  // begin
  //
  // GeraLog('Método Detectado: DELETE');
  //
  // try
  //
  // if codEmpresa <> 'funcionarios' then
  // begin
  //
  // codEmpresa := Params.ItemsString['0'].AsString;
  //
  // GeraLog('codEmpresa Capturado: ' + codEmpresa);
  //
  // GeraLog('Método com codEmpresa');
  //
  // devolvido := TJSONObject.Create;
  //
  // sqlfuncionarioPorcodEmpresa.Active := False;
  // sqlfuncionarioPorcodEmpresa.Params.ParamByName('codEmpresa').AsString := codEmpresa;
  // sqlfuncionarioPorcodEmpresa.Active := True;
  //
  // GeraLog('Atualização de Cadastro, codEmpresa: ' + codEmpresa);
  //
  // if sqlfuncionarioPorcodEmpresa.RecordCount > 0 then
  // begin
  //
  // try
  //
  // sqlfuncionarioPorcodEmpresa.Delete;
  //
  // StatusCode := 200;
  // devolvido.AddPair('status', 'Cadastro Removido com Sucesso!');
  // Result := devolvido.ToString;
  //
  // finally
  //
  // sqlfuncionarioPorcodEmpresa.Active := False;
  //
  // end;
  //
  // end
  // else
  // begin
  // StatusCode := 204;
  // devolvido.AddPair('status', 'codEmpresa Não Encontrado na Base de Dados');
  // Result := devolvido.ToString;
  // end;
  //
  // end
  // else
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', 'codEmpresa Não Informado na Requisição');
  // Result := devolvido.ToString;
  // end;
  //
  // except
  //
  // On E: Exception do
  // begin
  // StatusCode := 400;
  // devolvido.AddPair('status', E.Message);
  // Result := devolvido.ToString;
  // end;
  //
  // end;

  // end;
end;

procedure TTDados.DWEventsEventsGetDataHoraReplyEvent(var Params: TDWParams; var Result: string);
begin
  Result := DateToStr(Now);
end;

procedure TTDados.DWEventsEventsMvtoBancarioEnviarOfxReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  recebido, devolvido: TJSONObject;
  arquivo: string;
begin

  recebido := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;
  arquivo := recebido.GetValue<String>('arquivo');

  if arquivo <> '' then
  begin
    try
      StatusCode := 200;
      devolvido := TJSONObject.Create;
      devolvido.AddPair('status', 'arquivo recebido');
      devolvido.AddPair('cabecalho', ConverterBase64Cabecalho(arquivo));
      devolvido.AddPair('transacoes', ConverterBase64Transacoes(arquivo));
      Result := devolvido.ToString;
    finally
      recebido.DisposeOf;
    end;
  end
  else
  begin
    StatusCode := 401;
    Result := 'Arquivo não encontrado';
  end;
end;

procedure TTDados.DWEventsEventsObtemDadosUsuarioReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  emailRecebido: string;
  retorno: TJSONObject;
begin

  try

    emailRecebido := Params.ItemsString['email'].AsString;

    sqlObtemDadosUsuario.Active := false;
    sqlObtemDadosUsuario.Active := true;

    retorno := TJSONObject.Create;

    if sqlObtemDadosUsuario.Locate('email', emailRecebido, [loCaseInsensitive]) then
    begin

      retorno.AddPair('id', TJSONNumber.Create(sqlObtemDadosUsuarioid.AsInteger));
      retorno.AddPair('nome', sqlObtemDadosUsuarionome.AsString);
      retorno.AddPair('tipo', sqlObtemDadosUsuariotipo.AsString);
      retorno.AddPair('email', sqlObtemDadosUsuarioemail.AsString);
      retorno.AddPair('perm_empresas', TJSONBool.Create(sqlObtemDadosUsuarioperm_empresas.AsBoolean));
      retorno.AddPair('perm_usuarios', TJSONBool.Create(sqlObtemDadosUsuarioperm_usuarios.AsBoolean));
      retorno.AddPair('perm_operadores', TJSONBool.Create(sqlObtemDadosUsuarioperm_operadores.AsBoolean));

      StatusCode := 200;
      Result := retorno.ToString;

    end
    else
    begin
      StatusCode := 403;
    end;

  finally

    sqlObtemDadosUsuario.Active := false;
    retorno.DisposeOf;

  end;

end;

procedure TTDados.DWEventsEventsObtemEstatisticasSolicitacoesReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  email: String;
  pendentecliente, pendenteoperador, finalizados, total: Integer;
  devolvido: TJSONObject;
begin

  try

    email := UpperCase(Params.ItemsString['email'].AsString);

    sqlEstatisticasSolicitacoes.Active := false;
    sqlEstatisticasSolicitacoes.Params.ParamByName('email').AsString := email;
    sqlEstatisticasSolicitacoes.Active := true;

    pendentecliente := 0;
    pendenteoperador := 0;
    finalizados := 0;

    if sqlEstatisticasSolicitacoes.Locate('soli_status', 'PENDENTE OPERADOR', []) then
      pendenteoperador := sqlEstatisticasSolicitacoescount.AsInteger;

    if sqlEstatisticasSolicitacoes.Locate('soli_status', 'PENDENTE CLIENTE', []) then
      pendentecliente := sqlEstatisticasSolicitacoescount.AsInteger;

    if sqlEstatisticasSolicitacoes.Locate('soli_status', 'FINALIZADA', []) then
      finalizados := sqlEstatisticasSolicitacoescount.AsInteger;

    total := pendentecliente + pendenteoperador + finalizados;

    devolvido := TJSONObject.Create;

    devolvido.AddPair('PENDENTE_OPERADOR', TJSONNumber.Create(pendenteoperador));
    devolvido.AddPair('PENDENTE_CLIENTE', TJSONNumber.Create(pendentecliente));
    devolvido.AddPair('FINALIZADAS', TJSONNumber.Create(finalizados));
    devolvido.AddPair('TOTAL', TJSONNumber.Create(total));

    Result := devolvido.ToString;

  finally

    sqlEstatisticasSolicitacoes.Active := false;
    devolvido.DisposeOf;

  end;

end;

procedure TTDados.DWEventsEventsOperadoresReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  usuario, dados, devolvido: TJSONObject;
  listaUsuarios: TJSONArray;
  i: Integer;
  idEmpresa, idUsuario, emailUsuario: String;
begin
  GeraLog('EndPoint Acionado: Operadores');

  sqlOperadores.Active := false;
  sqlOperadores.Active := true;

  GeraLog('Dataset Atualizado');

  TrueBoolStrs := ['1'];
  FalseBoolStrs := ['0'];

  if RequestType = TRequestType.rtGet then
  begin

    GeraLog('Método Detectado: GET');

    idEmpresa := Params.ItemsString['0'].AsString;

    GeraLog('ID Empresa Capturado: ' + idEmpresa);

    try

      if idEmpresa = 'operadores' then
      begin

        GeraLog('Método sem ID');

        if sqlOperadores.RecordCount > 0 then
        begin

          try
            listaUsuarios := TJSONArray.Create;

            for i := 0 to sqlOperadores.RecordCount - 1 do
            begin

              usuario := TJSONObject.Create;

              usuario.AddPair('id', TJSONNumber.Create(sqlOperadoresoper_id.AsInteger));
              usuario.AddPair('nome', sqlOperadoresoper_nome.AsString);
              usuario.AddPair('cpf', sqlOperadoresoper_cpf.AsString);
              usuario.AddPair('email', sqlOperadoresoper_email.AsString);
              usuario.AddPair('funcao', sqlOperadoresoper_funcao.AsString);
              usuario.AddPair('data_cadastro', sqlOperadoresoper_data_cad.AsString);
              usuario.AddPair('status', sqlOperadoresoper_status.AsString);
              usuario.AddPair('perm_empresas', TJSONBool.Create(sqlOperadoresoper_perm_empresas.AsBoolean));
              usuario.AddPair('perm_usuarios', TJSONBool.Create(sqlOperadoresoper_perm_usuarios.AsBoolean));
              usuario.AddPair('perm_operadores', TJSONBool.Create(sqlOperadoresoper_perm_operadores.AsBoolean));

              listaUsuarios.Add(usuario);
              sqlOperadores.Next;

            end;

            StatusCode := 200;
            Result := listaUsuarios.ToString;
          finally

            listaUsuarios.DisposeOf;
            sqlOperadores.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;
      end;

      if idEmpresa <> 'operadores' then
      begin

        GeraLog('Método com ID');

        if Pos('@', idEmpresa) > 0 then
        begin

          GeraLog('Buscando por Email');

          sqlOperadoresPorEmail.Active := false;
          sqlOperadoresPorEmail.Params.ParamByName('EMAIL').AsString := idEmpresa;
          sqlOperadoresPorEmail.Active := true;

          if sqlOperadoresPorEmail.RecordCount > 0 then
          begin

            try

              usuario := TJSONObject.Create;

              usuario.AddPair('id', TJSONNumber.Create(sqlOperadoresPorEmailoper_id.AsInteger));
              usuario.AddPair('nome', sqlOperadoresPorEmailoper_nome.AsString);
              usuario.AddPair('cpf', sqlOperadoresPorEmailoper_cpf.AsString);
              usuario.AddPair('email', sqlOperadoresPorEmailoper_email.AsString);
              usuario.AddPair('data_cadastro', sqlOperadoresPorEmailoper_data_cad.AsString);
              usuario.AddPair('status', sqlOperadoresPorEmailoper_status.AsString);
              usuario.AddPair('perm_empresas', TJSONBool.Create(sqlOperadoresPorEmailoper_perm_empresas.AsBoolean));
              usuario.AddPair('perm_usuarios', TJSONBool.Create(sqlOperadoresPorEmailoper_perm_usuarios.AsBoolean));
              usuario.AddPair('perm_operadores', TJSONBool.Create(sqlOperadoresPorEmailoper_perm_operadores.AsBoolean));

              StatusCode := 200;
              Result := usuario.ToString;
            finally

              usuario.DisposeOf;
              sqlOperadoresPorEmail.Active := false;

            end;

          end
          else
          begin
            GeraLog('E-mail Não Localizado!');
            StatusCode := 204;
            devolvido := TJSONObject.Create;
            devolvido.AddPair('status', 'Dados Não Localizados');
            Result := devolvido.ToString;
          end;
        end;

      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPost then
  begin

    GeraLog('Método Detectado: POST');

    try

      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      if dados.Size > 0 then
      begin

        try

          sqlOperadores.Append;
          sqlOperadoresoper_nome.AsString := dados.GetValue<String>('nome');
          sqlOperadoresoper_cpf.AsString := dados.GetValue<String>('cpf');
          sqlOperadoresoper_email.AsString := dados.GetValue<String>('email');
          sqlOperadoresoper_funcao.AsString := dados.GetValue<String>('funcao');
          sqlOperadoresoper_perm_empresas.AsString := dados.GetValue<String>('perm_empresas');
          sqlOperadoresoper_perm_usuarios.AsString := dados.GetValue<String>('perm_usuarios');
          sqlOperadoresoper_perm_operadores.AsString := dados.GetValue<String>('perm_operadores');
          sqlOperadoresoper_data_cad.AsDateTime := Now;
          sqlOperadoresoper_status.AsString := 'N';

          sqlOperadores.Post;

          StatusCode := 201;
          devolvido.AddPair('status', 'Cadastro Realizado com Sucesso!');

          Result := devolvido.ToString;
        finally

          dados.DisposeOf;
          devolvido.DisposeOf;
          sqlOperadores.Active := false;

        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Falha ao Criar Cadastro!');
        Result := devolvido.ToString;
      end;
    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPut then
  begin

    GeraLog('Método Detectado: PUT');

    try

      idUsuario := Params.ItemsString['0'].AsString;

      GeraLog('ID Usuário Capturado: ' + idUsuario);

      if idUsuario <> 'operadores' then
      begin

        GeraLog('Método com ID Usuário');

        dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

        devolvido := TJSONObject.Create;

        sqlOperadoresPorID.Active := false;
        sqlOperadoresPorID.Params.ParamByName('USUARIO').AsInteger := StrToInt(idUsuario);
        sqlOperadoresPorID.Active := true;

        GeraLog('Edição de Cadastro, ID Usuário: ' + idUsuario);

        if sqlOperadoresPorID.RecordCount > 0 then
        begin

          try

            sqlOperadoresPorID.Edit;

            sqlOperadoresPorIDoper_nome.AsString := dados.GetValue<String>('nome');
            sqlOperadoresPorIDoper_cpf.AsString := dados.GetValue<String>('cpf');
            sqlOperadoresPorIDoper_email.AsString := dados.GetValue<String>('email');
            sqlOperadoresPorIDoper_funcao.AsString := dados.GetValue<String>('funcao');
            sqlOperadoresPorIDoper_perm_empresas.AsString := dados.GetValue<String>('perm_empresas');
            sqlOperadoresPorIDoper_perm_usuarios.AsString := dados.GetValue<String>('perm_usuarios');
            sqlOperadoresPorIDoper_perm_operadores.AsString := dados.GetValue<String>('perm_operadores');
            sqlOperadoresPorIDoper_data_cad.AsDateTime := Now;
            sqlOperadoresPorIDoper_status.AsString := 'N';

            sqlOperadoresPorID.Post;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Atualizado com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlOperadoresPorID.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'Usuário Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Usuário Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtDelete then
  begin

    GeraLog('Método Detectado: DELETE');

    try

      idUsuario := Params.ItemsString['0'].AsString;

      GeraLog('ID Usuário Capturado: ' + idUsuario);

      if idUsuario <> 'operadores' then
      begin

        GeraLog('Método com ID Usuário');

        devolvido := TJSONObject.Create;

        sqlOperadoresPorID.Active := false;
        sqlOperadoresPorID.Params.ParamByName('USUARIO').AsInteger := StrToInt(idUsuario);
        sqlOperadoresPorID.Active := true;

        GeraLog('Exclusão de Cadastro, ID Usuário: ' + idUsuario);
        GeraLog('Count: ' + IntToStr(sqlOperadoresPorID.RecordCount));

        if sqlOperadoresPorID.RecordCount > 0 then
        begin

          try

            sqlOperadoresPorID.Delete;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Removido com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlOperadoresPorID.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'Usuário Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Usuário Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;
end;

procedure TTDados.DWEventsEventsSolicitacoesReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  solicitacao, mensagem, dados, devolvido: TJSONObject;
  listaSolicitacoes, listaMensagens: TJSONArray;
  i: Integer;
  idSolicitacao: String;
begin

  GeraLog('EndPoint Acionado: Solicitacoes');

  sqlSolicitacoes.Active := false;
  sqlSolicitacoes.Active := true;

  GeraLog('Dataset Atualizado');

  if RequestType = TRequestType.rtGet then
  begin

    GeraLog('Método Detectado: GET');

    idSolicitacao := Params.ItemsString['0'].AsString;

    GeraLog('idSolicitacao Capturado: ' + idSolicitacao);

    try

      if idSolicitacao = 'solicitacoes' then
      begin

        GeraLog('Método sem idSolicitacao');

        if sqlSolicitacoes.RecordCount > 0 then
        begin

          try
            listaSolicitacoes := TJSONArray.Create;

            for i := 0 to sqlSolicitacoes.RecordCount - 1 do
            begin

              solicitacao := TJSONObject.Create;

              solicitacao.AddPair('id', TJSONNumber.Create(sqlSolicitacoessoli_id.AsInteger));
              solicitacao.AddPair('id_empresa', TJSONNumber.Create(sqlSolicitacoessoli_id_empresa.AsInteger));
              solicitacao.AddPair('id_usuario', TJSONNumber.Create(sqlSolicitacoessoli_id_usuario.AsInteger));
              solicitacao.AddPair('id_operador', TJSONNumber.Create(sqlSolicitacoessoli_id_operador.AsInteger));
              solicitacao.AddPair('id_categoria', TJSONNumber.Create(sqlSolicitacoessoli_id_categoria.AsInteger));
              solicitacao.AddPair('id_prioridade', TJSONNumber.Create(sqlSolicitacoessoli_id_prioridade.AsInteger));
              solicitacao.AddPair('data_cadastro', DateTimeToStr(sqlSolicitacoessoli_data_cad.AsDateTime));
              solicitacao.AddPair('data_finalizacao', DateTimeToStr(sqlSolicitacoessoli_data_fim.AsDateTime));
              solicitacao.AddPair('avaliacao', TJSONNumber.Create(sqlSolicitacoessoli_avaliacao.AsInteger));
              solicitacao.AddPair('assunto', sqlSolicitacoessoli_assunto.AsString);
              solicitacao.AddPair('conteudo', sqlSolicitacoessoli_conteudo.AsString);
              solicitacao.AddPair('status', sqlSolicitacoessoli_status.AsString);

              listaSolicitacoes.Add(solicitacao);
              sqlSolicitacoes.Next;

            end;

            StatusCode := 200;
            Result := listaSolicitacoes.ToString;
          finally

            listaSolicitacoes.DisposeOf;
            sqlSolicitacoes.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;
      end;

      if idSolicitacao <> 'solicitacoes' then
      begin

        GeraLog('Método com idSolicitacao');

        sqlSolicitacoesPorID.Active := false;
        sqlSolicitacoesPorID.Params.ParamByName('idSolicitacao').AsInteger := StrToInt(idSolicitacao);
        sqlSolicitacoesPorID.Active := true;

        listaMensagens := TJSONArray.Create;

        if sqlSolicitacoesPorID.RecordCount > 0 then
        begin

          try

            solicitacao := TJSONObject.Create;

            solicitacao.AddPair('id', TJSONNumber.Create(sqlSolicitacoessoli_id.AsInteger));
            solicitacao.AddPair('id_empresa', TJSONNumber.Create(sqlSolicitacoessoli_id_empresa.AsInteger));
            solicitacao.AddPair('id_usuario', TJSONNumber.Create(sqlSolicitacoessoli_id_usuario.AsInteger));
            solicitacao.AddPair('id_operador', TJSONNumber.Create(sqlSolicitacoessoli_id_operador.AsInteger));
            solicitacao.AddPair('id_categoria', TJSONNumber.Create(sqlSolicitacoessoli_id_categoria.AsInteger));
            solicitacao.AddPair('id_prioridade', TJSONNumber.Create(sqlSolicitacoessoli_id_prioridade.AsInteger));
            solicitacao.AddPair('data_cadastro', DateTimeToStr(sqlSolicitacoessoli_data_cad.AsDateTime));
            solicitacao.AddPair('data_finalizacao', DateTimeToStr(sqlSolicitacoessoli_data_fim.AsDateTime));
            solicitacao.AddPair('avaliacao', TJSONNumber.Create(sqlSolicitacoessoli_avaliacao.AsInteger));
            solicitacao.AddPair('assunto', sqlSolicitacoessoli_assunto.AsString);
            solicitacao.AddPair('conteudo', sqlSolicitacoessoli_conteudo.AsString);
            solicitacao.AddPair('status', sqlSolicitacoessoli_status.AsString);
            solicitacao.AddPair('operador', sqlSolicitacoesnome_operador.AsString);
            solicitacao.AddPair('usuario', sqlSolicitacoesnome_usuario.AsString);
            solicitacao.AddPair('funcao_operador', sqlSolicitacoesfuncao_operador.AsString);
            solicitacao.AddPair('funcao_usuario', sqlSolicitacoesfuncao_usuario.AsString);

            sqlSolicitacoesMensagens.Active := false;
            sqlSolicitacoesMensagens.Params.ParamByName('IDSOLICITACAO').AsInteger := StrToInt(idSolicitacao);
            sqlSolicitacoesMensagens.Active := true;

            if sqlSolicitacoesMensagens.RecordCount > 0 then
            begin

              for i := 0 to sqlSolicitacoesMensagens.RecordCount - 1 do
              begin

                mensagem := TJSONObject.Create;

                mensagem.AddPair('id_mensagem', TJSONNumber.Create(sqlSolicitacoesMensagensmens_id.AsInteger));
                mensagem.AddPair('id_solicitacao', TJSONNumber.Create(sqlSolicitacoesMensagensmens_id_solicitacao.AsInteger));
                mensagem.AddPair('id_usuario', TJSONNumber.Create(sqlSolicitacoesMensagensmens_id_usuario.AsInteger));
                mensagem.AddPair('id_operador', TJSONNumber.Create(sqlSolicitacoesMensagensmens_id_operador.AsInteger));
                mensagem.AddPair('data', DateTimeToStr(sqlSolicitacoesMensagensmens_data.AsDateTime));
                mensagem.AddPair('avaliacao', sqlSolicitacoesMensagensmens_avaliacao.AsString);
                mensagem.AddPair('conteudo', sqlSolicitacoesMensagensmens_conteudo.AsString);
                mensagem.AddPair('anexo', sqlSolicitacoesMensagensmens_anexo.AsString);
                mensagem.AddPair('status', sqlSolicitacoesMensagensmens_status.AsString);
                mensagem.AddPair('origem', sqlSolicitacoesMensagensmens_origem.AsString);
                mensagem.AddPair('operador', sqlSolicitacoesMensagensnome_operador.AsString);
                mensagem.AddPair('usuario', sqlSolicitacoesMensagensnome_usuario.AsString);
                mensagem.AddPair('funcao_operador', sqlSolicitacoesMensagensfuncao_operador.AsString);
                mensagem.AddPair('funcao_usuario', sqlSolicitacoesMensagensfuncao_usuario.AsString);

                listaMensagens.Add(mensagem);

                sqlSolicitacoesMensagens.Next;

              end;

            end;

            solicitacao.AddPair('mensagens', listaMensagens);

            StatusCode := 200;
            Result := solicitacao.ToString;

          finally

            solicitacao.DisposeOf;
            sqlSolicitacoesPorID.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;

      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPost then
  begin

    GeraLog('Método Detectado: POST');

    try

      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      if dados.Size > 0 then
      begin

        try

          if dados.GetValue<String>('tipo_requisicao') = 'SOLICITACAO' then
          begin

            sqlSolicitacoes.Append;
            sqlSolicitacoessoli_id_empresa.AsInteger := dados.GetValue<Integer>('id_empresa');
            sqlSolicitacoessoli_id_usuario.AsInteger := dados.GetValue<Integer>('id_usuario');
            sqlSolicitacoessoli_id_operador.AsInteger := dados.GetValue<Integer>('id_operador');
            sqlSolicitacoessoli_id_categoria.AsInteger := dados.GetValue<Integer>('id_categoria');
            sqlSolicitacoessoli_id_prioridade.AsInteger := dados.GetValue<Integer>('id_prioridade');
            sqlSolicitacoessoli_data_cad.AsDateTime := Now;
            sqlSolicitacoessoli_assunto.AsString := dados.GetValue<String>('assunto');
            sqlSolicitacoessoli_conteudo.AsString := dados.GetValue<String>('conteudo');
            sqlSolicitacoessoli_status.AsString := dados.GetValue<String>('status');
            sqlSolicitacoes.Post;

            StatusCode := 201;
            devolvido.AddPair('status', 'Solicitação Registrada com Sucesso!');

            Result := devolvido.ToString;

          end;

          if dados.GetValue<String>('tipo_requisicao') = 'MENSAGEM' then
          begin

            sqlSolicitacoesMensagens.Active := false;
            sqlSolicitacoesMensagens.Params.ParamByName('IDSOLICITACAO').AsInteger := dados.GetValue<Integer>('id_solicitacao');
            sqlSolicitacoesMensagens.Active := true;

            sqlSolicitacoesMensagens.Append;
            sqlSolicitacoesMensagensmens_id_solicitacao.AsInteger := dados.GetValue<Integer>('id_solicitacao');
            sqlSolicitacoesMensagensmens_id_usuario.AsInteger := dados.GetValue<Integer>('id_usuario');
            sqlSolicitacoesMensagensmens_id_operador.AsInteger := dados.GetValue<Integer>('id_operador');
            sqlSolicitacoesMensagensmens_data.AsDateTime := Now;
            sqlSolicitacoesMensagensmens_avaliacao.AsInteger := 0;
            sqlSolicitacoesMensagensmens_conteudo.AsString := dados.GetValue<String>('conteudo');
            sqlSolicitacoesMensagensmens_anexo.AsString := dados.GetValue<String>('anexo');
            sqlSolicitacoesMensagensmens_status.AsString := dados.GetValue<String>('status');
            sqlSolicitacoesMensagensmens_origem.AsString := dados.GetValue<String>('origem');
            sqlSolicitacoesMensagens.Post;

            StatusCode := 201;
            devolvido.AddPair('status', 'Mensagem Registrada com Sucesso!');

            Result := devolvido.ToString;

          end;

        finally

          dados.DisposeOf;
          devolvido.DisposeOf;
          sqlSolicitacoes.Active := false;
          sqlSolicitacoesMensagens.Active := false;

        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Falha ao Criar Solicitação!');
        Result := devolvido.ToString;
      end;
    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

end;

procedure TTDados.DWEventsEventsUsuariosReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  usuario, dados, devolvido: TJSONObject;
  listaUsuarios: TJSONArray;
  i: Integer;
  idEmpresa, idUsuario, emailUsuario: String;
begin

  GeraLog('EndPoint Acionado: Usuários');

  sqlUsuarios.Active := false;
  sqlUsuarios.Active := true;

  GeraLog('Dataset Atualizado');

  if RequestType = TRequestType.rtGet then
  begin

    GeraLog('Método Detectado: GET');

    idEmpresa := Params.ItemsString['0'].AsString;

    GeraLog('ID Empresa Capturado: ' + idEmpresa);

    try

      if idEmpresa = 'usuarios' then
      begin

        GeraLog('Método sem ID');

        if sqlUsuarios.RecordCount > 0 then
        begin

          try
            listaUsuarios := TJSONArray.Create;

            for i := 0 to sqlUsuarios.RecordCount - 1 do
            begin

              usuario := TJSONObject.Create;

              usuario.AddPair('id', TJSONNumber.Create(sqlUsuariosusua_id.AsInteger));
              usuario.AddPair('nome', sqlUsuariosusua_nome.AsString);
              usuario.AddPair('cpf', sqlUsuariosusua_cpf.AsString);
              usuario.AddPair('email', sqlUsuariosusua_email.AsString);
              usuario.AddPair('funcao', sqlUsuariosusua_funcao.AsString);
              usuario.AddPair('data_cadastro', sqlUsuariosusua_data_cad.AsString);
              usuario.AddPair('status', sqlUsuariosusua_status.AsString);

              listaUsuarios.Add(usuario);
              sqlUsuarios.Next;

            end;

            StatusCode := 200;
            Result := listaUsuarios.ToString;
          finally

            listaUsuarios.DisposeOf;
            sqlUsuarios.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          Result := '[]';
        end;
      end;

      if idEmpresa <> 'usuarios' then
      begin

        GeraLog('Método com ID');

        if Pos('@', idEmpresa) > 0 then
        begin

          GeraLog('Buscando por Email');

          sqlUsuariosPorEmail.Active := false;
          sqlUsuariosPorEmail.Params.ParamByName('EMAIL').AsString := idEmpresa;
          sqlUsuariosPorEmail.Active := true;

          if sqlUsuariosPorEmail.RecordCount > 0 then
          begin

            try

              usuario := TJSONObject.Create;

              usuario.AddPair('id', TJSONNumber.Create(sqlUsuariosPorEmailusua_id.AsInteger));
              usuario.AddPair('nome', sqlUsuariosPorEmailusua_nome.AsString);
              usuario.AddPair('cpf', sqlUsuariosPorEmailusua_cpf.AsString);
              usuario.AddPair('email', sqlUsuariosPorEmailusua_email.AsString);
              usuario.AddPair('data_cadastro', sqlUsuariosPorEmailusua_data_cad.AsString);
              usuario.AddPair('status', sqlUsuariosPorEmailusua_status.AsString);

              StatusCode := 200;
              Result := usuario.ToString;
            finally

              usuario.DisposeOf;
              sqlUsuariosPorEmail.Active := false;

            end;

          end
          else
          begin
            GeraLog('E-mail Não Localizado!');
            StatusCode := 204;
            devolvido := TJSONObject.Create;
            devolvido.AddPair('status', 'Dados Não Localizados');
            Result := devolvido.ToString;
          end;
        end

        else

        begin

          GeraLog('Buscando por ID');

          sqlUsuariosPorEmpresa.Active := false;
          sqlUsuariosPorEmpresa.Params.ParamByName('EMPRESA').AsInteger := StrToInt(idEmpresa);
          sqlUsuariosPorEmpresa.Active := true;

          if sqlUsuariosPorEmpresa.RecordCount > 0 then
          begin

            try
              listaUsuarios := TJSONArray.Create;

              for i := 0 to sqlUsuariosPorEmpresa.RecordCount - 1 do
              begin

                usuario := TJSONObject.Create;

                usuario.AddPair('id', TJSONNumber.Create(sqlUsuariosPorEmpresausua_id.AsInteger));
                usuario.AddPair('nome', sqlUsuariosPorEmpresausua_nome.AsString);
                usuario.AddPair('cpf', sqlUsuariosPorEmpresausua_cpf.AsString);
                usuario.AddPair('email', sqlUsuariosPorEmpresausua_email.AsString);
                usuario.AddPair('data_cadastro', sqlUsuariosPorEmpresausua_data_cad.AsString);
                usuario.AddPair('status', sqlUsuariosPorEmpresausua_status.AsString);

                listaUsuarios.Add(usuario);
                sqlUsuarios.Next;

              end;

              StatusCode := 200;
              Result := listaUsuarios.ToString;
            finally

              listaUsuarios.DisposeOf;
              sqlUsuarios.Active := false;

            end;

          end
          else
          begin
            StatusCode := 204;
            devolvido := TJSONObject.Create;
            devolvido.AddPair('status', 'Dados Não Localizados');
            Result := devolvido.ToString;
          end;
        end;

      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPost then
  begin

    GeraLog('Método Detectado: POST');

    try

      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      if dados.Size > 0 then
      begin

        try

          sqlUsuarios.Append;
          sqlUsuariosusua_nome.AsString := dados.GetValue<String>('nome');
          sqlUsuariosusua_cpf.AsString := dados.GetValue<String>('cpf');
          sqlUsuariosusua_email.AsString := dados.GetValue<String>('email');
          sqlUsuariosusua_funcao.AsString := dados.GetValue<String>('funcao');
          sqlUsuariosusua_data_cad.AsDateTime := Now;
          sqlUsuariosusua_status.AsString := 'N';

          sqlUsuarios.Post;

          StatusCode := 201;
          devolvido.AddPair('status', 'Cadastro Realizado com Sucesso!');

          Result := devolvido.ToString;
        finally

          dados.DisposeOf;
          devolvido.DisposeOf;
          sqlUsuarios.Active := false;

        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Falha ao Criar Cadastro!');
        Result := devolvido.ToString;
      end;
    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtPut then
  begin

    GeraLog('Método Detectado: PUT');

    try

      idUsuario := Params.ItemsString['0'].AsString;

      GeraLog('ID Usuário Capturado: ' + idUsuario);

      if idUsuario <> 'usuarios' then
      begin

        GeraLog('Método com ID Usuário');

        dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

        devolvido := TJSONObject.Create;

        sqlUsuariosPorID.Active := false;
        sqlUsuariosPorID.Params.ParamByName('USUARIO').AsInteger := StrToInt(idUsuario);
        sqlUsuariosPorID.Active := true;

        GeraLog('Edição de Cadastro, ID Usuário: ' + idUsuario);

        if sqlUsuariosPorID.RecordCount > 0 then
        begin

          try

            sqlUsuariosPorID.Edit;

            sqlUsuariosPorIDusua_nome.AsString := dados.GetValue<String>('nome');
            sqlUsuariosPorIDusua_cpf.AsString := dados.GetValue<String>('cpf');
            sqlUsuariosPorIDusua_email.AsString := dados.GetValue<String>('email');
            sqlUsuariosPorIDusua_funcao.AsString := dados.GetValue<String>('funcao');
            sqlUsuariosPorIDusua_data_cad.AsDateTime := Now;
            sqlUsuariosPorIDusua_status.AsString := 'N';

            sqlUsuariosPorID.Post;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Atualizado com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlUsuariosPorID.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'Usuário Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Usuário Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;

  if RequestType = TRequestType.rtDelete then
  begin

    GeraLog('Método Detectado: DELETE');

    try

      idUsuario := Params.ItemsString['0'].AsString;

      GeraLog('ID Usuário Capturado: ' + idUsuario);

      if idUsuario <> 'usuarios' then
      begin

        GeraLog('Método com ID Usuário');

        devolvido := TJSONObject.Create;

        sqlUsuariosPorID.Active := false;
        sqlUsuariosPorID.Params.ParamByName('USUARIO').AsInteger := StrToInt(idUsuario);
        sqlUsuariosPorID.Active := true;

        GeraLog('Exclusão de Cadastro, ID Usuário: ' + idUsuario);
        GeraLog('Count: ' + IntToStr(sqlUsuariosPorID.RecordCount));

        if sqlUsuariosPorID.RecordCount > 0 then
        begin

          try

            sqlUsuariosPorID.Delete;

            StatusCode := 200;
            devolvido.AddPair('status', 'Cadastro Removido com Sucesso!');
            Result := devolvido.ToString;

          finally

            sqlUsuariosPorID.Active := false;

          end;

        end
        else
        begin
          StatusCode := 204;
          devolvido.AddPair('status', 'Usuário Não Encontrado na Base de Dados');
          Result := devolvido.ToString;
        end;

      end
      else
      begin
        StatusCode := 400;
        devolvido.AddPair('status', 'Usuário Não Informado na Requisição');
        Result := devolvido.ToString;
      end;

    except

      On E: Exception do
      begin
        StatusCode := 400;
        devolvido.AddPair('status', E.Message);
        Result := devolvido.ToString;
      end;

    end;

  end;
end;

procedure TTDados.DWEventsEventsVincularUsuarioEmpresaReplyEventByType(var Params: TDWParams; var Result: string; const RequestType: TRequestType; var StatusCode: Integer; RequestHeader: TStringList);
var
  dados, devolvido: TJSONObject;
  usuario, empresa: Integer;
begin

  if RequestType = TRequestType.rtPost then
  begin

    try
      dados := TJSONObject.ParseJSONValue(Params.ItemsString['UNDEFINED'].AsString) as TJSONObject;

      usuario := dados.GetValue<Integer>('usuario');
      empresa := dados.GetValue<Integer>('empresa');

      devolvido := TJSONObject.Create;

      GeraLog('Dados Recebidos: ' + dados.ToString);

      sqlGeral.Active := false;
      sqlGeral.SQL.Text := 'select empr_id from empresas where empr_questor_empresa = ' + IntToStr(empresa);
      sqlGeral.Active := true;

      if sqlGeral.RecordCount > 0 then
      begin

        sqlVincularEmpresaUsuario.Active := false;
        sqlVincularEmpresaUsuario.SQL.Text := 'select * from usuarios_empresas where usue_id_usuario = ' + IntToStr(usuario) + ' and usue_id_empresa = ' + IntToStr(empresa);
        sqlVincularEmpresaUsuario.Active := true;

        if sqlVincularEmpresaUsuario.RecordCount > 0 then
        begin
          devolvido.AddPair('status', 'Empresa Já Está Vinculada ao Usuário');
          Result := devolvido.ToString;
          StatusCode := 409;
        end
        else
        begin
          sqlVincularEmpresaUsuario.Append;
          sqlVincularEmpresaUsuariousue_id_usuario.AsInteger := usuario;
          sqlVincularEmpresaUsuariousue_id_empresa.AsInteger := sqlGeral.FieldByName('empr_id').AsInteger;
          sqlVincularEmpresaUsuario.Post;
          devolvido.AddPair('status', 'Empresa Vinculada com Sucesso!');
          Result := devolvido.ToString;
          StatusCode := 200;
        end;
      end
      else
      begin
        devolvido.AddPair('status', 'Código Empresa Questor Não Encontrado!');
        Result := devolvido.ToString;
        StatusCode := 409;
      end;

    finally
      dados.DisposeOf;
      devolvido.DisposeOf;
    end;
  end;

end;

end.
