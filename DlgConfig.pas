unit DlgConfig;

interface

uses
  Classes, Controls, Forms, ExtUI, Dialogs, Windows,Messages,
  StdCtrls, Spin, ComCtrls, DWinCtl, SysUtils, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxEdit, ImgList, TypInfo,
  Rtti,
  ExtCtrls, ButtonGroup, cxInplaceContainer, cxVGrid, Graphics,
  Generics.Collections,
  cxOI, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxBar, cxClasses, cxCheckBox, cxBarEditItem,
  dxSkinsdxBarPainter, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC, cxScrollBox,
  cxSplitter, cxCheckComboBox,uDListView, AppEvnts, ActnList, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList;

type
  TControlClass = class of TDControl;

  TfrmDlgConfig = class(TForm)
    GroupBox1: TGroupBox;
    GameWindowName: TGroupBox;
    InspectorUI: TcxRTTIInspector;
    TreeView: TTreeView;
    pnl_UIInfo: TPanel;
    lbl_Class: TLabel;
    lbl_Component: TLabel;
    lbl_Caption: TLabel;
    btn1: TButtonGroup;
    cxmglst1: TcxImageList;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    chk_LangChange: TCheckBox;
    edt_ClassName: TEdit;
    edt_ComponetName: TEdit;
    edt_CaptionText: TEdit;
    DxBarManager: TdxBarManager;
    dxbrManagerBar: TdxBar;
    cxBar: TcxImageList;
    dxOpen: TdxBarButton;
    dxSave: TdxBarButton;
    dxImport: TdxBarButton;
    cxShowUIFrame: TcxBarEditItem;
    cxDesigningMode: TcxBarEditItem;
    cxAutoTrace: TcxBarEditItem;
    cxPgc1: TcxPageControl;
    cxtbsht1: TcxTabSheet;
    cxtbsht2: TcxTabSheet;
    cxspltr1: TcxSplitter;
    cxscrlbx1: TcxScrollBox;
    cxspltr2: TcxSplitter;
    cxBarEditItem1: TcxBarEditItem;
    pnl_Client: TPanel;
    tmr_SetClientToChild: TTimer;
    tmr_SetCaption: TTimer;
    dxExport: TdxBarButton;
    dxbrbtnBringToFront: TdxBarButton;
    dxbrbtnSendToBack: TdxBarButton;
    dxbrbtnExportUI: TdxBarButton;
    dxbrbtnImportUI: TdxBarButton;
    dxbrbtnDeleteUI: TdxBarButton;
    dxbrbtnCutComponent: TdxBarButton;
    dxbrbtnPasteUI: TdxBarButton;
    pm1: TPopupMenu;
    SetUIFront: TMenuItem;
    SetUIBackend: TMenuItem;
    Export: TMenuItem;
    Import: TMenuItem;
    CutUI: TMenuItem;
    PasteUI: TMenuItem;
    DelUI: TMenuItem;
    cxmglstpopup: TcxImageList;
    cxShowUIFrame1: TcxBarEditItem;
    tmr_CheckInsperObject: TTimer;
    EventHandler: TApplicationEvents;
    btnsdfsdfasdf: TButton;
    btn3sss: TButton;
    actlst1: TActionList;
    act_Save: TAction;
    cxtbsht_Config: TcxTabSheet;
    dxbrbtn_ClientConfig: TdxBarButton;
    ClientSettingRtti: TcxRTTIInspector;
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ButtonShowClick(Sender: TObject);
    procedure EditImageChange(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure Btn2Click(Sender: TObject);
    procedure se1Change(Sender: TObject);
    procedure chk_ShowUIFrameClick(Sender: TObject);
    procedure TreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure btn1ButtonClicked(Sender: TObject; Index: Integer);
    procedure InspectorUIFilterPropertyEx(Sender: TObject;
      const PropertyName: string; var Accept: Boolean);
    procedure dxbrbtnBringToFrontClick(Sender: TObject);
    procedure dxbrbtnSendToBackClick(Sender: TObject);
    procedure chk_LangChangeClick(Sender: TObject);
    procedure dxbrbtnExportUIClick(Sender: TObject);
    procedure dxbrbtnImportUIClick(Sender: TObject);
    procedure dxbrbtnDeleteUIClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeViewEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxbrbtnCutComponentClick(Sender: TObject);
    procedure dxbrbtnPasteUIClick(Sender: TObject);
    procedure pmPopup(Sender: TObject);
    procedure dxOpenClick(Sender: TObject);
    procedure dxSaveClick(Sender: TObject);
    procedure cxAutoTraceChange(Sender: TObject);
    procedure tmr_SetClientToChildTimer(Sender: TObject);
    procedure tmr_SetCaptionTimer(Sender: TObject);
    procedure tmr_CheckInsperObjectTimer(Sender: TObject);
    procedure EventHandlerMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure btnsdfsdfasdfClick(Sender: TObject);
    procedure btn3sssClick(Sender: TObject);
    procedure act_SaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Open();
    procedure RefWindowsList();
    procedure RefWindowsListChild(TreeNode: TTreeNode; DControl: TDControl);
    procedure RefAcherWorder();
    procedure OnControlPostionChange(Sender: TDControl);
  end;

  TDXPropStringPropertyEditor = class(TcxStringProperty)
    function GetName: String; override;
    function GetValue: string; override;
  end;

  TDXPropIntPropertyEditor = class(TcxIntegerProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;

  TDXPropFloatPropertyEditor = class(TcxFloatProperty)
    function GetName: string; override;
  end;

  TDXPropBoolPropertyEditor = class(TcxBoolProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;

  TDXEnumPropertyEditor = class(TcxEnumProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;

  TDXSetsPropertyEditor = class(TcxSetProperty)
    function GetName: string; override;
    function GetValue: string; override;
    procedure GetProperties(AOwner: TComponent;
      Proc: TcxGetPropEditProc); override;
  end;

  TDXSetsElement = class(TcxSetElementProperty)
    function GetName: string; override;
  end;

  TDXClassPropertyEditor = class(TcxClassProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;

  TDXColorProperty = class(cxOI.TcxColorProperty)
    function GetName: string; override;
  end;

  TDXSelChrJobInfo = class(TcxClassProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;

  TDXPropIntJobImage = class(TcxIntegerProperty)
    function GetName: string; override;
    function GetValue: string; override;
  end;
var
  frmDlgConfig: TfrmDlgConfig;
  sXML1: string = 'MS';
  sXML8: string = 'ET';

  const
  STDHEIGHT = 55;
  STDWIDTH = 545;

implementation

uses
  MShare, uActionsMgr, FState,ClMain,InputUIName,PopupMeunuFrm,uClientCustomSetting;

var
  DefDControl: TDControl;
  CopyContorl: TDControl;
  CopyTreeNode: TTreeNode;
  ControlClass: TControlClass;
  PropertyNames: TDictionary<String, String>; // ������Ӣ�Ķ��ձ�

  ValueNames: TDictionary<String, String>; // ����ֵ ��Ӣ�Ķ��ձ�
  ValueNames_Search: TDictionary<String, String>; // ����ֵ����� �� ���Ĳ���Ӣ��
  AttrTypeInfo: TDictionary<String, PTypeInfo>;

  // ������ʾ������
  FilterPropertyList: TDictionary<String, Boolean>; // ������ʾ������

  g_BoChinese: Boolean = True;

  g_NowLoadFile:string = '';

{$R *.dfm}
  { TfrmDlgConfig }

procedure OnUITrace(D: TDControl);
var
  I: Integer;
  Node: TTreeNode;
begin
  for I := 0 to frmDlgConfig.TreeView.Items.Count - 1 do
  begin
    Node := frmDlgConfig.TreeView.Items[I];
    if Node.Data = D then
    begin
      frmDlgConfig.TreeView.Select(Node);
      Break;
    end;
  end;
end;

procedure TfrmDlgConfig.dxbrbtnBringToFrontClick(Sender: TObject);
var
  I: Integer;
  D: TDControl;
begin
  if (DefDControl <> nil) and (DefDControl.DParent <> nil) then
  begin
    DefDControl.DParent.RemoveControl(DefDControl);
    DefDControl.DParent.AddChild(DefDControl);
  end;
end;

procedure TfrmDlgConfig.act_SaveExecute(Sender: TObject);
begin
  dxSaveClick(nil);
end;

procedure TfrmDlgConfig.btn1ButtonClicked(Sender: TObject; Index: Integer);
var
  Control: TWinControl;
  D: TDControl;
  UIName: string;
  TreeNode: TTreeNode;
  I: Integer;
begin

  btn1.ItemIndex := -1;

  if DefDControl = nil then
    Exit;

  if not DefDControl.CanAddChildControl then
  begin
    Application.MessageBox('�������������������', '����', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if  GetNewUIName(UIName) then
  begin

    if g_DWinMan.FindControlByName(UIName) <> nil then
    begin
      Application.MessageBox('�Ѿ�����ͬ�������������������', '����', MB_OK + MB_ICONSTOP);
      Exit;
    end;

    if not IsValidIdent(UIName,False) then
    begin
      Application.MessageBox('������Ʋ��������ֿ�ͷ', '����', MB_OK + MB_ICONSTOP);
      Exit;
    end;

    Control := TWinControl(Sender);
    case Index of
      0:
        D := TDTextField.Create(DefDControl);
      1:
        begin
          D := TDEdit.Create(DefDControl);
          D.Propertites.EnableFocus := True;
        end;
      2:
        D := TDWindow.Create(DefDControl);
      3:
        D := TDAniButton.Create(DefDControl);
      4:
        D := TDScriptButton.Create(DefDControl);
      5:
        D := TDCloseWindowButton.Create(DefDControl);
      6:
        D := TDSetControlVisiableButton.Create(DefDControl);
      7:
        D := TDDrawItemImage.Create(DefDControl);
      8:
        D := TDVarTextField.Create(DefDControl);

    end;

    D.DParent := DefDControl;
    D.Parent := DefDControl;
    D.IsCustomUI := True;
    DefDControl.AddChild(D);

    D.Left := 0;
    D.Top := 0;
    D.Width := 16;
    D.Height := 16;

    D.Name := UIName;
    D.Visible := True;
    D.Caption := UIName;

    // ���ӵ��б�
    for I := 0 to TreeView.Items.Count - 1 do
    begin
      TreeNode := TreeView.Items[I];
      if TreeNode.Data = DefDControl then
      begin
        TreeNode := TreeView.Items.AddChild(TreeNode,
          D.Caption + '(' + D.Name + ')');
        TreeNode.Data := D;
        TreeView.Select(TreeNode);
        Break;
      end;
    end;

  end;
end;

procedure TfrmDlgConfig.btn1Click(Sender: TObject);
begin
  btn1.ItemIndex := -1;
end;

procedure TfrmDlgConfig.Btn2Click(Sender: TObject);
const
  sData = 'WORDER_CKL : Array[0..1,0..887] of Byte = (' + #13#10 + '(' + #13#10
    + '%s' + '),' + #13#10 + '(' + #13#10 + '%s' + #13#10 + '));';
var
  sMan: string;
  swomen: string;
  I: Integer;
  sList: TStringList;
begin
  sList := TStringList.Create;
  for I := 0 to 887 do
  begin
    if (I <> 0) and (I mod 40 = 0) then
    begin
      sMan := sMan + #13#10;
    end;

    if I = 887 then
      sMan := sMan + IntToStr(WORDER_CKL[0, I])
    else
      sMan := sMan + IntToStr(WORDER_CKL[0, I]) + ',';
  end;

  for I := 0 to 887 do
  begin
    if (I <> 0) and (I mod 40 = 0) then
    begin
      swomen := swomen + #13#10;
    end;
    if I = 887 then

      swomen := swomen + IntToStr(WORDER_CKL[1, I])
    else
      swomen := swomen + IntToStr(WORDER_CKL[1, I]) + ',';
  end;

  sList.Text := Format(sData, [sMan, swomen]);
  sList.SaveToFile('D:\22.txt');

  sList.Free;

end;

procedure TfrmDlgConfig.btn3sssClick(Sender: TObject);
var
  UIName, npcname , AMessage: String;
  S:TStringList;
begin
  g_nMDlgX := g_MySelf.m_nCurrX;
  g_nMDlgY := g_MySelf.m_nCurrY;

  S:= TStringList.Create;
  Try
    S.LoadFromFile('D:\91Debug\2.txt');
    FrmDlg.ShowCustomMDlg(1122, 0, 0,'����ͨ��', '����֮��',  S.Text);
  Finally
    S.Free;
  End;
end;

procedure TfrmDlgConfig.btnsdfsdfasdfClick(Sender: TObject);
var
  UIName, npcname , AMessage: String;
  S:TStringList;
begin
  g_nMDlgX := g_MySelf.m_nCurrX;
  g_nMDlgY := g_MySelf.m_nCurrY;

  S:= TStringList.Create;
  Try
    S.LoadFromFile('D:\91Debug\1.txt');
    FrmDlg.ShowCustomMDlg(1122, 0, 0,'����ͨ��', '����֮��',  S.Text);
  Finally
    S.Free;
  End;
end;

procedure TfrmDlgConfig.RefAcherWorder;
var
  I: Integer;
  ManNode, womenNode, Node: TTreeNode;
begin
//  ManNode := tv1.Items.AddFirst(nil, '��');
//  womenNode := tv1.Items.AddFirst(ManNode, 'Ů');
//
//  for I := 0 to 887 do
//  begin
//    Node := tv1.Items.AddChild(ManNode, IntToStr(I));
//    Node.Data := @WORDER_CKL[0, I];
//  end;
//
//  for I := 0 to 887 do
//  begin
//    Node := tv1.Items.AddChild(womenNode, IntToStr(I));
//    Node.Data := @WORDER_CKL[1, I];
//  end;

end;


procedure TfrmDlgConfig.ButtonShowClick(Sender: TObject);
begin
  if DefDControl <> nil then
    DefDControl.Visible := not DefDControl.Visible;
end;


procedure TfrmDlgConfig.chk_LangChangeClick(Sender: TObject);
var
  obj: TPersistent;
begin
  g_BoChinese := chk_LangChange.Checked;
  obj := InspectorUI.InspectedObject;
  InspectorUI.InspectedObject := nil;
  InspectorUI.InspectedObject := obj;
  InspectorUI.FullExpand;
end;



procedure TfrmDlgConfig.chk_ShowUIFrameClick(Sender: TObject);
begin
  DWinCtl.ShowUIFrame := not DWinCtl.ShowUIFrame;
end;

procedure TfrmDlgConfig.dxbrbtnCutComponentClick(Sender: TObject);
begin
  CopyContorl := DefDControl;
  CopyTreeNode := TreeView.Selected;
end;

procedure TfrmDlgConfig.cxAutoTraceChange(Sender: TObject);
begin
  if Sender = cxAutoTrace then
  begin
    g_DWinMan.AutoUITrace := TcxBarEditItem(Sender).EditValue;
  end else if Sender = cxShowUIFrame then
  begin
    DWinCtl.ShowUIFrame := TcxBarEditItem(Sender).EditValue;
  end else if Sender = cxDesigningMode then
  begin
    g_DWinMan.DragMode := TcxBarEditItem(Sender).EditValue;
  end;


end;

procedure TfrmDlgConfig.dxbrbtnDeleteUIClick(Sender: TObject);
begin
  if DefDControl <> nil then
  begin
    if DefDControl.IsCustomUI then
    begin
      DefDControl.DParent.RemoveControl(DefDControl);
      DefDControl.DParent := nil;
      InspectorUI.InspectedObject := nil;
      DefDControl.Free;
      RefWindowsList;
    end
    else
    begin
      Application.MessageBox('ϵͳ�������ֻ�����Ρ�������ɾ��!', '����', MB_OK + MB_ICONSTOP);
    end;
  end;
end;

procedure TfrmDlgConfig.dxOpenClick(Sender: TObject);
begin
  // g_DWinMan.LoadFromFile('D:\360data\��Ҫ����\����\qqqq.xml');
  if dlgOpen1.Execute then
  begin
    g_DWinMan.LoadFromFile(dlgOpen1.FileName);
    g_NowLoadFile := dlgOpen1.FileName;
    ClientSettingRtti.InspectedObject := nil;
    ClientSettingRtti.InspectedObject := g_ClientCustomSetting;
  end;

  RefWindowsList;
end;

procedure TfrmDlgConfig.dxSaveClick(Sender: TObject);
var
  DirName:String;
  FileName:String;
  OldFormatSettings :TFormatSettings;
begin
  // g_DWinMan.SaveToFile('D:\360data\��Ҫ����\����\qqqq.xml');
  PopupMeunuFrm.DXPopupMenu.HidePopup;
  if (g_NowLoadFile <> '')  and (FileExists(g_NowLoadFile))then
  begin
    g_DWinMan.SaveToFile(g_NowLoadFile);
    ShowMessage('����ɹ���');
  end else
  begin

    if dlgSave1.Execute then
    begin
      if FileExists(dlgSave1.FileName) then
      begin
        if Application.MessageBox('��ǰ·���Ѿ�����ͬ���ļ����Ƿ񸲸ǣ�', '�Ƿ񸲸ǣ�',
          MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          g_DWinMan.SaveToFile(dlgSave1.FileName);
        end;
      end
      else
      begin
        g_DWinMan.SaveToFile(dlgSave1.FileName);
      end;

      g_NowLoadFile := dlgSave1.FileName;
    end else
    begin
      Exit;
    end;
  end;


  DirName := ExtractFilePath(Application.ExeName) + '91UIBak\';
  if not DirectoryExists(DirName) then
    ForceDirectories(DirName);
  OldFormatSettings := FormatSettings;
  FormatSettings.DateSeparator := '-';
  FormatSettings.TimeSeparator := '_';
  FormatSettings.ListSeparator := '_';
  FormatSettings.DecimalSeparator := '_';
  FormatSettings.ThousandSeparator := '_';
  Try
    FileName := DirName + DateTimeToStr(Now) + '.UI';
    FileName := StringReplace(FileName,' ','-',[rfReplaceAll]);

    g_DWinMan.SaveToFile(FileName);
  Finally
    FormatSettings := OldFormatSettings;
  End;






end;

procedure TfrmDlgConfig.EditImageChange(Sender: TObject);
begin
  if DefDControl = nil then
    Exit;
end;

procedure TfrmDlgConfig.EventHandlerMessage(var Msg: tagMSG;
  var Handled: Boolean);
var
  KeyCode : Word;
begin
//  if Msg.message = WM_KEYDOWN then
//  begin
//    case Msg.wParam of
//      VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN:
//      begin
//        if GetForegroundWindow <> ClMain.frmMain.Handle  then
//        begin
//          SetForegroundWindow(ClMain.frmMain.Handle);
//          Handled := True;
//        end;
//      end;
//    end;
//  end;
end;

procedure TfrmDlgConfig.dxbrbtnExportUIClick(Sender: TObject);
begin
  if DefDControl = nil then
    Exit;

  if dlgSave1.Execute then
  begin

    if FileExists(dlgSave1.FileName) then
    begin

      if Application.MessageBox('��ǰ·���Ѿ�����ͬ���ļ����Ƿ񸲸ǣ�', '�Ƿ񸲸ǣ�',
        MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
      begin
        DefDControl.SaveToFile(dlgSave1.FileName);
      end;
    end
    else
    begin
      DefDControl.SaveToFile(dlgSave1.FileName);
    end;
  end;

end;

procedure TfrmDlgConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  g_DWinMan.DragMode := False;
  DWinCtl.ShowUIFrame := False;
end;

// ���˵���ĿΪ ����.����
procedure TfrmDlgConfig.dxbrbtnImportUIClick(Sender: TObject);
begin
  if DefDControl = nil then
    Exit;

  if dlgOpen1.Execute then
  begin
    DefDControl.LoadFromFile(dlgOpen1.FileName);
  end;

  RefWindowsList;
end;

procedure TfrmDlgConfig.InspectorUIFilterPropertyEx(Sender: TObject;
  const PropertyName: string; var Accept: Boolean);
begin
  if FilterPropertyList.ContainsKey(PropertyName) then
    Accept := False;
end;

procedure TfrmDlgConfig.OnControlPostionChange(Sender: TDControl);
begin
  InspectorUI.InspectedObject := nil;
  if Sender <> nil then
    InspectorUI.InspectedObject := Sender.Propertites;

  DWinCtl.SeletedControl := Sender;
  InspectorUI.FullExpand;
end;

procedure TfrmDlgConfig.Open;
begin
  DefDControl := nil;
  RefWindowsList();
  RefAcherWorder();
  DWinCtl.UITraceProc := OnUITrace;
  DWinCtl.OnControlPostionChange := OnControlPostionChange;
  Visible := True;
end;

procedure TfrmDlgConfig.dxbrbtnPasteUIClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  if (DefDControl <> nil) and (CopyContorl <> nil) and (CopyTreeNode <> nil) and
    (TreeView.Selected <> nil) then
  begin
    if not DefDControl.CanAddChildControl then
      Application.MessageBox('�������������������', '����', MB_OK + MB_ICONSTOP);
    if (CopyContorl.DParent <> DefDControl)  and (CopyContorl <> DefDControl) then
    begin
      CopyContorl.DParent.RemoveControl(CopyContorl);
      DefDControl.AddSub(CopyContorl);
      CopyContorl.PositionChanged();
      Node := TreeView.Items.AddChild(TreeView.Selected, CopyTreeNode.Text);
      Node.Data := CopyTreeNode.Data;

      TreeView.Items.Delete(CopyTreeNode);

      CopyContorl := nil;
    end;
  end;
end;

procedure TfrmDlgConfig.pmPopup(Sender: TObject);
begin
  if (CopyContorl = nil) or (CopyTreeNode = nil) then
  begin
  //  PasteUI.Enabled := False;
  end
  else
  begin
  //  PasteUI.Enabled := True;
  end;
end;

procedure TfrmDlgConfig.RefWindowsList();
var
  I: Integer;
  DControl, GlobalControl: TDControl;
  BoAddGlobal: Boolean;
  GlobalNode, ANode: TTreeNode;
begin
  TreeView.Items.Clear;
  BoAddGlobal := False;

  TreeView.Items.BeginUpdate;
  Try
    DControl := g_DWinMan.DWinList.Items[0];
    GlobalNode := TreeView.Items.AddChildObjectFirst(nil, 'ȫ�ִ���',TObject(DControl));
    RefWindowsListChild(GlobalNode, DControl);
    GlobalNode.Expand(False);
  Finally
    TreeView.Items.EndUpdate;
  End;

end;

procedure TfrmDlgConfig.RefWindowsListChild(TreeNode: TTreeNode;
  DControl: TDControl);
var
  I: Integer;
  TempTreeNode: TTreeNode;
  TempDControl: TDControl;
begin
  for I := 0 to DControl.DControls.Count - 1 do
  begin
    TempDControl := DControl.DControls.Items[I];
    TempTreeNode := TreeView.Items.AddChildObjectFirst(TreeNode,
      TempDControl.Caption + '(' + TempDControl.Name + ')',
      TObject(TempDControl));
    RefWindowsListChild(TempTreeNode, TempDControl);
  end;
end;

procedure TfrmDlgConfig.se1Change(Sender: TObject);
var
  Node: TTreeNode;
begin
//  Node := tv1.Selected;
//  if Node.Data <> nil then
//  begin
//    PByte(Node.Data)^ := Byte(se1.Value);
//  end;
end;

procedure TfrmDlgConfig.dxbrbtnSendToBackClick(Sender: TObject);
var
  I: Integer;
  D: TDControl;
begin
  if (DefDControl <> nil) and (DefDControl.DParent <> nil) then
  begin
    DefDControl.DParent.RemoveControl(DefDControl);
    DefDControl.DParent.AddControlFirst(DefDControl);
  end;
end;

procedure TfrmDlgConfig.tmr_CheckInsperObjectTimer(Sender: TObject);
begin
  if InspectorUI.InspectedObject is TDControl then
    InspectorUI.InspectedObject := TDControl(InspectorUI.InspectedObject).Propertites;
end;

procedure TfrmDlgConfig.tmr_SetCaptionTimer(Sender: TObject);
begin
  Caption := frmMain.Caption;
end;

procedure TfrmDlgConfig.tmr_SetClientToChildTimer(Sender: TObject);
var
  W,H:Integer;
begin
  tmr_SetClientToChild.Enabled := False;
  frmMain.Visible := True;
  W := frmMain.ClientWidth;
  H := frmMain.ClientHeight;

  frmMain.BorderStyle := bsNone;


  frmMain.ClientWidth := W;
  frmMain.ClientHeight := h;

  pnl_Client.ClientWidth := W;
  pnl_Client.ClientHeight := H;
  frmMain.Left := 0;
  frmMain.Top := 0;

  Self.Width := W + STDWIDTH + GetSystemMetrics(SM_CXFRAME);
  Self.Height := H + STDHEIGHT + GetSystemMetrics(SM_CXFRAME);
  Windows.SetParent(frmMain.Handle,pnl_Client.Handle);

  SetWindowPos(Self.handle,HWND_NOTOPMost,left,top,width,height,0);

  ClientSettingRtti.InspectedObject := g_ClientCustomSetting;
end;
procedure TfrmDlgConfig.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  if Node <> nil then
  begin
    DefDControl := Node.Data;
    InspectorUI.InspectedObject := DefDControl.Propertites;
    edt_ClassName.Text := g_DWinMan.GetControlDesc(DefDControl.ClassName);
    edt_ComponetName.Text := DefDControl.Name;
    edt_CaptionText.Text := DefDControl.Caption;

    DWinCtl.SeletedControl := DefDControl;
    InspectorUI.FullExpand;
  end;
end;

procedure TfrmDlgConfig.TreeViewCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (cdsSelected in State) or (cdsFocused in State) or
    (TreeView.Selected = Node) then
  begin
    TreeView.Canvas.Font.Color := clRed;
    TreeView.Canvas.Brush.Color := clYellow;
  end;
end;

procedure TfrmDlgConfig.TreeViewDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  Node, ANode: TTreeNode;
  Control, SourceControl: TDControl;
begin
  Node := TreeView.GetNodeAt(X, Y);
  if Node <> nil then
    Control := Node.Data;
  if (Control <> nil) and (TreeView.Selected <> nil) then
  begin
    SourceControl := TreeView.Selected.Data;
    if (SourceControl <> nil) and SourceControl.CanAddChildControl and
      (Control.DParent <> SourceControl)  and (SourceControl <> Control) then
    begin
      SourceControl.DParent.RemoveControl(SourceControl);
      Control.AddChild(SourceControl);
      SourceControl.DParent := Control;
      SourceControl.Parent := Control;

      ANode := TreeView.Selected;
      Node := TreeView.Items.AddChild(Node, ANode.Text);
      Node.Text := ANode.Text;
      Node.Data := ANode.Data;
      TreeView.Items.Delete(ANode);
	  RefWindowsListChild(Node,SourceControl);
      CopyContorl := nil;
    end else
    begin
      CopyContorl := nil;
    end;
  end;
end;

procedure TfrmDlgConfig.TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  Node, SourceNode: TTreeNode;
  Control, SourceControl: TDControl;
begin
  Accept := True;
  case State of
    dsDragEnter, dsDragMove:
      begin
        Node := TTreeView(Sender).GetNodeAt(X, Y);
        if Node <> nil then
          Control := Node.Data;

        SourceNode := TreeView.Selected;
        if SourceNode <> nil then
        begin
          SourceControl := SourceNode.Data;
          if SourceControl = FrmDlg.DBackground then
          begin
            Accept := False;
          end;
        end;

        if Accept and (SourceControl <> nil) and (Control <> nil) then
        begin
          if SourceControl.DParent = Control then
            Accept := False;
        end
        else
          Accept := False;
      end
  end;
end;

procedure TfrmDlgConfig.TreeViewEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  if Sender <> nil then
  begin

  end;
end;

procedure TfrmDlgConfig.tv1Change(Sender: TObject; Node: TTreeNode);
begin
//  if Node.Data <> nil then
//  begin
//    se1.Value := PByte(Node.Data)^;
//  end;
end;

function GetPropertyName(const S: String): string;
begin
  if g_BoChinese then
  begin
    PropertyNames.TryGetValue(S, Result);
    if Result = '' then
      Result := S;
  end
  else
  begin
    Result := S;
  end;
end;

function GetValueName(const S: String): string;
begin
  if g_BoChinese then
  begin
    ValueNames.TryGetValue(S, Result);
    if Result = '' then
      Result := S;
  end
  else
  begin
    Result := S;
  end;
end;

procedure AddValueName(const ValueName, Name: String);
begin
  ValueNames.Add(ValueName, Name);
  // ValueNames_Search.Add(Name,ValueName);
end;

procedure AddPropertyName(AttrName, Name: String);
var
  PInfo: PTypeInfo;
begin
  PInfo := nil;
  AttrTypeInfo.TryGetValue(AttrName, PInfo);
  if PInfo <> nil then
  begin
    case PInfo.Kind of
      tkInteger:
        cxOI.cxRegisterPropertyEditor(PInfo, TCustomDXPropertites, AttrName,
          TDXPropIntPropertyEditor);
      tkString, tkUString, tkLString, tkWString, tkWChar, tkChar:
        cxOI.cxRegisterPropertyEditor(PInfo, TCustomDXPropertites, AttrName,
          TDXPropStringPropertyEditor);
      tkEnumeration:
        cxOI.cxRegisterPropertyEditor(PInfo, TCustomDXPropertites, AttrName,
          TDXPropBoolPropertyEditor);
      tkSet:
        cxOI.cxRegisterPropertyEditor(PInfo, TCustomDXPropertites, AttrName,
          TDXSetsPropertyEditor);
      tkFloat:
        cxOI.cxRegisterPropertyEditor(PInfo, TCustomDXPropertites, AttrName,
          TDXPropFloatPropertyEditor);
    end;
    PropertyNames.Add(AttrName, Name);
  end;
end;

function GetEditorClass(PInfo: PTypeInfo; out PType: PTypeInfo)
  : TcxPropertyEditorClass;
begin
  Result := nil;
  PType := PInfo;
  if PInfo <> nil then
  begin
    case PInfo.Kind of
      tkInteger:
        begin
          if PInfo.Name = 'TColor' then
          begin
            PType := TypeInfo(TColor);

            if PType <> nil then
              Result := TcxColorProperty;
          end
          else
          begin
            Result := TDXPropIntPropertyEditor;
          end;
        end;
      tkString, tkUString, tkLString, tkWString, tkWChar, tkChar:
        Result := TDXPropStringPropertyEditor;
      tkEnumeration:
        Result := TDXPropBoolPropertyEditor;
      tkSet:
        Result := TDXSetsPropertyEditor;
      tkFloat:
      Result := TDXPropFloatPropertyEditor;
    end;
  end;
end;

procedure InitRttiName();
var
  ctx: TRttiContext;
  t: TRttiType;
  p: TRttiProperty;
  PType: PTypeInfo;
  F: TRttiField;
  S, SS: string;
  nIndex, I: Integer;
  Classes: TcxPropertyEditorClass;
begin
  t := ctx.GetType(TDX9GirdImagePropertites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDX9GirdImagePropertites,
        p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TCustomDXPropertites);
  for p in t.GetProperties do
  begin
    AttrTypeInfo.Add(p.Name, p.PropertyType.Handle);
  end;

  // ע�� String ������
  PropertyNames.Add('LibFile', '�ļ�����');
  PropertyNames.Add('Lib', 'ͼ���ļ�');
  AddPropertyName('FontName', '��������');
  AddPropertyName('FontSize', '�����С');
  AddPropertyName('Hint', '��ʾ����');

  // ע�� Interger ������
  PropertyNames.Add('Height', '�߶�');
  PropertyNames.Add('Left', 'X');
  PropertyNames.Add('Width', '���');
  PropertyNames.Add('Top', 'Y');

  AddPropertyName('RowCount', '�и�������');
  AddPropertyName('ColCount', '�и�������');
  AddPropertyName('GridWidth', '���ӿ��');
  AddPropertyName('GridHeight', '���Ӹ߶�');

  PropertyNames.Add('ImageIndex', 'ͼƬ���');
  PropertyNames.Add('DownedIndex', '�������');
  PropertyNames.Add('DisabledIndex', '��ֹ״̬');
  PropertyNames.Add('AniCount', '����ͼƬ����');
  PropertyNames.Add('AniInterval', 'ÿ֡���');
  PropertyNames.Add('AniLoop', 'ѭ������');
  PropertyNames.Add('OutLinePixel', '�������');
  PropertyNames.Add('CheckedIndex', 'ѡ��ͼ�����');
  PropertyNames.Add('MoveIndex', '��꾭��');

  // ע�� Boolean������
  AddPropertyName('ShowHint', '��ʾ��ʾ��Ϣ');
  AddPropertyName('Visible', '�ɼ�');
  AddPropertyName('MouseThrough', '��괩͸');
//  AddPropertyName('EngineResourceFirst','���ȶ�ȡ91��Դ');
  AddPropertyName('Floating', '����');
  AddPropertyName('AllowESC', 'ESC�رմ���');
  AddPropertyName('EnableFocus', '�����ȡ����');
  AddPropertyName('NotFront', '������ǰ��');
  AddPropertyName('AutoSize', '����Զ�����');
  AddPropertyName('Align', '���뷽ʽ');

  AddPropertyName('ClipType', '�ü���ʽ');
  AddPropertyName('DAnchors', '����');
  AddPropertyName('ClipOrientation', '�ü�����');

  AddPropertyName('Sound', '�������');
  AddPropertyName('FontStyle', '������');
  AddPropertyName('Caption', '����');
  AddPropertyName('IntoSceneShow', '���볡����ʾ');
  AddPropertyName('OutSceneHide', '�˳���������');
  AddPropertyName('Position', 'λ����Ϣ');
  AddPropertyName('ImageProperty', 'ͼƬ����');
  AddPropertyName('OwnerScene', '��������');
  AddPropertyName('OffsetX', 'Xƫ��');
  AddPropertyName('OffsetY', 'Yƫ��');
  AddPropertyName('UseImageOffset', 'ʹ����Դ�ļ�XYƫ��');
  AddPropertyName('DrawMode', '����ģʽ');
  AddPropertyName('InCenter', '��Ļ����');
  AddPropertyName('BorderPixel', '�߿�������');
  AddPropertyName('Abandon', '���δ����');
  AddPropertyName('DisableMouseEvent', '��ֹ�����Ϣ');
  AddPropertyName('QuteNumber','����ǧ�ֺ�');
  AddPropertyName('AnchorX','λ��ê��X');
  AddPropertyName('AnchorY','λ��ê��Y');
  AddPropertyName('AnchorPx','����ê��X');
  AddPropertyName('AnchorPy','����ê��Y');
  AddPropertyName('UseAnchorPosition','ʹ��ê��');
  AddPropertyName('ChatBoxStyle','����򱳾����');

  AddValueName('aLeft', '�����');
  AddValueName('aCenter', '����');
  AddValueName('aRight', '�Ҷ���');

  AddValueName('ctNone', '���ü�');
  AddValueName('ctHp', '����HP�ü�');
  AddValueName('ctMP', '����MP�ü�');
  AddValueName('ctExp', '���ݾ���ü�');
  AddValueName('ctWeight', '���ݸ��زü�');
  AddValueName('ctDynamicValue', '��̬�ü�ֵ');

  AddValueName('coBottom2Top', '��������');
  AddValueName('coTop2Bottom', '��������');
  AddValueName('coRight2Left', '��������');
  AddValueName('coLeftToRight', '��������');

  AddValueName('True', '��');
  AddValueName('False', '��');

  PropertyNames.Add('akLeft', '�������');
  PropertyNames.Add('akTop', '��������');
  PropertyNames.Add('akRight', '�����ұ�');
  PropertyNames.Add('akBottom', '�����ײ�');
  PropertyNames.Add('akVertCenter', '��ֱ�м�');
  PropertyNames.Add('akHoriCenter', 'ˮƽ�м�');

  PropertyNames.Add('Border', '�߿�');
  PropertyNames.Add('Color', '��ɫ');
  PropertyNames.Add('Text', '����');
  AddPropertyName('Alpha', '͸����');
  PropertyNames.Add('BorderColor', '�߿���ɫ');

  // AddPropertyName('Color','��ɫ');
  PropertyNames.Add('ActiveColor', '����������ɫ');
  // PropertyNames.Add('ActiveIndex','����ҳǩ���');

  PropertyNames.Add('SheetCount', 'ҳǩ����');
  PropertyNames.Add('TabDirection', 'ҳǩ����');
  PropertyNames.Add('TabImageIndex', 'ҳǩ��ӦͼƬ���');
  PropertyNames.Add('TabText', 'ҳǩ����');
  PropertyNames.Add('TabTextOffsetX', 'ҳǩ����ƫ��X');
  PropertyNames.Add('TabTextOffsetY', 'ҳǩ����ƫ��Y');

  PropertyNames.Add('ItemFileType', '��Ʒ��ʾ����');
  PropertyNames.Add('ItemGroupType', '��ƷԴλ��');
  PropertyNames.Add('ItemIndex', '��Ʒ��Ӧ�±�');

  PropertyNames.Add('ArcherFemaleIndex', '������Ůͼ');
  PropertyNames.Add('ArcherMaleIndex', '��������ͼ');
  PropertyNames.Add('FemaleIndex', 'Ů�Ե�ͼ');
  PropertyNames.Add('MaleIndex', '���Ե�ͼ');

  // ===========================================
  PropertyNames.Add('GridLeftTop', '����');
  PropertyNames.Add('GridTop', '��');
  PropertyNames.Add('GridRightTop', '����');

  PropertyNames.Add('GridLeft', '��');
  PropertyNames.Add('GridCenter', '��');
  PropertyNames.Add('GridRight', '��');

  PropertyNames.Add('GridLeftBottom', '����');
  PropertyNames.Add('GridBottom', '��');
  PropertyNames.Add('GridRightBottom', '����');
  PropertyNames.Add('FillColor', '�����ɫ');
  PropertyNames.Add('FillColorAlpha', '��ɫ͸��ֵ');

  AddValueName('cisNone', '��');
  AddValueName('cisLogin', '��¼����');
  AddValueName('cisSelChr', 'ѡ���ɫ');
  AddValueName('cisNotice', '��Ϸ����');
  AddValueName('cisPlayGame', '��Ϸ����');

  AddValueName('vbtChange', '�л�');
  AddValueName('vbtClose', '�ر�');
  AddValueName('vbtShow', '��ʾ');

  AddValueName('ttdVert', '��ֱ');
  AddValueName('ttdHorv', 'ˮƽ');

  AddValueName('dipStateItem', '����');
  AddValueName('dipBagItem', '����');

  AddValueName('igtCustomItem', '�Զ�����Ʒ');
  AddValueName('igtStoreItem', '�ֿ���Ʒ');
  AddValueName('igtUseItem', '������Ʒ');
  AddValueName('igtItemBag', '������Ʒ');

  AddValueName('csNone', '��');
  AddValueName('csStone', 'ʯͷ����');
  AddValueName('csGlass', '��������');
  AddValueName('csNorm', '�������');

  PropertyNames.Add('fsBold', '����');
  PropertyNames.Add('fsItalic', 'б��');
  PropertyNames.Add('fsUnderline', '�»���');
  PropertyNames.Add('fsStrikeOut', 'ɾ����');

  PropertyNames.Add('DrawOtherStateInfo', '�鿴����');

  PropertyNames.Add('CharYSpace', '��ֱ���ּ��');
  PropertyNames.Add('SelectdTextColor', 'ѡ��������ɫ');
  PropertyNames.Add('TextVert', '��ֱ�ı�');

  PropertyNames.Add('TabIndexOrder', 'ҳǩ�������');

  PropertyNames.Add('ButtonMode', 'ҳǩ��ťģʽ');
  PropertyNames.Add('CallFunction', '����QM��������');

  PropertyNames.Add('VarFlag', '��������');
  PropertyNames.Add('SelColor', 'ѡ����ɫ');
  PropertyNames.Add('BlurColor', 'ʧ����ɫ');
  PropertyNames.Add('BlurColorAlpha', 'ʧ����ɫ͸����');

  PropertyNames.Add('FontColor', '������ɫ');
  PropertyNames.Add('TextHint', '������ʾ');
  PropertyNames.Add('TextHintColor', '��ʾ��ɫ');

  PropertyNames.Add('Alignment', '���뷽ʽ');
  PropertyNames.Add('Tag', '���');
  PropertyNames.Add('ColumnWidth', '�п�');

  PropertyNames.Add('CaptionHeight', '����߶�');
  PropertyNames.Add('LineHeight','�и�');
  PropertyNames.Add('SelAlpha','ѡ��͸����');
  PropertyNames.Add('HotAlpha','����͸����');
  PropertyNames.Add('DrawRectLine','���Ʊ߿���');
  PropertyNames.Add('ItemCountOfPage','ÿҳ����');
  PropertyNames.Add('ItemTextCaption','�����ݷ��');
  PropertyNames.Add('ShowCaption','��ʾ����');
  PropertyNames.Add('RectLinePixel','�߿�������');

  PropertyNames.Add('SelectedTextColor','ѡ���ı���ɫ');
  PropertyNames.Add('HotColor','������ɫ');
  PropertyNames.Add('RectLineColor','������ɫ');
  PropertyNames.Add('CharCountAPage','ÿҳ��ɫ����');
  PropertyNames.Add('ChrOffsetType','��ɫ����ƫ������');
  PropertyNames.Add('NotSelectChrFreeze','δѡ�н�ɫʯ��');
  PropertyNames.Add('DrawChrEffect','���ƽ�ɫ��Ч');
  PropertyNames.Add('CreateChrActrion','������ɫ����');
  PropertyNames.Add('ChrUIOffsetType','��ɫ��UIƫ�Ʒ�ʽ');
  PropertyNames.Add('AllowDragSpot','��������λ��');
  PropertyNames.add('dsNone','Ԥ������');
  PropertyNames.add('dsCenter','�в��ƶ�');
  PropertyNames.add('dsLeft','���');
  PropertyNames.add('dsRight','�ұ�');
  PropertyNames.add('dsTop','����');
  PropertyNames.add('dsBottom','�ײ�');
  PropertyNames.add('dsLeftTop','���Ͻ�');
  PropertyNames.add('dsLeftBottom','���½�');
  PropertyNames.add('dsRightTop','���Ͻ�');
  PropertyNames.add('dsRightBottom','���½�');

  PropertyNames.Add('AutoAlignCenter','ͼ���Զ�ƫ�Ƶ��м�');
  PropertyNames.Add('DynamicClipValue','��̬�ü�ֵ');

  AddValueName('cofNone', '��');
  AddValueName('cofNewMir', '����Ѫ����');
  AddValueName('cofMir', '��Ѫ����');
  AddValueName('cofMirReturn', '�������');

  AddValueName('coaPosition', '����UIλ��');
  AddValueName('coaCenter', '������Ļ����');
  AddValueName('coaNone', '��');

  AddValueName('chaActionAlways', 'һֱ���Ŷ���');
  AddValueName('chaActionToNormal', '���Ŷ�������ͨ');
  AddValueName('chaNormal', '��ͨ����');
  AddValueName('cbFillBgColor', '��䱳��ɫ');
  AddValueName('cbAlpha', '͸����ʾ');

  PropertyNames.Add('BloodShowXOffset','Ѫ��ƫ��X');
  PropertyNames.Add('BloodShowYOffset','Ѫ��ƫ��Y');
  PropertyNames.Add('ActorNameShowXOffset','����ƫ��X');
  PropertyNames.Add('ActorNameShowYOffset','����ƫ��Y');

  t := ctx.GetType(TDXAniButtonPropertites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXAniButtonPropertites, p.Name, Classes);
    end;
  end;


  cxRegisterPropertyEditor(TypeInfo(TClipType), TCustomDXPropertites,
    'ClipType', TDXEnumPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TClipOrientation), TCustomDXPropertites,
    'ClipOrientation', TDXEnumPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TClipOrientation), TCustomDXPropertites,
    'FontStyle', TDXSetsPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TDXCaption), TCustomDXPropertites,
    'Caption', TDXClassPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TAlignment), TCustomDXPropertites, 'Align',
    TDXEnumPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TDAnchors), TCustomDXPropertites, 'Anchors',
    TDXSetsPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TDXImageProperty), TCustomDXPropertites,
    'ImageProperty', TDXClassPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TDXPosition), TCustomDXPropertites,
    'Position', TDXClassPropertyEditor);
  cxRegisterPropertyEditor(TypeInfo(TControlInScene), TCustomDXPropertites,
    'OwnerScene', TDXEnumPropertyEditor);
    cxRegisterPropertyEditor(TypeInfo(TAllowDragSpot), TCustomDXPropertites, 'AllowDragSpot',
    TDXSetsPropertyEditor);


  t := ctx.GetType(TDXCaption);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXCaption, p.Name, Classes);
    end;
  end;




  t := ctx.GetType(TDXAniImageProperty);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXAniImageProperty, p.Name,
        Classes);
    end;
  end;

  t := ctx.GetType(TDXImageProperty);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXImageProperty, p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TDXPosition);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXPosition, p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TStateWinProperties);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TStateWinProperties, p.Name,
        Classes);
    end;
  end;

  t := ctx.GetType(TDXTabPropertites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXTabPropertites, p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TDrawItemProperties);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDrawItemProperties, p.Name,
        Classes);
    end;
  end;

  t := ctx.GetType(TDXLabelPropertites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXLabelPropertites, p.Name,
        Classes);
    end;
  end;

  t := ctx.GetType(TDXScriptButtonPropertites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXScriptButtonPropertites,
        p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TDXEditProperties);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXEditProperties,
        p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TDXListViewProperites);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDXListViewProperites,
        p.Name, Classes);
    end;
  end;

  t := ctx.GetType(TDListColumn);
  for p in t.GetProperties do
  begin
    Classes := GetEditorClass(p.PropertyType.Handle, PType);
    if Classes <> nil then
    begin
      cxOI.cxRegisterPropertyEditor(PType, TDListColumn,
        p.Name, Classes);
    end;
  end;

  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXCaption, 'Color',
    TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXCaption, 'Border',
    TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXPanelPropertites, 'Color',
    TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXPanelPropertites,
    'BorderColor', TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXLabelPropertites,
    'SelectdTextColor', TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXPropertites, 'BorderColor',
    TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDX9GirdImagePropertites,
    'FillColor', TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDX9GirdImagePropertites,
    'BorderColor', TDXColorProperty);

  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
    'BorderColor', TDXColorProperty);
  cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
'SelColor', TDXColorProperty);
      cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
    'Color', TDXColorProperty);
          cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
    'BlurColor', TDXColorProperty);

              cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
    'TextHintColor', TDXColorProperty);
   cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXEditProperties,
    'FontColor', TDXColorProperty);
   cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXListViewProperites,
    'SelectedTextColor', TDXColorProperty);
      cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXListViewProperites,
    'HotColor', TDXColorProperty);
    cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXListViewProperites,
    'SelColor', TDXColorProperty);
       cxOI.cxRegisterPropertyEditor(TypeInfo(TColor), TDXListViewProperites,
    'RectLineColor', TDXColorProperty);

     cxRegisterPropertyEditor(TypeInfo(TDXCaption), TDXListViewProperites,
    'ItemTextCaption', TDXClassPropertyEditor);


         cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobWarriorIndex', TDXSelChrJobInfo);
    cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobWizardIndex', TDXSelChrJobInfo);
    cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobTaoistIndex', TDXSelChrJobInfo);
    cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobAssassinIndex', TDXSelChrJobInfo);
    cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobArcherIndex', TDXSelChrJobInfo);
        cxRegisterPropertyEditor(TypeInfo(TJobImageInfo), TDSelChrWinProperites,
    'JobMonkInde', TDXSelChrJobInfo);

    cxRegisterPropertyEditor(TypeInfo(String), TJobImageInfo,
    'Lib', TDXPropStringPropertyEditor);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'AniCount', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FemaleIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'AniTick', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleEffectIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FemaleEffectIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FreezeAniCount', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FreezeFrameTick', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleFreezeIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FemalFreezeIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'UnFreezeAniCount', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'UnFreezeFrameTick', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FemaleUnFreezeIndex', TDXPropIntJobImage);
    cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleUnFreezeIndex', TDXPropIntJobImage);

        cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleActionAniCount', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleActionFrameTick', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleActionIndex', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FeMaleActionAniCount', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FeMaleActionFrameTick', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FeMaleActionIndex', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'MaleActionEffectIndex', TDXPropIntJobImage);
       cxRegisterPropertyEditor(TypeInfo(Integer), TJobImageInfo,
    'FemaleActionEffectIndex', TDXPropIntJobImage);



    cxRegisterPropertyEditor(TypeInfo(Integer), TDSelChrWinProperites,
    'CharCountAPage', TDXPropIntPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Boolean), TDSelChrWinProperites,
    'NotSelectChrFreeze', TDXEnumPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Boolean), TDSelChrWinProperites,
    'DrawChrEffect', TDXEnumPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(TChrOffsetFix), TDSelChrWinProperites,
    'ChrOffsetType', TDXEnumPropertyEditor);

                cxRegisterPropertyEditor(TypeInfo(TCreateChrAction), TDSelChrWinProperites,
    'CreateChrActrion', TDXEnumPropertyEditor);

                cxRegisterPropertyEditor(TypeInfo(TChrUIOffsetType), TDSelChrWinProperites,
    'ChrUIOffsetType', TDXEnumPropertyEditor);

                    cxRegisterPropertyEditor(TypeInfo(TDChatBoxStyle), TDChatBoxProperites,
    'ChatBoxStyle', TDXEnumPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Integer), TClientCustomSetting,
    'BloodShowXOffset', TDXPropIntPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Integer), TClientCustomSetting,
    'BloodShowYOffset', TDXPropIntPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Integer), TClientCustomSetting,
    'ActorNameShowXOffset', TDXPropIntPropertyEditor);

    cxRegisterPropertyEditor(TypeInfo(Integer), TClientCustomSetting,
    'ActorNameShowYOffset', TDXPropIntPropertyEditor);


end;

{ TStringPropertyEditor }
function TDXPropStringPropertyEditor.GetName: String;
begin
  Result := GetPropertyName(GetPropInfo^.Name)
end;

{ TDXPropIntPropertyEditor }

function TDXPropIntPropertyEditor.GetName: string;
begin
  Result := GetPropertyName(GetPropInfo^.Name)
end;

function TDXPropIntPropertyEditor.GetValue: string;
var
  Value: string;
begin
  Value := inherited;
  Result := GetValueName(Value)
end;

{ TDXPropBoolPropertyEditor }

function TDXPropBoolPropertyEditor.GetName: string;
begin
  Result := GetPropertyName(GetPropInfo^.Name)
end;

function TDXPropBoolPropertyEditor.GetValue: string;
var
  Value: string;
begin
  Value := inherited;
  Result := GetValueName(Value)
end;

{ TDXEnumPropertyEditor }

function TDXEnumPropertyEditor.GetName: string;
begin
  Result := GetPropertyName(GetPropInfo^.Name)
end;

function TDXEnumPropertyEditor.GetValue: string;
var
  Name: string;
  L: LongInt;
begin
  L := GetOrdValue;
  with GetTypeData(GetPropType)^ do
  begin
    if (L < MinValue) or (L > MaxValue) then
      L := MaxValue;
    Name := TypInfo.GetEnumName(GetPropType, L);
    Result := GetValueName(Name);
  end;
end;

{ TDXSetsPropertyEditor }

function TDXSetsPropertyEditor.GetName: string;
var
  Name: string;
  L: LongInt;
begin
  Name := inherited;
  Result := GetPropertyName(Name);
end;

procedure TDXSetsPropertyEditor.GetProperties(AOwner: TComponent;
  Proc: TcxGetPropEditProc);
var
  I: Integer;
begin
  with GetTypeData(GetTypeData(GetPropType)^.CompType^)^ do
  begin
    for I := MinValue to MaxValue do
      Proc(TDXSetsElement.Create(PropList, 1 { PropCount TODO } , I));
  end;
end;

function TDXSetsPropertyEditor.GetValue: string;
var
  Name: string;
  L: LongInt;
begin
  L := GetOrdValue;
  with GetTypeData(GetPropType)^ do
  begin
    if (L < MinValue) or (L > MaxValue) then
      L := MaxValue;
    Name := TypInfo.GetSetProp(GetComponent(0), GetPropInfo);
    Result := GetValueName(Name);
  end;
end;

{ TDXClassPropertyEditor }

function TDXClassPropertyEditor.GetName: string;
begin
  Result := GetPropertyName(GetPropInfo^.Name)
end;

function TDXClassPropertyEditor.GetValue: string;
begin
  Result := '����';
end;

{ TDXSetsElement }

function TDXSetsElement.GetName: string;
var
  S: string;
begin
  S := inherited;
  Result := GetPropertyName(S);
end;

// ���Ӳ���ʾ������
procedure AddFilterPropertyName();
begin

  FilterPropertyList.Add('Right', False);
  FilterPropertyList.Add('Bottom', False);

  // �������Ҫ�������ĵ�һ��Ҫ����Ӣ�ʵĶ����Ϸ��� ��Ӧ���ֻ��޷�����

  FilterPropertyList.Add('Left', False);
  FilterPropertyList.Add('X', False);

  FilterPropertyList.Add('Top', False);
  FilterPropertyList.Add('Y', False);

  FilterPropertyList.Add('Width', False);
  FilterPropertyList.Add('���', False);

  FilterPropertyList.Add('Height', False);
  FilterPropertyList.Add('�߶�', False);

  FilterPropertyList.Add('Lib', False);

  FilterPropertyList.Add('ImageIndex', False);
  FilterPropertyList.Add('ͼƬ���', False);

  FilterPropertyList.Add('AniCount', False);
  FilterPropertyList.Add('����ͼƬ����', False);

  FilterPropertyList.Add('AniInterval', False);
  FilterPropertyList.Add('ÿ֡���', False);

  FilterPropertyList.Add('DisabledIndex', False);
  FilterPropertyList.Add('��ֹ״̬', False);

  FilterPropertyList.Add('DownedIndex', False);
  FilterPropertyList.Add('�������', False);

  FilterPropertyList.Add('MoveIndex', False);
  FilterPropertyList.Add('��꾭��', False);

  FilterPropertyList.Add('AniLoop', False);
  FilterPropertyList.Add('ѭ������', False);

  FilterPropertyList.Add('ActiveIndex', False);

end;

function TDXPropStringPropertyEditor.GetValue: string;
var
  Value: string;
begin
  Value := inherited;
  Result := GetValueName(Value)
end;

{ TDXColorProperty }
function TDXColorProperty.GetName: string;
var
  S: string;
begin
  S := inherited;
  Result := GetPropertyName(S);
end;

{ TDXPropFloatPropertyEditor }

function TDXPropFloatPropertyEditor.GetName: string;
var
  S: string;
begin
  S := inherited;
  Result := GetPropertyName(S);
end;


{ TDXSelChrJobInfo }

function TDXSelChrJobInfo.GetName: string;
var
  Name:string;
begin
  Name := inherited;
  if Name = 'JobWarriorIndex' then
  begin
    Result := 'սʿְҵ����';
    Exit;
  end else if Name = 'JobWizardIndex' then
  begin
    Result := '��ʦְҵ����';
    Exit;
  end else if Name = 'JobTaoistIndex' then
  begin
    Result := '��ʿְҵ����';
    Exit;
  end else if Name = 'JobAssassinIndex' then
  begin
    Result := '�̿�ְҵ����';
    Exit;
  end else if Name = 'JobArcherIndex' then
  begin
    Result := '������ְҵ����';
    Exit;
  end else if Name = 'JobMonkInde' then
  begin
    Result := '��ɮְҵ����';
    Exit;
  end;
end;

function TDXSelChrJobInfo.GetValue: string;
begin
  Result := '����'
end;


{ TDXPropIntJobImage }

function TDXPropIntJobImage.GetName: string;
var
  Name : string;
begin
  Name := inherited;
  if Name = 'AniCount' then
  begin
    Result := '��ɫ����ͼƬ����';
    Exit;
  end else if Name = 'MaleIndex' then
  begin
    Result := '���Խ�ɫ���';
    Exit;
  end else if Name = 'FemaleIndex' then
  begin
    Result := 'Ů�Խ�ɫ���';
    Exit;
  end else if Name = 'AniTick' then
  begin
    Result := '�������(����)';
    Exit;
  end else if Name = 'MaleEffectIndex' then
  begin
    Result := '���Խ�ɫ��Ч���';
    Exit;
  end else if Name = 'FemaleEffectIndex' then
  begin
    Result := 'Ů�Խ�ɫ��Ч���';
    Exit;
  end else if Name = 'FreezeAniCount' then
  begin
    Result := '����ͼƬ����';
    Exit;
  end else if Name = 'FreezeFrameTick' then
  begin
    Result := '���ᶯ�����(����)';
    Exit;
  end else if Name = 'MaleFreezeIndex' then
  begin
    Result := '���Զ��ᶯ�����';
    Exit;
  end else if Name = 'FemalFreezeIndex' then
  begin
    Result := 'Ů�Զ��ᶯ�����';
    Exit;
  end else if Name = 'UnFreezeAniCount' then
  begin
    Result := '�ⶳ����ͼƬ����';
    Exit;
  end else if Name = 'UnFreezeFrameTick' then
  begin
    Result := '�ⶳ����ͼƬ���(����)';
    Exit;
  end else if Name = 'FemaleUnFreezeIndex' then
  begin
    Result := 'Ů�ԽⶳͼƬ���';
    exit;
  end else if Name = 'MaleUnFreezeIndex' then
  begin
    Result := '���ԽⶳͼƬ���';
    Exit;
  end else if Name = 'MaleActionAniCount' then
  begin
    Result := '����װ�ƶ���ͼƬ����';
    Exit;
  end else if Name = 'MaleActionFrameTick' then
  begin
    Result := '����װ�ƶ���ͼƬ���(����)';
    Exit;
  end else if Name = 'MaleActionIndex' then
  begin
    Result := '����װ�ƶ���ͼƬ���';
    Exit;
  end else if Name = 'FeMaleActionAniCount' then
  begin
    Result := 'Ů��װ�ƶ���ͼƬ����';
    Exit;
  end else if Name = 'FeMaleActionFrameTick' then
  begin
    Result := 'Ů��װ�ƶ���ͼƬ���(����)';
    Exit;
  end else if Name = 'FeMaleActionIndex' then
  begin
    Result := 'Ů�Զ���װ�ƶ������';
    Exit;
  end else if Name = 'MaleActionEffectIndex' then
  begin
    Result := '����װ�ƶ�����Ч���';
    Exit;
  end else if Name = 'FemaleActionEffectIndex' then
  begin
    Result := 'Ů��װ�ƶ�����Ч���';
  end;
end;

function TDXPropIntJobImage.GetValue: string;
begin
  Result := inherited;
end;

initialization

PropertyNames := TDictionary<String, String>.Create;
ValueNames := TDictionary<String, String>.Create;
AttrTypeInfo := TDictionary<String, PTypeInfo>.Create;
ValueNames_Search := TDictionary<String, String>.Create;
FilterPropertyList := TDictionary<String, Boolean>.Create;

InitRttiName();
AddFilterPropertyName();

finalization

PropertyNames.Free;
ValueNames.Free;
AttrTypeInfo.Free;
ValueNames_Search.Free;
FilterPropertyList.Free;

end.
