object TDados: TTDados
  OldCreateOrder = False
  OnCreate = ServerMethodDataModuleCreate
  Encoding = esUtf8
  QueuedRequest = False
  Height = 680
  Width = 1106
  object DWEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crPost]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'MvtoBancarioEnviarOfx'
        EventName = 'MvtoBancarioEnviarOfx'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsMvtoBancarioEnviarOfxReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'cnpj'
            Encoded = True
          end>
        JsonMode = jmPureJSON
        Name = 'Empresas'
        EventName = 'Empresas'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsEmpresasReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'Usuarios'
        EventName = 'Usuarios'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsUsuariosReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'Funcionarios'
        EventName = 'Funcionarios'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsFuncionariosReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'Solicitacoes'
        EventName = 'Solicitacoes'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsSolicitacoesReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'VincularUsuarioEmpresa'
        EventName = 'VincularUsuarioEmpresa'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsVincularUsuarioEmpresaReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'DesvincularUsuarioEmpresa'
        EventName = 'DesvincularUsuarioEmpresa'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsDesvincularUsuarioEmpresaReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'Operadores'
        EventName = 'Operadores'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsOperadoresReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'ObtemDadosUsuario'
        EventName = 'ObtemDadosUsuario'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsObtemDadosUsuarioReplyEventByType
      end
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <>
        JsonMode = jmPureJSON
        Name = 'ObtemEstatisticasSolicitacoes'
        EventName = 'ObtemEstatisticasSolicitacoes'
        OnlyPreDefinedParams = False
        OnReplyEventByType = DWEventsEventsObtemEstatisticasSolicitacoesReplyEventByType
      end>
    ContextName = 'api'
    Left = 24
    Top = 608
  end
  object conexaoPG: TFDConnection
    Params.Strings = (
      'Database=connect'
      'User_Name=postgres'
      'Password=Brxa@161214'
      'Server=127.0.0.1'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 608
  end
  object linkPG: TFDPhysPgDriverLink
    VendorLib = 'C:\Connect\libpq.dll'
    Left = 96
    Top = 608
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 240
    Top = 608
  end
  object sqlEmpresas: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EMPRESAS')
    Left = 40
    Top = 56
    object sqlEmpresasempr_id: TLargeintField
      FieldName = 'empr_id'
      Origin = 'empr_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlEmpresasempr_nome: TStringField
      FieldName = 'empr_nome'
      Origin = 'empr_nome'
      Size = 120
    end
    object sqlEmpresasempr_razao: TStringField
      FieldName = 'empr_razao'
      Origin = 'empr_razao'
      Size = 120
    end
    object sqlEmpresasempr_cnpj: TStringField
      FieldName = 'empr_cnpj'
      Origin = 'empr_cnpj'
      Size = 120
    end
    object sqlEmpresasempr_data_cad: TSQLTimeStampField
      FieldName = 'empr_data_cad'
      Origin = 'empr_data_cad'
    end
    object sqlEmpresasempr_status: TStringField
      FieldName = 'empr_status'
      Origin = 'empr_status'
      Size = 30
    end
    object sqlEmpresasempr_questor_empresa: TIntegerField
      FieldName = 'empr_questor_empresa'
      Origin = 'empr_questor_empresa'
    end
    object sqlEmpresasempr_questor_estabelecimento: TIntegerField
      FieldName = 'empr_questor_estabelecimento'
      Origin = 'empr_questor_estabelecimento'
    end
  end
  object sqlEmpresaPorCNPJ: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EMPRESAS'
      'WHERE EMPR_CNPJ = :CNPJ')
    Left = 40
    Top = 112
    ParamData = <
      item
        Name = 'CNPJ'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlEmpresaPorCNPJempr_id: TLargeintField
      FieldName = 'empr_id'
      Origin = 'empr_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlEmpresaPorCNPJempr_nome: TStringField
      FieldName = 'empr_nome'
      Origin = 'empr_nome'
      Size = 120
    end
    object sqlEmpresaPorCNPJempr_razao: TStringField
      FieldName = 'empr_razao'
      Origin = 'empr_razao'
      Size = 120
    end
    object sqlEmpresaPorCNPJempr_cnpj: TStringField
      FieldName = 'empr_cnpj'
      Origin = 'empr_cnpj'
      Size = 120
    end
    object sqlEmpresaPorCNPJempr_data_cad: TSQLTimeStampField
      FieldName = 'empr_data_cad'
      Origin = 'empr_data_cad'
    end
    object sqlEmpresaPorCNPJempr_status: TStringField
      FieldName = 'empr_status'
      Origin = 'empr_status'
      Size = 30
    end
    object sqlEmpresaPorCNPJempr_questor_empresa: TIntegerField
      FieldName = 'empr_questor_empresa'
      Origin = 'empr_questor_empresa'
    end
    object sqlEmpresaPorCNPJempr_questor_estabelecimento: TIntegerField
      FieldName = 'empr_questor_estabelecimento'
      Origin = 'empr_questor_estabelecimento'
    end
  end
  object sqlUsuarios: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM USUARIOS')
    Left = 176
    Top = 64
    object sqlUsuariosusua_id: TLargeintField
      FieldName = 'usua_id'
      Origin = 'usua_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuariosusua_nome: TStringField
      FieldName = 'usua_nome'
      Origin = 'usua_nome'
      Size = 120
    end
    object sqlUsuariosusua_cpf: TStringField
      FieldName = 'usua_cpf'
      Origin = 'usua_cpf'
      Size = 120
    end
    object sqlUsuariosusua_email: TStringField
      FieldName = 'usua_email'
      Origin = 'usua_email'
      Size = 120
    end
    object sqlUsuariosusua_senha: TStringField
      FieldName = 'usua_senha'
      Origin = 'usua_senha'
      Size = 120
    end
    object sqlUsuariosusua_data_cad: TSQLTimeStampField
      FieldName = 'usua_data_cad'
      Origin = 'usua_data_cad'
    end
    object sqlUsuariosusua_status: TStringField
      FieldName = 'usua_status'
      Origin = 'usua_status'
      Size = 30
    end
    object sqlUsuariosusua_funcao: TStringField
      FieldName = 'usua_funcao'
      Origin = 'usua_funcao'
      Size = 30
    end
  end
  object sqlUsuariosPorEmpresa: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM USUARIOS'
      
        'WHERE USUA_ID IN (SELECT USUE_ID_USUARIO FROM USUARIOS_EMPRESAS ' +
        'WHERE USUE_ID_EMPRESA = :EMPRESA)')
    Left = 176
    Top = 120
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlUsuariosPorEmpresausua_id: TLargeintField
      FieldName = 'usua_id'
      Origin = 'usua_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuariosPorEmpresausua_nome: TStringField
      FieldName = 'usua_nome'
      Origin = 'usua_nome'
      Size = 120
    end
    object sqlUsuariosPorEmpresausua_cpf: TStringField
      FieldName = 'usua_cpf'
      Origin = 'usua_cpf'
      Size = 120
    end
    object sqlUsuariosPorEmpresausua_email: TStringField
      FieldName = 'usua_email'
      Origin = 'usua_email'
      Size = 120
    end
    object sqlUsuariosPorEmpresausua_senha: TStringField
      FieldName = 'usua_senha'
      Origin = 'usua_senha'
      Size = 120
    end
    object sqlUsuariosPorEmpresausua_data_cad: TSQLTimeStampField
      FieldName = 'usua_data_cad'
      Origin = 'usua_data_cad'
    end
    object sqlUsuariosPorEmpresausua_status: TStringField
      FieldName = 'usua_status'
      Origin = 'usua_status'
      Size = 30
    end
    object sqlUsuariosPorEmpresausua_funcao: TStringField
      FieldName = 'usua_funcao'
      Origin = 'usua_funcao'
      Size = 30
    end
  end
  object sqlUsuariosPorID: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM USUARIOS'
      'WHERE USUA_ID = :USUARIO')
    Left = 176
    Top = 176
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlUsuariosPorIDusua_id: TLargeintField
      FieldName = 'usua_id'
      Origin = 'usua_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuariosPorIDusua_nome: TStringField
      FieldName = 'usua_nome'
      Origin = 'usua_nome'
      Size = 120
    end
    object sqlUsuariosPorIDusua_cpf: TStringField
      FieldName = 'usua_cpf'
      Origin = 'usua_cpf'
      Size = 120
    end
    object sqlUsuariosPorIDusua_email: TStringField
      FieldName = 'usua_email'
      Origin = 'usua_email'
      Size = 120
    end
    object sqlUsuariosPorIDusua_senha: TStringField
      FieldName = 'usua_senha'
      Origin = 'usua_senha'
      Size = 120
    end
    object sqlUsuariosPorIDusua_data_cad: TSQLTimeStampField
      FieldName = 'usua_data_cad'
      Origin = 'usua_data_cad'
    end
    object sqlUsuariosPorIDusua_status: TStringField
      FieldName = 'usua_status'
      Origin = 'usua_status'
      Size = 30
    end
    object sqlUsuariosPorIDusua_funcao: TStringField
      FieldName = 'usua_funcao'
      Origin = 'usua_funcao'
      Size = 30
    end
  end
  object sqlUsuariosPorEmail: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM USUARIOS'
      'WHERE USUA_EMAIL = :EMAIL')
    Left = 176
    Top = 232
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlUsuariosPorEmailusua_id: TLargeintField
      FieldName = 'usua_id'
      Origin = 'usua_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlUsuariosPorEmailusua_nome: TStringField
      FieldName = 'usua_nome'
      Origin = 'usua_nome'
      Size = 120
    end
    object sqlUsuariosPorEmailusua_cpf: TStringField
      FieldName = 'usua_cpf'
      Origin = 'usua_cpf'
      Size = 120
    end
    object sqlUsuariosPorEmailusua_email: TStringField
      FieldName = 'usua_email'
      Origin = 'usua_email'
      Size = 120
    end
    object sqlUsuariosPorEmailusua_senha: TStringField
      FieldName = 'usua_senha'
      Origin = 'usua_senha'
      Size = 120
    end
    object sqlUsuariosPorEmailusua_data_cad: TSQLTimeStampField
      FieldName = 'usua_data_cad'
      Origin = 'usua_data_cad'
    end
    object sqlUsuariosPorEmailusua_status: TStringField
      FieldName = 'usua_status'
      Origin = 'usua_status'
      Size = 30
    end
    object sqlUsuariosPorEmailusua_funcao: TStringField
      FieldName = 'usua_funcao'
      Origin = 'usua_funcao'
      Size = 30
    end
  end
  object sqlEmpresasPorEmail: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM EMPRESAS'
      'WHERE EMPR_ID IN ('
      
        'SELECT USUE_ID_EMPRESA FROM USUARIOS_EMPRESAS WHERE USUE_ID_USUA' +
        'RIO = (SELECT USUA_ID FROM USUARIOS WHERE USUA_EMAIL = :EMAIL))'
      'AND EMPR_STATUS = '#39'N'#39';')
    Left = 40
    Top = 168
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlEmpresasPorEmailempr_id: TLargeintField
      FieldName = 'empr_id'
      Origin = 'empr_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlEmpresasPorEmailempr_nome: TStringField
      FieldName = 'empr_nome'
      Origin = 'empr_nome'
      Size = 120
    end
    object sqlEmpresasPorEmailempr_razao: TStringField
      FieldName = 'empr_razao'
      Origin = 'empr_razao'
      Size = 120
    end
    object sqlEmpresasPorEmailempr_cnpj: TStringField
      FieldName = 'empr_cnpj'
      Origin = 'empr_cnpj'
      Size = 120
    end
    object sqlEmpresasPorEmailempr_questor_empresa: TIntegerField
      FieldName = 'empr_questor_empresa'
      Origin = 'empr_questor_empresa'
    end
    object sqlEmpresasPorEmailempr_questor_estabelecimento: TIntegerField
      FieldName = 'empr_questor_estabelecimento'
      Origin = 'empr_questor_estabelecimento'
    end
    object sqlEmpresasPorEmailempr_data_cad: TSQLTimeStampField
      FieldName = 'empr_data_cad'
      Origin = 'empr_data_cad'
    end
    object sqlEmpresasPorEmailempr_status: TStringField
      FieldName = 'empr_status'
      Origin = 'empr_status'
      Size = 1
    end
  end
  object conexaoQuestor: TFDConnection
    Params.Strings = (
      'Database=C:\Questor\Questor-original-06-07-2022-01-12-46.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    Connected = True
    LoginPrompt = False
    Left = 336
    Top = 608
  end
  object sqlFuncionarios: TFDQuery
    Connection = conexaoQuestor
    SQL.Strings = (
      'SELECT'
      'CODIGOFUNCCONTR,'
      'CODIGOEMPRESA,'
      'DATAADM,'
      'NOMEFUNC,'
      'NOMESOCIAL,'
      'DESCRSIT'
      'FROM'
      'FUNCCONTRATO'
      'LEFT JOIN SITUACAO ON SITUACAO.CODIGOSIT=FUNCCONTRATO.CODIGOSIT'
      
        'LEFT JOIN FUNCPESSOA ON FUNCPESSOA.codigofuncpessoa=FUNCCONTRATO' +
        '.codigofuncpessoa'
      'WHERE 1=1'
      'AND CODIGOEMPRESA = :EMPRESA'
      'AND DATADEM IS NULL'
      'ORDER BY NOMEFUNC')
    Left = 696
    Top = 88
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlFuncionariosCODIGOFUNCCONTR: TIntegerField
      FieldName = 'CODIGOFUNCCONTR'
      Origin = 'CODIGOFUNCCONTR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFuncionariosCODIGOEMPRESA: TSmallintField
      FieldName = 'CODIGOEMPRESA'
      Origin = 'CODIGOEMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlFuncionariosDATAADM: TDateField
      FieldName = 'DATAADM'
      Origin = 'DATAADM'
      Required = True
    end
    object sqlFuncionariosNOMEFUNC: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEFUNC'
      Origin = 'NOMEFUNC'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object sqlFuncionariosNOMESOCIAL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMESOCIAL'
      Origin = 'NOMESOCIAL'
      ProviderFlags = []
      ReadOnly = True
      Size = 70
    end
    object sqlFuncionariosDESCRSIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRSIT'
      Origin = 'DESCRSIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object sqlSolicitacoes: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      'SOLI_ID AS SOLI_ID,'
      'SOLI_ID_EMPRESA AS SOLI_ID_EMPRESA,'
      'SOLI_ID_USUARIO AS SOLI_ID_USUARIO,'
      'SOLI_ID_OPERADOR AS SOLI_ID_OPERADOR,'
      'SOLI_ID_CATEGORIA AS SOLI_ID_CATEGORIA,'
      'SOLI_ID_PRIORIDADE AS SOLI_ID_PRIORIDADE,'
      'SOLI_DATA_CAD AS SOLI_DATA_CAD,'
      'SOLI_DATA_FIM AS SOLI_DATA_FIM,'
      'SOLI_AVALIACAO AS SOLI_AVALIACAO,'
      'SOLI_ASSUNTO AS SOLI_ASSUNTO,'
      'SOLI_CONTEUDO AS SOLI_CONTEUDO,'
      'SOLI_STATUS AS SOLI_STATUS,'
      'OPERADORES.USUA_NOME AS NOME_OPERADOR,'
      'USUARIOS.USUA_NOME AS NOME_USUARIO,'
      'OPERADORES.USUA_FUNCAO AS FUNCAO_OPERADOR,'
      'USUARIOS.USUA_FUNCAO AS FUNCAO_USUARIO'
      'FROM SOLICITACOES'
      
        'LEFT JOIN USUARIOS OPERADORES ON (OPERADORES.USUA_ID=SOLI_ID_OPE' +
        'RADOR)'
      
        'LEFT JOIN USUARIOS USUARIOS ON (USUARIOS.USUA_ID=SOLI_ID_USUARIO' +
        ')')
    Left = 464
    Top = 72
    object sqlSolicitacoessoli_id: TLargeintField
      FieldName = 'soli_id'
      Origin = 'soli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlSolicitacoessoli_id_empresa: TIntegerField
      FieldName = 'soli_id_empresa'
      Origin = 'soli_id_empresa'
    end
    object sqlSolicitacoessoli_id_usuario: TIntegerField
      FieldName = 'soli_id_usuario'
      Origin = 'soli_id_usuario'
    end
    object sqlSolicitacoessoli_id_operador: TIntegerField
      FieldName = 'soli_id_operador'
      Origin = 'soli_id_operador'
    end
    object sqlSolicitacoessoli_id_categoria: TIntegerField
      FieldName = 'soli_id_categoria'
      Origin = 'soli_id_categoria'
    end
    object sqlSolicitacoessoli_id_prioridade: TIntegerField
      FieldName = 'soli_id_prioridade'
      Origin = 'soli_id_prioridade'
    end
    object sqlSolicitacoessoli_data_cad: TSQLTimeStampField
      FieldName = 'soli_data_cad'
      Origin = 'soli_data_cad'
    end
    object sqlSolicitacoessoli_data_fim: TSQLTimeStampField
      FieldName = 'soli_data_fim'
      Origin = 'soli_data_fim'
    end
    object sqlSolicitacoessoli_avaliacao: TIntegerField
      FieldName = 'soli_avaliacao'
      Origin = 'soli_avaliacao'
    end
    object sqlSolicitacoessoli_assunto: TStringField
      FieldName = 'soli_assunto'
      Origin = 'soli_assunto'
      Size = 120
    end
    object sqlSolicitacoessoli_conteudo: TMemoField
      FieldName = 'soli_conteudo'
      Origin = 'soli_conteudo'
      BlobType = ftMemo
    end
    object sqlSolicitacoessoli_status: TStringField
      FieldName = 'soli_status'
      Origin = 'soli_status'
      Size = 30
    end
    object sqlSolicitacoesnome_operador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_operador'
      Origin = 'nome_operador'
      Size = 120
    end
    object sqlSolicitacoesnome_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_usuario'
      Origin = 'nome_usuario'
      Size = 120
    end
    object sqlSolicitacoesfuncao_operador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'funcao_operador'
      Origin = 'funcao_operador'
      Size = 30
    end
    object sqlSolicitacoesfuncao_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'funcao_usuario'
      Origin = 'funcao_usuario'
      Size = 30
    end
  end
  object sqlSolicitacoesPorEmpresa: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM SOLICITACOES'
      'WHERE SOLI_ID_EMPRESA = :IDEMPRESA')
    Left = 464
    Top = 168
    ParamData = <
      item
        Name = 'IDEMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlSolicitacoesPorEmpresasoli_id: TLargeintField
      FieldName = 'soli_id'
      Origin = 'soli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlSolicitacoesPorEmpresasoli_id_empresa: TIntegerField
      FieldName = 'soli_id_empresa'
      Origin = 'soli_id_empresa'
    end
    object sqlSolicitacoesPorEmpresasoli_id_usuario: TIntegerField
      FieldName = 'soli_id_usuario'
      Origin = 'soli_id_usuario'
    end
    object sqlSolicitacoesPorEmpresasoli_id_operador: TIntegerField
      FieldName = 'soli_id_operador'
      Origin = 'soli_id_operador'
    end
    object sqlSolicitacoesPorEmpresasoli_id_categoria: TIntegerField
      FieldName = 'soli_id_categoria'
      Origin = 'soli_id_categoria'
    end
    object sqlSolicitacoesPorEmpresasoli_id_prioridade: TIntegerField
      FieldName = 'soli_id_prioridade'
      Origin = 'soli_id_prioridade'
    end
    object sqlSolicitacoesPorEmpresasoli_data_cad: TSQLTimeStampField
      FieldName = 'soli_data_cad'
      Origin = 'soli_data_cad'
    end
    object sqlSolicitacoesPorEmpresasoli_data_fim: TSQLTimeStampField
      FieldName = 'soli_data_fim'
      Origin = 'soli_data_fim'
    end
    object sqlSolicitacoesPorEmpresasoli_avaliacao: TIntegerField
      FieldName = 'soli_avaliacao'
      Origin = 'soli_avaliacao'
    end
    object sqlSolicitacoesPorEmpresasoli_assunto: TStringField
      FieldName = 'soli_assunto'
      Origin = 'soli_assunto'
      Size = 120
    end
    object sqlSolicitacoesPorEmpresasoli_conteudo: TMemoField
      FieldName = 'soli_conteudo'
      Origin = 'soli_conteudo'
      BlobType = ftMemo
    end
    object sqlSolicitacoesPorEmpresasoli_status: TStringField
      FieldName = 'soli_status'
      Origin = 'soli_status'
      Size = 30
    end
  end
  object sqlSolicitacoesPorOperador: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM SOLICITACOES'
      'WHERE SOLI_ID_OPERADOR = :IDOPERADOR')
    Left = 464
    Top = 224
    ParamData = <
      item
        Name = 'IDOPERADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlSolicitacoesPorOperadorsoli_id: TLargeintField
      FieldName = 'soli_id'
      Origin = 'soli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlSolicitacoesPorOperadorsoli_id_empresa: TIntegerField
      FieldName = 'soli_id_empresa'
      Origin = 'soli_id_empresa'
    end
    object sqlSolicitacoesPorOperadorsoli_id_usuario: TIntegerField
      FieldName = 'soli_id_usuario'
      Origin = 'soli_id_usuario'
    end
    object sqlSolicitacoesPorOperadorsoli_id_operador: TIntegerField
      FieldName = 'soli_id_operador'
      Origin = 'soli_id_operador'
    end
    object sqlSolicitacoesPorOperadorsoli_id_categoria: TIntegerField
      FieldName = 'soli_id_categoria'
      Origin = 'soli_id_categoria'
    end
    object sqlSolicitacoesPorOperadorsoli_id_prioridade: TIntegerField
      FieldName = 'soli_id_prioridade'
      Origin = 'soli_id_prioridade'
    end
    object sqlSolicitacoesPorOperadorsoli_data_cad: TSQLTimeStampField
      FieldName = 'soli_data_cad'
      Origin = 'soli_data_cad'
    end
    object sqlSolicitacoesPorOperadorsoli_data_fim: TSQLTimeStampField
      FieldName = 'soli_data_fim'
      Origin = 'soli_data_fim'
    end
    object sqlSolicitacoesPorOperadorsoli_avaliacao: TIntegerField
      FieldName = 'soli_avaliacao'
      Origin = 'soli_avaliacao'
    end
    object sqlSolicitacoesPorOperadorsoli_assunto: TStringField
      FieldName = 'soli_assunto'
      Origin = 'soli_assunto'
      Size = 120
    end
    object sqlSolicitacoesPorOperadorsoli_conteudo: TMemoField
      FieldName = 'soli_conteudo'
      Origin = 'soli_conteudo'
      BlobType = ftMemo
    end
    object sqlSolicitacoesPorOperadorsoli_status: TStringField
      FieldName = 'soli_status'
      Origin = 'soli_status'
      Size = 30
    end
  end
  object sqlSolicitacoesPorID: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM SOLICITACOES'
      'WHERE SOLI_ID = :IDSOLICITACAO')
    Left = 464
    Top = 120
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlSolicitacoesPorIDsoli_id: TLargeintField
      FieldName = 'soli_id'
      Origin = 'soli_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlSolicitacoesPorIDsoli_id_empresa: TIntegerField
      FieldName = 'soli_id_empresa'
      Origin = 'soli_id_empresa'
    end
    object sqlSolicitacoesPorIDsoli_id_usuario: TIntegerField
      FieldName = 'soli_id_usuario'
      Origin = 'soli_id_usuario'
    end
    object sqlSolicitacoesPorIDsoli_id_operador: TIntegerField
      FieldName = 'soli_id_operador'
      Origin = 'soli_id_operador'
    end
    object sqlSolicitacoesPorIDsoli_id_categoria: TIntegerField
      FieldName = 'soli_id_categoria'
      Origin = 'soli_id_categoria'
    end
    object sqlSolicitacoesPorIDsoli_id_prioridade: TIntegerField
      FieldName = 'soli_id_prioridade'
      Origin = 'soli_id_prioridade'
    end
    object sqlSolicitacoesPorIDsoli_data_cad: TSQLTimeStampField
      FieldName = 'soli_data_cad'
      Origin = 'soli_data_cad'
    end
    object sqlSolicitacoesPorIDsoli_data_fim: TSQLTimeStampField
      FieldName = 'soli_data_fim'
      Origin = 'soli_data_fim'
    end
    object sqlSolicitacoesPorIDsoli_avaliacao: TIntegerField
      FieldName = 'soli_avaliacao'
      Origin = 'soli_avaliacao'
    end
    object sqlSolicitacoesPorIDsoli_assunto: TStringField
      FieldName = 'soli_assunto'
      Origin = 'soli_assunto'
      Size = 120
    end
    object sqlSolicitacoesPorIDsoli_conteudo: TMemoField
      FieldName = 'soli_conteudo'
      Origin = 'soli_conteudo'
      BlobType = ftMemo
    end
    object sqlSolicitacoesPorIDsoli_status: TStringField
      FieldName = 'soli_status'
      Origin = 'soli_status'
      Size = 30
    end
  end
  object sqlSolicitacoesMensagens: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      'MENS_ID AS MENS_ID,'
      'MENS_ID_SOLICITACAO AS MENS_ID_SOLICITACAO,'
      'MENS_ID_USUARIO AS MENS_ID_USUARIO,'
      'MENS_ID_OPERADOR AS MENS_ID_OPERADOR,'
      'MENS_DATA AS MENS_DATA,'
      'MENS_AVALIACAO AS MENS_AVALIACAO,'
      'MENS_CONTEUDO AS MENS_CONTEUDO,'
      'MENS_ANEXO AS MENS_ANEXO,'
      'MENS_STATUS AS MENS_STATUS,'
      'MENS_ORIGEM AS MENS_ORIGEM,'
      'OPERADORES.USUA_NOME AS NOME_OPERADOR,'
      'USUARIOS.USUA_NOME AS NOME_USUARIO,'
      'OPERADORES.USUA_FUNCAO AS FUNCAO_OPERADOR,'
      'USUARIOS.USUA_FUNCAO AS FUNCAO_USUARIO'
      'FROM SOLICITACOES_MENSAGENS'
      
        'LEFT JOIN USUARIOS OPERADORES ON (OPERADORES.USUA_ID=MENS_ID_OPE' +
        'RADOR)'
      
        'LEFT JOIN USUARIOS USUARIOS ON (USUARIOS.USUA_ID=MENS_ID_USUARIO' +
        ')'
      'WHERE MENS_ID_SOLICITACAO = :IDSOLICITACAO')
    Left = 472
    Top = 336
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlSolicitacoesMensagensmens_id: TLargeintField
      FieldName = 'mens_id'
      Origin = 'mens_id'
    end
    object sqlSolicitacoesMensagensmens_id_solicitacao: TIntegerField
      FieldName = 'mens_id_solicitacao'
      Origin = 'mens_id_solicitacao'
    end
    object sqlSolicitacoesMensagensmens_id_usuario: TIntegerField
      FieldName = 'mens_id_usuario'
      Origin = 'mens_id_usuario'
    end
    object sqlSolicitacoesMensagensmens_id_operador: TIntegerField
      FieldName = 'mens_id_operador'
      Origin = 'mens_id_operador'
    end
    object sqlSolicitacoesMensagensmens_data: TSQLTimeStampField
      FieldName = 'mens_data'
      Origin = 'mens_data'
    end
    object sqlSolicitacoesMensagensmens_avaliacao: TIntegerField
      FieldName = 'mens_avaliacao'
      Origin = 'mens_avaliacao'
    end
    object sqlSolicitacoesMensagensmens_conteudo: TMemoField
      FieldName = 'mens_conteudo'
      Origin = 'mens_conteudo'
      BlobType = ftMemo
    end
    object sqlSolicitacoesMensagensmens_anexo: TMemoField
      FieldName = 'mens_anexo'
      Origin = 'mens_anexo'
      BlobType = ftMemo
    end
    object sqlSolicitacoesMensagensmens_status: TStringField
      FieldName = 'mens_status'
      Origin = 'mens_status'
      Size = 30
    end
    object sqlSolicitacoesMensagensmens_origem: TStringField
      FieldName = 'mens_origem'
      Origin = 'mens_origem'
      Size = 30
    end
    object sqlSolicitacoesMensagensnome_operador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_operador'
      Origin = 'nome_operador'
      Size = 120
    end
    object sqlSolicitacoesMensagensnome_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_usuario'
      Origin = 'nome_usuario'
      Size = 120
    end
    object sqlSolicitacoesMensagensfuncao_operador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'funcao_operador'
      Origin = 'funcao_operador'
      Size = 30
    end
    object sqlSolicitacoesMensagensfuncao_usuario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'funcao_usuario'
      Origin = 'funcao_usuario'
      Size = 30
    end
  end
  object sqlGeral: TFDQuery
    Connection = conexaoPG
    Left = 704
    Top = 456
  end
  object sqlVincularEmpresaUsuario: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT * FROM USUARIOS_EMPRESAS')
    Left = 784
    Top = 264
    object sqlVincularEmpresaUsuariousue_id: TLargeintField
      FieldName = 'usue_id'
      Origin = 'usue_id'
    end
    object sqlVincularEmpresaUsuariousue_id_usuario: TIntegerField
      FieldName = 'usue_id_usuario'
      Origin = 'usue_id_usuario'
    end
    object sqlVincularEmpresaUsuariousue_id_empresa: TIntegerField
      FieldName = 'usue_id_empresa'
      Origin = 'usue_id_empresa'
    end
  end
  object sqlOperadores: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM OPERADORES')
    Left = 288
    Top = 64
    object sqlOperadoresoper_id: TLargeintField
      FieldName = 'oper_id'
      Origin = 'oper_id'
    end
    object sqlOperadoresoper_nome: TStringField
      FieldName = 'oper_nome'
      Origin = 'oper_nome'
      Size = 120
    end
    object sqlOperadoresoper_cpf: TStringField
      FieldName = 'oper_cpf'
      Origin = 'oper_cpf'
      Size = 120
    end
    object sqlOperadoresoper_email: TStringField
      FieldName = 'oper_email'
      Origin = 'oper_email'
      Size = 120
    end
    object sqlOperadoresoper_senha: TStringField
      FieldName = 'oper_senha'
      Origin = 'oper_senha'
      Size = 120
    end
    object sqlOperadoresoper_data_cad: TSQLTimeStampField
      FieldName = 'oper_data_cad'
      Origin = 'oper_data_cad'
    end
    object sqlOperadoresoper_status: TStringField
      FieldName = 'oper_status'
      Origin = 'oper_status'
      Size = 1
    end
    object sqlOperadoresoper_funcao: TStringField
      FieldName = 'oper_funcao'
      Origin = 'oper_funcao'
      Size = 30
    end
    object sqlOperadoresoper_perm_empresas: TStringField
      FieldName = 'oper_perm_empresas'
      Origin = 'oper_perm_empresas'
    end
    object sqlOperadoresoper_perm_usuarios: TStringField
      FieldName = 'oper_perm_usuarios'
      Origin = 'oper_perm_usuarios'
    end
    object sqlOperadoresoper_perm_operadores: TStringField
      FieldName = 'oper_perm_operadores'
      Origin = 'oper_perm_operadores'
    end
  end
  object sqlOperadoresPorID: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM OPERADORES'
      'WHERE OPER_ID = :USUARIO')
    Left = 288
    Top = 176
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object sqlOperadoresPorIDoper_id: TLargeintField
      FieldName = 'oper_id'
      Origin = 'oper_id'
    end
    object sqlOperadoresPorIDoper_nome: TStringField
      FieldName = 'oper_nome'
      Origin = 'oper_nome'
      Size = 120
    end
    object sqlOperadoresPorIDoper_cpf: TStringField
      FieldName = 'oper_cpf'
      Origin = 'oper_cpf'
      Size = 120
    end
    object sqlOperadoresPorIDoper_email: TStringField
      FieldName = 'oper_email'
      Origin = 'oper_email'
      Size = 120
    end
    object sqlOperadoresPorIDoper_senha: TStringField
      FieldName = 'oper_senha'
      Origin = 'oper_senha'
      Size = 120
    end
    object sqlOperadoresPorIDoper_data_cad: TSQLTimeStampField
      FieldName = 'oper_data_cad'
      Origin = 'oper_data_cad'
    end
    object sqlOperadoresPorIDoper_status: TStringField
      FieldName = 'oper_status'
      Origin = 'oper_status'
      Size = 1
    end
    object sqlOperadoresPorIDoper_funcao: TStringField
      FieldName = 'oper_funcao'
      Origin = 'oper_funcao'
      Size = 30
    end
    object sqlOperadoresPorIDoper_perm_empresas: TStringField
      FieldName = 'oper_perm_empresas'
      Origin = 'oper_perm_empresas'
    end
    object sqlOperadoresPorIDoper_perm_usuarios: TStringField
      FieldName = 'oper_perm_usuarios'
      Origin = 'oper_perm_usuarios'
    end
    object sqlOperadoresPorIDoper_perm_operadores: TStringField
      FieldName = 'oper_perm_operadores'
      Origin = 'oper_perm_operadores'
    end
  end
  object sqlOperadoresPorEmail: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM OPERADORES'
      'WHERE OPER_EMAIL = :EMAIL')
    Left = 288
    Top = 232
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlOperadoresPorEmailoper_id: TLargeintField
      FieldName = 'oper_id'
      Origin = 'oper_id'
    end
    object sqlOperadoresPorEmailoper_nome: TStringField
      FieldName = 'oper_nome'
      Origin = 'oper_nome'
      Size = 120
    end
    object sqlOperadoresPorEmailoper_cpf: TStringField
      FieldName = 'oper_cpf'
      Origin = 'oper_cpf'
      Size = 120
    end
    object sqlOperadoresPorEmailoper_email: TStringField
      FieldName = 'oper_email'
      Origin = 'oper_email'
      Size = 120
    end
    object sqlOperadoresPorEmailoper_senha: TStringField
      FieldName = 'oper_senha'
      Origin = 'oper_senha'
      Size = 120
    end
    object sqlOperadoresPorEmailoper_data_cad: TSQLTimeStampField
      FieldName = 'oper_data_cad'
      Origin = 'oper_data_cad'
    end
    object sqlOperadoresPorEmailoper_status: TStringField
      FieldName = 'oper_status'
      Origin = 'oper_status'
      Size = 1
    end
    object sqlOperadoresPorEmailoper_funcao: TStringField
      FieldName = 'oper_funcao'
      Origin = 'oper_funcao'
      Size = 30
    end
    object sqlOperadoresPorEmailoper_perm_empresas: TStringField
      FieldName = 'oper_perm_empresas'
      Origin = 'oper_perm_empresas'
    end
    object sqlOperadoresPorEmailoper_perm_usuarios: TStringField
      FieldName = 'oper_perm_usuarios'
      Origin = 'oper_perm_usuarios'
    end
    object sqlOperadoresPorEmailoper_perm_operadores: TStringField
      FieldName = 'oper_perm_operadores'
      Origin = 'oper_perm_operadores'
    end
  end
  object sqlObtemDadosUsuario: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      'USUA_ID AS ID,'
      'USUA_NOME AS NOME,'
      'USUA_EMAIL AS EMAIL,'
      #39'USU'#193'RIO'#39' AS TIPO,'
      #39'false'#39' AS PERM_EMPRESAS,'
      #39'false'#39' AS PERM_USUARIOS,'
      #39'false'#39' AS PERM_OPERADORES'
      'FROM USUARIOS'
      'UNION ALL'
      'SELECT'
      'OPER_ID AS ID,'
      'OPER_NOME AS NOME,'
      'OPER_EMAIL AS EMAIL,'
      #39'OPERADOR'#39' AS TIPO,'
      'OPER_PERM_EMPRESAS AS PERM_EMPRESAS,'
      'OPER_PERM_USUARIOS AS PERM_USUARIOS,'
      'OPER_PERM_OPERADORES AS PERM_OPERADORES'
      'FROM OPERADORES')
    Left = 304
    Top = 512
    object sqlObtemDadosUsuarioid: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object sqlObtemDadosUsuarioemail: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'email'
      Origin = 'email'
      ReadOnly = True
      Size = 120
    end
    object sqlObtemDadosUsuariotipo: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ReadOnly = True
      BlobType = ftMemo
    end
    object sqlObtemDadosUsuarionome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ReadOnly = True
      Size = 120
    end
    object sqlObtemDadosUsuarioperm_empresas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'perm_empresas'
      Origin = 'perm_empresas'
      ReadOnly = True
      Size = 8190
    end
    object sqlObtemDadosUsuarioperm_usuarios: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'perm_usuarios'
      Origin = 'perm_usuarios'
      ReadOnly = True
      Size = 8190
    end
    object sqlObtemDadosUsuarioperm_operadores: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'perm_operadores'
      Origin = 'perm_operadores'
      ReadOnly = True
      Size = 8190
    end
  end
  object sqlEstatisticasSolicitacoes: TFDQuery
    Connection = conexaoPG
    SQL.Strings = (
      'SELECT'
      'SOLI_STATUS,'
      'COUNT(*)'
      'FROM SOLICITACOES'
      
        'WHERE SOLI_ID_OPERADOR = (SELECT OPER_ID FROM OPERADORES WHERE U' +
        'PPER(OPER_EMAIL) = :EMAIL)'
      'GROUP BY 1')
    Left = 320
    Top = 360
    ParamData = <
      item
        Name = 'EMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object sqlEstatisticasSolicitacoessoli_status: TStringField
      FieldName = 'soli_status'
      Origin = 'soli_status'
      Size = 30
    end
    object sqlEstatisticasSolicitacoescount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'count'
      Origin = 'count'
      ReadOnly = True
    end
  end
end
