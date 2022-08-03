unit UPrincipal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, Vcl.WinXCtrls,
    Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
    TtelaPrincipal = class(TForm)
        RESTServicePooler: TRESTServicePooler;
        Switch: TToggleSwitch;
        Image1: TImage;
        gbStatus: TGroupBox;
        gbMonitoramento: TGroupBox;
        gbRequisicoes: TGroupBox;
        gbRespostas: TGroupBox;
        memoReq: TMemo;
        memoResp: TMemo;
        tmrMonitoramento: TTimer;
        procedure SwitchClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure tmrMonitoramentoTimer(Sender: TObject);
        procedure RESTServicePoolerLastRequest(Value: string);
        procedure RESTServicePoolerLastResponse(Value: string);
    private
        { Private declarations }
        VLastRequest, VLastRequestB: String;
    public
        { Public declarations }
    end;

var
    telaPrincipal: TtelaPrincipal;

implementation

{$R *.dfm}

uses UDados;

procedure TtelaPrincipal.FormCreate(Sender: TObject);
begin
    RESTServicePooler.ServerMethodClass := TTDados;
    Switch.State := tssOn;
end;

procedure TtelaPrincipal.RESTServicePoolerLastRequest(Value: string);
begin
    VLastRequest := Value;
end;

procedure TtelaPrincipal.RESTServicePoolerLastResponse(Value: string);
begin
    VLastRequestB := Value;
end;

procedure TtelaPrincipal.SwitchClick(Sender: TObject);
begin
    if Switch.State = tssOn then
    begin
        RESTServicePooler.Active := True;
    end
    else
    begin
        RESTServicePooler.Active := False;
    end;
end;

procedure TtelaPrincipal.tmrMonitoramentoTimer(Sender: TObject);
var
    VTempLastRequest, VTempLastRequestB: string;

begin
    tmrMonitoramento.Enabled := False;
    Try
        VTempLastRequest := VLastRequest;
        VTempLastRequestB := VLastRequestB;
        If (VTempLastRequest <> '') Then
        Begin
            If memoReq.Lines.Count > 0 Then
                If memoReq.Lines[memoReq.Lines.Count - 1] = VTempLastRequest Then
                    Exit;
            If memoReq.Lines.Count = 0 Then
                memoReq.Lines.Add(Copy(VTempLastRequest, 1, 100))
            Else
                memoReq.Lines[memoReq.Lines.Count - 1] := Copy(VTempLastRequest, 1, 100);
            If Length(VTempLastRequest) > 1000 Then
                memoReq.Lines[memoReq.Lines.Count - 1] := memoReq.Lines[memoReq.Lines.Count - 1] + '...';
            If memoResp.Lines.Count > 0 Then
                If memoResp.Lines[memoResp.Lines.Count - 1] = VTempLastRequestB Then
                    Exit;
            If memoResp.Lines.Count = 0 Then
                memoResp.Lines.Add(Copy(VTempLastRequestB, 1, 100))
            Else
                memoResp.Lines[memoResp.Lines.Count - 1] := Copy(VTempLastRequestB, 1, 100);
            If Length(VTempLastRequest) > 1000 Then
                memoResp.Lines[memoResp.Lines.Count - 1] := memoResp.Lines[memoResp.Lines.Count - 1] + '...';
        End;
    Finally
        tmrMonitoramento.Enabled := True;
    End;
end;

end.
