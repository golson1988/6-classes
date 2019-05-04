unit ClientCC;
// �ͻ��˷������Ԫ
interface
uses Grobal2,Common,uTypes,SystemCC,SkillInfo,SysUtils;
function ClientOperate(var Msg: TDefaultMessage; const body: PPlatfromString;
  const Buf: Pointer; nLen: Integer):Boolean;

implementation
uses Share,MShare,PlayScn,Actor,ClMain,ClFunc,Windows,SkillEffectConfig,magiceff,SoundUtil;
//����ϵͳ ��Ч������Ϣ
function SkillSystemOperate(var Msg: TDefaultMessage; const body: PPlatfromString;
  const Buf: Pointer; nLen: Integer):Boolean;
var
  IdentID:Byte;
  Actor,Target:TActor;
  nX,nY:Integer;
  btDir:Byte;
  Effect: TSkillEffectConfig;
  EffectPos:TEffectOnPosition;
  FallowActionEff:TFallowActionEffect;
  FlyEff :TFlyEffect;
  PlayAnimateEff:TPlayAnimationEffect;

  nFlySpeed:Integer;
  fFlySpeed:Single;
  EffectID,EffectTarget:Word;
  CDGroup:Byte;
  NowTick:Cardinal;
  I,MagID:Integer;
begin
  Result := True;
  IdentID := WIDENT(Msg.Ident);
  case IdentID of
    SKILL_SM_Spell:
    begin
      // �ڳ������ҵ������ɫ��
      Actor := PlayScene.FindActor(Msg.Recog);
      if Actor <> nil then
      begin
        btDir := Msg.Param;
        Actor.SendMsg(SM_OtherActorSkillSpell,Actor.m_nCurrX,Actor.m_nCurrY,btDir,Msg.Tag,Msg.Series,0,0,'',0,0,0);
      end;
    end;
    SKILL_SM_ActionEffectSound:
    begin
      //
      PlayScene.AddDelaySound(msg.Param,0);
    end;
    SKILL_SM_SKILLCOOLTIME:
    begin
      CDGroup := Msg.Param;

      NowTick := GetTickCount;
      MagID := Msg.Recog;
      if CDGroup > 0 then
      begin
        for I := 0 to g_MagicList.Count - 1 do
        begin
          if PTClientMagic(g_MagicList[I]).btCDGroup = CDGroup then
          begin
            PTClientMagic(g_MagicList[I]).UseTime := NowTick;
          end;
        end;
      end else
      begin
        for I := 0 to g_MagicList.Count - 1 do
        begin
          if PTClientMagic(g_MagicList[I]).wMagicId = MagID then
          begin
            PTClientMagic(g_MagicList[I]).UseTime := NowTick;
            Break;
          end;
        end;
      end;


    end;
    SKILL_SM_ActionEffect:
    begin
      //�ҵ�ʩ���ˡ�
      Actor := PlayScene.FindActor(Msg.Recog);
     /// Writeln('SKILL_SM_ActionEffect:' + IntToStr(GetTickCount));
      if Actor <> nil then
      begin
        EffectID := LoWord(Msg.Tag);
        EffectTarget := HiWord(Msg.Tag);
        Effect := g_SkillEffectData.FindEffectConfigByID(EffectID);
        if Effect <> nil then
        begin
          //�ҵ��ܻ���
          Target := PlayScene.FindActor(Msg.Param);
          EffectPos := TEffectOnPosition(EffectTarget);
          nFlySpeed := Msg.Series;
          fFlySpeed := PSingle(@nFlySpeed)^;
          if Target <> nil then
          begin
            Target.AddSkillEffect(Actor,EffectID,0,0,0,fFlySpeed,EffectPos = efOnScene);
          end;
        end;
      end;

      //Session����ЧID  Token����Ч�ӳ١�
    end else
    begin

    end;

  end;
end;


function BuffSystemOperate(var Msg: TDefaultMessage; const body: PPlatfromString;
  const Buf: Pointer; nLen: Integer):Boolean;
var
  IdentID:Byte;
begin
  IdentID := WIDENT(Msg.Ident);

end;


function ClientOperate(var Msg: TDefaultMessage; const body: PPlatfromString;
  const Buf: Pointer; nLen: Integer):Boolean;
var
  SystemID:Byte;
begin
  SystemID := WSYSTEM(Msg.Ident);

  case SystemID of
    SYSTEM_CODE_SKILL:
    begin
      Result := SkillSystemOperate(Msg,body,Buf,nLen);
    end;
    SYSTEM_CODE_BUFF:
    begin
      Result := BuffSystemOperate(Msg,body,Buf,nLen);
    end;
  end;
end;
end.
