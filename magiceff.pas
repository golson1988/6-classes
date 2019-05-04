unit magiceff;

interface

uses
  Windows, Grobal2, CliUtil, ClFunc, HUtil32, WIl, SysUtils, AbstractCanvas,
  AbstractTextures, DXHelper, Math,Generics.Collections,Classes;

const
  FLYBASE = 10;
  EXPLOSIONBASE = 170;
  FLYOMAAXEBASE = 447;
  THORNBASE = 2967;
  ARCHERBASE = 2607;
  ARCHERBASE2 = 272; // 2609;
  FIREGUNFRAME = 6;

  MAXEFFECT = 214; // ���Ч��ħ��Ч��ͼ�� 20071028  update

  { EffectBase�ࣺ�����Ӧħ��Ч��IDX��ֵ��ӦWIL�ļ� ͼƬ����ֵ }
  EffectBase: array [0 .. MAXEFFECT - 1] of integer = (0, { 0 }
    0, { 1 }
    200, { 2 }
    400, { 3 }
    600, { 4 }
    0, { 5 }
    900, { 6 }
    920, { 7 }
    940, { 8 }
    20, { 9 }
    940, { 10 }
    940, { 11 }
    940, { 12 }
    0, { 13 }
    1380, { 14 }
    1500, { 15 }
    1520, { 16 }
    940, { 17 }
    1560, { 18 }
    1590, { 19 }
    1620, { 20 }
    1650, { 21 }
    1680, { 22 }
    0, { 23 }
    0, { 24 }
    0, { 25 }
    3960, { 26 }
    1790, { 27 }
    0, { 28 }
    3880, { 29 }
    3920, { 30 }
    3840, { 31 }
    0, { 32 }
    40, { 33 }
    130, { 34 }
    160, { 35 }
    190, { 36 }
    0, { 37 }
    210, { 38 }
    400, { 39 }
    600, { 40 }
    1260, { 41 } // �ٻ�����
    // 650,{42}
    0, { 42 } // ������ 20080415
    710, { 43 }
    740, { 44 }
    910, { 45 }
    940, { 46 }
    990, { 47 }
    1040, { 48 }
    1110, { 49 }
    0, { 50 }
    630, { 51 } // ���ǻ��� 20080510
    710, { 52 }  // �ļ�ħ����
    0, { 53 }
    0, { 54 }
    0, { 55 }
    0, { 56 }
    0, { 57 }
    0, { 58 }
    0, { 59 }
    10, { 60 }    // �ƻ�ն
    440, { 61 }  // ����ն
    270, { 62 }  // ����һ��
    610, { 63 }  // �ɻ�����
    210, { 64 }  // ĩ������
    540, { 65 }   // ��������
    690, { 66 }
    0, { 67 }
    0, { 68 }
    0, { 69 }
    0, { 70 }
    0, { 71 }
    0, { 72 }
    0, { 73 }
    1040, { 74 }
    0, { 75 }
    0, { 76 }
    50, { 77 }
    0, { 78 }
    0, { 79 }
    240, { 80 �ļ����ǻ��� }
    0, { 81 }
    0, { 82 }
    0, { 83 }
    0, { 84 }
    0, { 85 }
    0, { 86 }
    0, { 87 }
    0, { 88 }
    0, { 89 }
    0, { 90 }
    790, { 91 } // �������
    0, { 92 }
    0, { 93 }
    0, { 94 }
    0, { 95 }
    0, { 96 }
    0, { 97 }
    0, { 98 }
    0, { 99 }
    120, { 100 } // 4������� 20080111
    80, { 101 }  // 4������� 20080111
    0, { 102 }
    1040, { 103 } // ˫����
    1200, { 104 } // ��Х��
    0, { 105 }
    650, { 106 }  // �����
    1440, { 107 } // ������
    0, { 108 }
    4210, { 109 }  // ���ױ�  ���������� 1360
    1600, { 110 } // ������
    0, { 111 }
    800, { 112 }  // ����ѩ��
    1760, { 113 } // �򽣹���
    0, 0, 0, 0, 0, 0, 0 { 120 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 130 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 140 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 150 } ,
    90 { ������ } , 230 { ������� } , 250 { ��ɽ���� } , 1180 { �����·� } , 1200 { ��ħ���� } , 13473 { ����뷢 } , 640 { �׹�֮�� } , 0, 640 { Ǳ�� } , 0 { 160 } , 0, 1430 { ������ } ,
    1110 { ������ } , 1390 { ���鲽 } , 0, 1580 { �������� } , 0, 1330 { ������� } , 0, 0 { 170 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 180 } , 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0 { 190 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 200 } , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 { 210 } , 0, 0, 0);

  MAXHITEFFECT = 118; // ���Ч������Ч��ͼ��
  // ʵ�幥��    ���� ��ʿ�������һ𣬰���
  HitEffectBase: array [0 .. MAXHITEFFECT - 1] of integer = (0, { 0 }
    800, { 1 } // ��ɱ
    1410, { 2 } // ��ɱ
    1700, { 3 } // ����
    3480, { 4 } // �һ�
    // 510,
    3390, { 5 } //
    40, { 6 } // ����
    470, { 220 } { 7 } // ����ն�ػ�
    740, { 8 } //
    0, { 9 } // 4���һ� 20080112
    630, { 0 } // ����ն��� 2008.02.12
    510, { 11 } // ���ս��� 20080511
    310, { 12 } // ����һ�� սʿЧ��
    160, { 13 } // ����ɱ
    80, { 14 } // ׷�Ĵ�
    320, { 15 } // ����ն
    560, { 16 } // ��ɨǧ��
    1211, { 17 } // ��������
    140, { 18�ļ���ɱ }
    310 { 19Բ���䵶 } , 0 { 20 } , 0, { 21 } 0, { 22 } 0, { 23 } 0, { 24 } 0, { 25 } 0, { 26 } 0, { 27 } 0, { 28 } 0, { 29 } 0, { 30 } 0, { 31 } 0, { 32 } 0,
    { 33 } 0, { 34 } 0, { 35 } 0, { 36 } 0, { 37 } 0, { 38 } 0, { 39 } 0, { 40 } 0, { 41 } 0, { 42 }
    0, { 43 } 0, { 44 } 0, { 45 } 0, { 46 } 0, { 47 } 0, { 48 } 0,
    //
    1010 { �̿�˪�� } , 0 { 51 } , 1430{�̿�������}, 1580{�̿ͻ���}, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  MAXMAGICTYPE = 20;

type
  TMagicType = (mtReady { ׼�� } , mtFly { �� } , mtExplosion { ���� } , mtFlyAxe { �ɸ� } , mtFireWind { ��� } , mtFireGun { ���� } , mtLightingThunder { ������ } ,
    mtThunder { ��1 } , mtExploBujauk, mtBujaukGroundEffect, mtKyulKai, mtFlyArrow { ��ʸ } , mt12, mt13 { ����ħ�� } , mt14, mt15, mt16, mtRedThunder { ��ɫ�׵� } ,
    mtLava { �ҽ� } , mtAssassin { �̿� }
    );

  TUseMagicInfo = record
    ServerMagicCode: integer;
    nMagicId: integer;
    Target: integer; // recogcode
    EffectType: TMagicType;
    EffectNumber: integer;
    TargX: integer;
    TargY: integer;
    Recusion: Boolean;
    AniTime: integer;
    Level: Byte;
    Strengthen: Byte;
    Tag: Integer; //���̶�ʶ��
  end;
  PTUseMagicInfo = ^TUseMagicInfo;

  TMagicEff = class
    m_boActive: Boolean;  //�Ƿ񼤻��б�ʾ��Ч�Ƿ��ڹ���
    m_nServerMagicId: integer; //��ʾ������������Ƿ����ظ���Ч
    MagOwner: TObject;    //˭�ų�������Ч��
    TargetActor: TObject; //��Ч����
    ImgLib: TWMImages; //��Чͼ���ļ�
    EffectBase: integer; //ͼ����� �൱��ImageIndex
    MagExplosionBase: integer;   //���Ŷ�������Ч ImageIndex
    //============���м������λ��Ҫ�õ�==============
    px, py: integer;
    RX, RY: integer;
    Dir16, OldDir16: byte;
    TargetX, TargetY: integer; //Ŀ���X  Ŀ���Y
    TargetRx, TargetRy: integer;
    FlyX, FlyY, OldFlyX, OldFlyY: integer;
    FlyXf, FlyYf: Real;
    Repetition: Boolean; //���ڶ�����������Ч �Ƿ��ظ���
    FixedEffect: Boolean;  //�̶���Ч λ�ò���� ͨ��Ϊ false ��ʾ�Ƿ�����Ч ������FixedEffect := True;
    MagicType: integer;
    ExplosionFrame: integer;     //��ը��Ч�� ImageIndex (���� + ��ը ����)
    NextFrameTime: integer;     //ÿ֡�����
    Light: integer;             //����
    bt80: byte;
    bt81: byte;
    start: integer;          //�����EffectBase ������һ�����ظ�
    curframe: integer;      //��ǰ֡���
    frame: integer;        // ֡��ͼƬ����
    steptime: longword;   //�ϴθ���֡��ʱ��
    FDrawBlendMode:Byte; //����ģʽ
  private
    m_dwFrameTime: longword;
    m_dwStartTime: longword;
    fireX, fireY: integer;
    FXStep, FYStep: Real;
    FireMyselfX, FireMyselfY: integer;
    prevdisx, prevdisy: integer;
    FSounded: Boolean;
  protected
    procedure PlaySound; virtual;
  public
    m_dwStartWorkTick:LongWord; //��ʼ��tick �������ӳ���Ч
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    destructor Destroy; override;
    function Run: Boolean; virtual;
    function Shift: Boolean; virtual;
    procedure DrawEff(surface: TAsphyreCanvas); virtual;
    function IsWaiting():Boolean; //�Ƿ��ڵȴ�����
  end;

  TFlyingAxe = class(TMagicEff)
    FlyImageBase: integer;
    ReadyFrame: integer;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer); virtual;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TBatterMagicEff = class(TMagicEff) // �������Ըı����������ַ��λ�� 20091208 �����
    BatterImageBase: integer;
    skipNum: integer;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TBatterSanyanEff = class(TBatterMagicEff)
    n01: integer;
    n02: integer;
    m_nfX, m_nfY: integer;
    m_BoFirst: Boolean;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  THuXiaoMagicEff = class(TBatterMagicEff) // ��Х�� 8������ 20091208 �����
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TJingLeiMagicEff = class(TBatterMagicEff) // ���ױ� 20091208 �����
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFlyingBug = class(TMagicEff) // Size 0xD0
    FlyImageBase: integer; // 0xC8
    ReadyFrame: integer; // 0xCC
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFlyingArrow = class(TFlyingAxe)
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer); override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TAcherFlyArrow = class(TFlyingAxe)
  public
    boBlend: Boolean;
    boTail: Boolean;
    nTailStart, nTailLen: integer;
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer); override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TAcherFlyArrow151 = class(TFlyingAxe)
  public
    boBlend: Boolean;
    HitLib: TWMImages;
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer); override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFlyingFireBall = class(TFlyingAxe) // 0xD0
  public
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TCharEffect = class(TMagicEff)
  public
    constructor Create(effbase, effframe: integer; Target: TObject);
    function Run: Boolean; override; // false:������.
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TMapEffect = class(TMagicEff)
  public
    RepeatCount: integer;
    constructor Create(effbase, effframe: integer; x, y: integer);
    function Run: Boolean; override; // false:������.
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TScrollHideEffect = class(TMapEffect)
  public
    constructor Create(effbase, effframe: integer; x, y: integer; Target: TObject);
    function Run: Boolean; override;
  end;

  TLightingEffect = class(TMagicEff)
  public
    constructor Create(effbase, effframe: integer; x, y: integer);
    function Run: Boolean; override;
  end;

  TFireNode = record
    x: integer;
    y: integer;
    firenumber: integer;
  end;

  TFireGunEffect = class(TMagicEff)
  public
    OutofOil: Boolean;
    firetime: longword;
    FireNodes: array [0 .. FIREGUNFRAME - 1] of TFireNode;
    constructor Create(effbase, sx, sy, tx, ty: integer);
    function Run: Boolean; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  { ****************************************************************************** }
  // ������
  TfenshenThunder = class(TMagicEff)
  private
    dir: integer;
  public
    constructor Create(effbase, sx, sy, tx, ty: integer; aowner: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;
  { ****************************************************************************** }

  TThuderEffect = class(TMagicEff)
  public
    constructor Create(effbase, tx, ty: integer; Target: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TLightingThunder = class(TMagicEff)
  public
    constructor Create(effbase, sx, sy, tx, ty: integer; Target: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TPHHitEffect = class(TMagicEff) // �ƻ�ն��  20080226
  public
    constructor Create(effbase, sx, sy, tx, ty: integer; aowner: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TExploBujaukEffect = class(TMagicEff)
  public
    m_boDrawShadow: Boolean;
    constructor Create(effbase, sx, sy, tx, ty: integer; Target: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TBujaukGroundEffect = class(TMagicEff) // Size  0xD0
  public
    MagicNumber: integer; // 0xC8
    BoGroundEffect: Boolean;
    StrengthenLib: TWMImages;
    constructor Create(effbase, magicnumb, sx, sy, tx, ty: integer);
    function Run: Boolean; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TNormalDrawEffect = class(TMagicEff) // Size 0xCC
    boDrawBlend: Boolean;
  public
    constructor Create(XX, YY: integer; WmImage: TWMImages; effbase, nX: integer; frmTime: longword; boFlag: Boolean);
    function Run: Boolean; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TRedThunderEffect = class(TMagicEff)
    n0: integer;
  public
    constructor Create(effbase, tx, ty: integer; Target: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TLavaEffect = class(TMagicEff)
  public
    constructor Create(effbase, tx, ty: integer; Target: TObject; nframe: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFairyEffect = class(TMagicEff) // �����ػ�
  public
    constructor Create(effbase, tx, ty: integer; Target: TObject);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TObjectEffects = class(TMagicEff)
    ObjectID: TObject;
    boDrawBlend: Boolean;
  public
    constructor Create(ObjectiD2: TObject; WmImage: TWMImages; effbase, nX: integer; frmTime: longword; boFlag: Boolean);
    function Run: Boolean; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFireDragonEffect = class(TMagicEff)
    FlyX1, FlyY1, FlyX2, FlyY2: integer;
    boflyFixedEffect: Boolean;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  TFireFixedEffect = class(TMagicEff)
    FlyX1, FlyY1, FlyX2, FlyY2: integer;
    boflyFixedEffect: Boolean;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

  //���ݹ�������ÿ֡���е� ����
  TFallowActionEffect = class(TMagicEff)
  private
    FSkipPerDir:Integer;
    FEffectStart:Boolean;
  public
    FBindAction:Integer;
    constructor Create(Actor: TObject; Lib: TWMImages;ImageIndex,FrameCount, SkipDir: Integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
    function Shift: Boolean; override;
    function Run: Boolean; override;
  end;

  //���е���Ч����
  TFlyEffect = class(TMagicEff)
    SkipFramePerDir:Integer; //ÿ������������֡��
    CalcOffset:Boolean;
    FlySpeed:Single;
    procedure SetFlySpeed(Value:Single);
    constructor Create(SourceObject,TargetObject:TObject;Lib:TWMImages;ImageIndex:Integer;FrameTime:Cardinal;FrameCount:Integer);
    procedure DrawEff(surface: TAsphyreCanvas); override;
    function Shift():Boolean;override;
  private
    IsCrashed:Boolean;
    FFlyDistance:Double;
    FFlyTime:Cardinal;
    FFlyStartTime:Cardinal;
  end;

  //������Ч���͡�
  TPlayAnimationEffect = class(TObjectEffects)
  private
    FFrameTimeList:TList<Integer>;
    FBoAddToScene:Boolean;
  public
    EventDraw:Boolean;
    constructor Create(Actor:TObject;Lib:TWMImages;ImageIndex,FrameCount:Integer;FrameTime:Cardinal);
    procedure SetIsSceneEffect();
    destructor Destroy; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
    procedure SetFrameTime(const S:String);
   function Shift():Boolean;override;

  end;

  TCustomMagicEffect = class(TMagicEff)
  protected
    procedure PlaySound; override;
  public
    HitSound: String;
    HitSoundFrame: Integer;
    RunLib,
    HitLib: TWMImages;
    RunFrameCount: Integer;
    RunFrameTime: Integer;
    HitFrameTime: Integer;
    function Shift: Boolean; override;
    procedure DrawEff(surface: TAsphyreCanvas); override;
  end;

procedure GetEffectBase(mag, magStrengthen, mTag, mtype: integer; var wimg: TWMImages; var idx: integer);
procedure GetHitEffect(AMagicID, magStrengthen, mTag: Integer; var wimg: TWMImages; var idx: integer);
procedure PlayHitMagicSound(AMagicID, AStrengthen, AFrame, ASex, AWeponSound: Integer; var NotHandled: Boolean);

implementation

uses
  ClMain, Actor, SoundUtil, uMagicMgr, MShare,MMSystem;

{ ------------------------------------------------------------------------------ }
// ȡ��ħ��Ч������ͼ��(20071028)
// ������mag--���������ݱ��е�Effect�ֶ�(ħ��Ч��)��������ն�˴�Ϊ61-1
// mtype--��ʵ����˼�Ĳ������˴� ȡֵ
// wimg--TWMImages�࣬��ͼƬ��ʾ�ĵط�
// idx---�ڶ�Ӧ��WIL�ļ� �ͼƬ������λ��
//
// ***{EffectBase�ࣺ�����ӦIDX��ֵ��ӦWIL�ļ� ͼƬ����ֵ}***  ���� idx := EffectBase[mag];
{ ------------------------------------------------------------------------------ }
procedure GetEffectBase(mag, magStrengthen, mTag, mtype: integer; var wimg: TWMImages; var idx: integer);
begin
  wimg := nil;
  idx := 0;
  case mtype of
    0: // ħ��Ч��
    begin
      if mag in [0 .. MAXEFFECT - 1] then
        idx := EffectBase[mag];
      case mag of
        60, 61, 62, 63, 64, 65:
          wimg := g_WMagic4Images; // Ӣ�ۺϻ�-����ն,����һ��,�ɻ�����,ĩ������,��������
        75:
          wimg := g_WMagic7Images;
        9, 28, 34 .. 36, 38 .. 40, 44 .. 49, 76 { �ٻ�ʥ�� } , 74 { �ļ���Ѫ�� } :
          wimg := g_WMagic2Images;
        32:
          wimg := g_WMonImagesArr[20];
        37:
          wimg := g_WMonImagesArr[21];
        41:
          wimg := g_WMonImagesArr[17];
        42:
          wimg := g_WMagic5Images;
        43:
          wimg := g_WMagic2Images;
        51, 52:
          wimg := g_WMagic6Images;
        66:
          wimg := g_WMain2Images; // ��������
        77:
          wimg := g_WMagic7Images;
        80:
          wimg := g_WMagic7Images;
        81 .. 83:
          begin
            wimg := g_WDragonImages;
            case mag of
              81:
                begin
                  if g_Myself.m_nCurrX >= 84 then
                    idx := 130
                  else
                    idx := 140;
                end;
              82:
                begin
                  if (g_Myself.m_nCurrX >= 78) and (g_Myself.m_nCurrY >= 48) then
                    idx := 150
                  else
                    idx := 160;
                end;
              83:
                idx := 180;
            end;
          end;
        90:
          begin
            wimg := g_WDragonImages;
            idx := 350;
          end;
        91:
          wimg := g_WMagic5Images;
        100:
          wimg := g_WMagic6Images;
        101:
          wimg := g_WMagic6Images;
        103 .. 114:
          wimg := g_WWiscboWing;
        199, 200:
          wimg := g_WMagic5Images;
        150 .. 155, 157, 170:
          wimg := g_WEffectGJSImages;
        156:
          wimg := g_WHumWingImages[1];
        158 .. 169:
          wimg := g_WMagicCKImages;
        else
        begin
          wimg := g_WMagicImages;
        end;
      end;
      if magStrengthen > 0 then
      begin
        case mag of
          4:
          begin
            case mTag of
              1:
              begin
                wimg := g_WMagic716Images;
                idx := 440 + (Max(magStrengthen, 9) - 1) * 20;
              end;
              2:
              begin
                wimg := g_WMagic716Images;
                idx := 650 + (Max(magStrengthen, 9) - 1) * 20;
              end;
            end;
          end;
          8:
          begin
            wimg := nil;
            idx := 0;
          end;
          9:
          begin
            wimg := g_WMagic716Images;
            idx := 120 + (Max(magStrengthen, 9) - 1) * 10;
          end;
          15:
          begin
            wimg := g_WMagic716Images;
            idx := 860 + (Max(magStrengthen, 9) - 1) * 20;
          end;
          20:
          begin
            wimg := g_WMagic716Images;
            idx := (Min(magStrengthen, 9) - 1) * 10;
          end;
          21:
          begin
            wimg := g_WMagic716Images;
            idx := 260 + (Min(magStrengthen, 9) - 1) * 10;
          end;
          31:
          begin
            wimg := g_WMagic816Images;
            idx := (Min(magStrengthen, 9) - 1) * 10;
          end;
          51:
          begin
            wimg := g_WMagic816Images;
            idx := (Min(magStrengthen, 9) - 1) * 10;
          end;
        end;
      end;
    end;
    1:
    begin
      if mag in [0 .. MAXHITEFFECT - 1] then
        idx := HitEffectBase[mag];
      case mag of
        6, 8, 17 { �������� } :
          wimg := g_WMagic2Images;
        7:
          wimg := g_WMagic5Images; // ����ն�ػ�
        9, 11:
          wimg := g_WMagic6Images; // 4���һ� 20080112
        10:
          wimg := g_WMagic5Images; // ����ն���
        12:
          wimg := g_WMagic4Images; // ����һ��սʿЧ�� 20080611
        13 .. 16:
          wimg := g_WWiscboWing; // ����ɱ
        18, 19:
          wimg := g_WMagic7Images;
        50,52,53:
          wimg := g_WMagicCKImages;
        else
          wimg := g_WMagicImages;
      end;
      if magStrengthen > 0 then
      begin
        case mag of
          1:
          begin
            wimg := g_WMagic716Images;
            case magStrengthen of
              1..3: idx := 1600;
              4..6: idx := 1690;
              else  idx := 1780;
            end;
          end;
          2:
          begin
            wimg := g_WMagic716Images;
            case magStrengthen of
              1..3: idx := 2140;
              4..6: idx := 2230;
              else  idx := 2320;
            end;
          end;
          3:
          begin
            wimg := g_WMagic716Images;
            case magStrengthen of
              1..3: idx := 1870;
              4..6: idx := 1960;
              else  idx := 2050;
            end;
          end;
          4:
          begin
            wimg := g_WMagic816Images;
            case magStrengthen of
              1..3: idx := 1660;
              4..6: idx := 1750;
              else  idx := 1840;
            end;
          end;
        end;
      end;
    end;
  end;
end;

procedure GetHitEffect(AMagicID, magStrengthen, mTag: Integer; var wimg: TWMImages; var idx: integer);
var
  AHit: Integer;
begin
  wimg := nil;
  idx := 0;
  AHit := 0;
  case AMagicID of
    SKILL_YEDO: AHit := 1;
    SKILL_ERGUM: AHit := 2; //�ļ���ɱ 18
    SKILL_BANWOL: AHit := 3;
    SKILL_FIRESWORD: AHit := 4; //4���һ� 9
    SKILL_40: AHit := 6;
    SKILL_42: AHit := 7;  //����ն��� 10
    SKILL_43: AHit := 8;
    SKILL_74: AHit := 11;
    SKILL_62: AHit := 12;
    SKILL_69: AHit := 17;
    SKILL_76: AHit := 13;
    SKILL_79: AHit := 14;
    SKILL_82: AHit := 15;
    SKILL_85: AHit := 16;
    SKILL_89: AHit := 18;
    SKILL_90: AHit := 19;
    SKILL_96: AHit := 21;
    SKILL_170: AHit := 50;
    SKILL_163: AHit := 52;
    SKILL_167: AHit := 53;
  end;
  if AHit > 0 then
    GetEffectBase(AHit, magStrengthen, mTag, 1, wimg, idx);
end;

procedure PlayHitMagicSound(AMagicID, AStrengthen, AFrame, ASex, AWeponSound: Integer; var NotHandled: Boolean);
var
  AProperties: TuCustomMagicEffectProperties;
begin
  if g_MagicMgr.TryGet(AMagicID, AStrengthen, AProperties) then
  begin
    if AProperties.Start.Sound <> '' then
    begin
      if AFrame = AProperties.Start.SoundFrame + 1 then
      begin
        NotHandled := False;
        g_SoundManager.DXPlaySound(AWeponSound);
        if StrToIntDef(AProperties.Start.Sound, -1) <> -1 then
          g_SoundManager.DXPlaySound(StrToIntDef(AProperties.Start.Sound, -1))
        else
          g_SoundManager.MyPlaySound(AProperties.Start.Sound);
      end;
      Exit;
    end;
  end;

  case AMagicID of
    0:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        NotHandled := False;
      end;
    end;
    SKILL_YEDO, SKILL_159:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        if ASex = 0 then
          g_SoundManager.DXPlaySound(s_yedo_man)
        else
          g_SoundManager.DXPlaySound(s_yedo_woman);
        NotHandled := False;
      end;
    end;
    SKILL_ERGUM, SKILL_89, SKILL_90:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        g_SoundManager.DXPlaySound(s_longhit);
        NotHandled := False;
      end;
    end;
    SKILL_BANWOL:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        g_SoundManager.DXPlaySound(s_widehit);
        NotHandled := False;
      end;
    end;
    SKILL_FIRESWORD:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        g_SoundManager.DXPlaySound(s_firehit);
        NotHandled := False;
      end;
    end;
    SKILL_40:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        g_SoundManager.DXPlaySound(s_firehit);
        NotHandled := False;
      end;
    end;
    SKILL_42:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.MyPlaySound(longswordhit_ground);
        NotHandled := False;
      end;
    end;
    SKILL_43:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        g_SoundManager.DXPlaySound(142);
        NotHandled := False;
      end;
    end;
    SKILL_74:
    begin
      if AFrame = 2 then
      begin
        if ASex = 0 then
          g_SoundManager.MyPlaySound('wav\M56-0.wav')
        else
          g_SoundManager.MyPlaySound('wav\M56-3.wav');
        NotHandled := False;
      end;
    end;
    SKILL_62:
    begin
      //todo ����һ��
    end;
    SKILL_69:
    begin
      if AFrame = 2 then
      begin
        if ASex = 0 then
          g_SoundManager.MyPlaySound('wav\cboZs1_start_m.wav')
        else
          g_SoundManager.MyPlaySound('wav\cboZs1_start_w.wav');
        NotHandled := False;
      end;
    end;
    SKILL_76:
    begin
      if AFrame = 2 then
      begin
        if ASex = 0 then
          g_SoundManager.MyPlaySound('wav\cboZs1_start_m.wav')
        else
          g_SoundManager.MyPlaySound('wav\cboZs1_start_w.wav');
        NotHandled := False;
      end;
    end;
    SKILL_79:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.MyPlaySound('wav\cboZs2_start.wav');
        NotHandled := False;
      end;
    end;
    SKILL_82:
    begin
      if AFrame = 2 then
      begin
        if ASex = 0 then
          g_SoundManager.MyPlaySound('wav\cboZs7_start.wav')
        else
          g_SoundManager.MyPlaySound('wav\cboZs7_start.wav');
        NotHandled := False;
      end;
    end;
    SKILL_85:
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.MyPlaySound('wav\cboZs4_start.wav');
        NotHandled := False;
      end;
    end;
    SKILL_96:
    begin
      if AFrame = 2 then
      begin
        if ASex = 0 then
          g_SoundManager.MyPlaySound('wav\cboZs4_start.wav')
        else
          g_SoundManager.MyPlaySound('wav\cboZs4_start.wav');
        NotHandled := False;
      end;
    end;
    SKILL_170:
    begin
      g_SoundManager.DXPlaySound(AWeponSound);
      g_SoundManager.MyPlaySound('wav\shuangyue.wav');
      NotHandled := False;
    end;
    SKILL_163:
    begin
      g_SoundManager.DXPlaySound(AWeponSound);
      g_SoundManager.MyPlaySound('wav\yanlongbo.wav');
      NotHandled := False;
    end;
    SKILL_167:
    begin
      g_SoundManager.DXPlaySound(AWeponSound);
      g_SoundManager.MyPlaySound('wav\huoliankuangwu.wav');
      NotHandled := False;
    end;
    else
    begin
      if AFrame = 2 then
      begin
        g_SoundManager.DXPlaySound(AWeponSound);
        NotHandled := False;
      end;
    end;
  end;
end;

constructor TMagicEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
var
  L: Real;
begin
  m_dwStartWorkTick := 0;
  ImgLib := g_WMagicImages; // �⺻
  case mtype of
    mtReady:
      begin
        start := 0;
        frame := -1;
        ExplosionFrame := 20;
        curframe := start;
        FixedEffect := True;
        Repetition := FALSE;
      end;
    mtFly, mtBujaukGroundEffect, mtExploBujauk:
      begin // �����л����� 2007.10.31
        start := 0;
        frame := 6;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 10;
        if id = 38 then
          frame := 10;
        if id = 39 then
        begin
          frame := 4;
          ExplosionFrame := 8;
        end;
        if (id - 81 - 3) < 0 then
        begin
          bt80 := 1;
          Repetition := True;
          if id = 81 then
          begin
            if g_Myself.m_nCurrX >= 84 then
            begin
              EffectBase := 130;
            end
            else
            begin
              EffectBase := 140;
            end;
            bt81 := 1;
          end;
          if id = 82 then
          begin
            if (g_Myself.m_nCurrX >= 78) and (g_Myself.m_nCurrY >= 48) then
            begin
              EffectBase := 150;
            end
            else
            begin
              EffectBase := 160;
            end;
            bt81 := 2;
          end;
          if id = 83 then
          begin
            EffectBase := 180;
            bt81 := 3;
          end;
          start := 0;
          frame := 10;
          MagExplosionBase := 190;
          ExplosionFrame := 10;
        end;
      end;
    mt12:
      begin
        start := 0;
        frame := 6;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 1;
      end;
    mt13:
      begin
        start := 0;
        frame := 20;
        curframe := start;
        FixedEffect := True;
        Repetition := FALSE;
        ExplosionFrame := 20;
        ImgLib := { FrmMain.WMon21Img20080720ע�� } g_WMonImagesArr[20];
      end;
    mtExplosion, mtThunder, mtLightingThunder, mtRedThunder, mtLava:
      begin
        start := 0;
        frame := -1;
        ExplosionFrame := 10;
        curframe := start;
        FixedEffect := True;
        Repetition := FALSE;
        if id = 80 then
        begin
          bt80 := 2;
          case Random(6) of
            0:
              begin
                EffectBase := 230;
              end;
            1:
              begin
                EffectBase := 240;
              end;
            2:
              begin
                EffectBase := 250;
              end;
            3:
              begin
                EffectBase := 230;
              end;
            4:
              begin
                EffectBase := 240;
              end;
            5:
              begin
                EffectBase := 250;
              end;
          end;
          Light := 4;
          ExplosionFrame := 5;
        end;
        if id = 70 then
        begin
          bt80 := 3;
          case Random(3) of
            0:
              begin
                EffectBase := 400;
              end;
            1:
              begin
                EffectBase := 410;
              end;
            2:
              begin
                EffectBase := 420;
              end;
          end;
          Light := 4;
          ExplosionFrame := 5;
        end;
        if id = 71 then
        begin
          bt80 := 3;
          ExplosionFrame := 20;
        end;
        if id = 72 then
        begin
          bt80 := 3;
          Light := 3;
          ExplosionFrame := 10;
        end;
        if id = 73 then
        begin
          bt80 := 3;
          Light := 5;
          ExplosionFrame := 20;
        end;
        if id = 74 then
        begin
          bt80 := 3;
          Light := 4;
          ExplosionFrame := 35;
        end;
        if id = 90 then
        begin
          EffectBase := 350;
          MagExplosionBase := 350;
          ExplosionFrame := 30;
        end;
      end;
    mt14:
      begin
        start := 0;
        frame := -1;
        curframe := start;
        FixedEffect := True;
        Repetition := FALSE;
        ImgLib := g_WMagic2Images;
      end;
    mtFlyAxe:
      begin
        start := 0;
        frame := 3;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 3;
      end;
    mtFlyArrow:
      begin
        start := 0;
        frame := 1;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 1;
      end;
    mt15:
      begin
        start := 0;
        frame := 6;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 2;
      end;
    mt16:
      begin
        start := 0;
        frame := 1;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 1;
      end;
    mtAssassin:
      begin
        start := 0;
        frame := 1;
        curframe := start;
        FixedEffect := FALSE;
        Repetition := Recusion;
        ExplosionFrame := 1;
      end
  else
    begin
    end;
  end;
  m_nServerMagicId := id; // ������ ID
  EffectBase := effnum; // MagicDB - Effect
  TargetX := tx; // "   target x
  TargetY := ty; // "   target y
  if bt80 = 1 then
  begin
    if id = 81 then
    begin
      dec(sx, 14);
      inc(sy, 20);
    end;
    if id = 81 then //TODO
    begin
      dec(sx, 70);
      dec(sy, 10);
    end;
    if id = 83 then
    begin
      dec(sx, 60);
      dec(sy, 70);
    end;
    g_SoundManager.DXPlaySound(8208);
  end;
  fireX := sx; //
  fireY := sy; //
  FlyX := sx; //
  FlyY := sy;
  OldFlyX := sx;
  OldFlyY := sy;
  FlyXf := sx;
  FlyYf := sy;
  FireMyselfX := g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX;
  FireMyselfY := g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY;
  if bt80 = 0 then
  begin
    MagExplosionBase := EffectBase + EXPLOSIONBASE;
  end;

  Light := 1;
  L := Sqrt(Sqr(TargetX - fireX) + Sqr(TargetY - fireY));
  FXStep := (TargetX - fireX) / L;
  FYStep := (TargetY - fireY) / L;

  NextFrameTime := 50;
  m_dwFrameTime := GetTickCount;
  m_dwStartTime := GetTickCount;
  steptime := GetTickCount;
  //repeattime := AniTime;
  Dir16 := GetFlyDirection16(sx, sy, tx, ty);
  OldDir16 := Dir16;
  m_boActive := True;
  prevdisx := 99999;
  prevdisy := 99999;
end;

destructor TMagicEff.Destroy;
begin
  inherited Destroy;
end;

procedure TMagicEff.PlaySound;
begin
  if not FSounded then
  begin
    if MagOwner <> nil then
    begin
      if TActor(MagOwner).m_nMagicExplosionSound <> -1 then
        g_SoundManager.DXPlaySound(TActor(MagOwner).m_nMagicExplosionSound)
      else
        g_SoundManager.MyPlaySound(TActor(MagOwner).m_sMagicExplosionSound);
      FSounded := True;
    end;
  end;
end;

function TMagicEff.Shift: Boolean;
  function OverThrough(olddir, newdir: integer): Boolean;
  begin
    Result := FALSE;
    if abs(olddir - newdir) >= 2 then
    begin
      Result := True;
      if ((olddir = 0) and (newdir = 15)) or ((olddir = 15) and (newdir = 0)) then
        Result := FALSE;
    end;
  end;

var
  ms, stepx, stepy: integer;
  shx, shy, passdir16: integer;
  crash: Boolean; // ��ײ
  NewXStep, NewYStep, stepxf, stepyf: Real;
  L: Real;
begin
  Result := True;
  if Repetition then
  begin
    if GetTickCount - steptime > NextFrameTime then
    begin
      steptime := GetTickCount;
      inc(curframe);
      if curframe > start + frame - 1 then
        curframe := start;
    end;
  end
  else
  begin
    if (frame > 0) and (GetTickCount - steptime > NextFrameTime) then
    begin
      steptime := GetTickCount;
      inc(curframe);
      if curframe > start + frame - 1 then
      begin
        curframe := start + frame - 1;
        Result := FALSE;
      end;
    end;
  end;

  //��ʾ����
  if (not FixedEffect) then
  begin // ���Ϊ���̶��Ľ��
    crash := FALSE;
    if TargetActor <> nil then
    begin
      ms := GetTickCount - m_dwFrameTime;
      m_dwFrameTime := GetTickCount;
      PlayScene.ScreenXYfromMCXY(TActor(TargetActor).m_nRx, TActor(TargetActor).m_nRy, TargetX, TargetY);
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      TargetX := TargetX + shx;
      TargetY := TargetY + shy;

      L := Sqrt(Sqr(TargetX - fireX) + Sqr(TargetY - fireY));
      NewXStep := (TargetX - fireX) / L;
      NewYStep := (TargetY - fireY) / L;
      FXStep := FXStep + (NewXStep - FXStep) / 2;
      FYStep := FYStep + (NewYStep - FYStep) / 2;

      stepxf := FXStep * ms / 1.3;
      stepyf := FYStep * ms / 1.3;
      FlyXf := FlyXf + stepxf;
      FlyYf := FlyYf + stepyf;
      FlyX := Round(FlyXf);
      FlyY := Round(FlyYf);

      OldFlyX := FlyX;
      OldFlyY := FlyY;
      passdir16 := GetFlyDirection16(FlyX, FlyY, TargetX, TargetY);
      if ((abs(TargetX - FlyX) <= 15) and (abs(TargetY - FlyY) <= 15)) or ((abs(TargetX - FlyX) >= prevdisx) and (abs(TargetY - FlyY) >= prevdisy)) or OverThrough(OldDir16, passdir16) then
      begin
        crash := True;
      end
      else
      begin
        prevdisx := abs(TargetX - FlyX);
        prevdisy := abs(TargetY - FlyY);
      end;
      OldDir16 := passdir16;
    end
    else
    begin
      ms := GetTickCount - m_dwFrameTime;
      stepx := Round(FXStep * ms / 1.3);
      stepy := Round(FYStep * ms / 1.3);
      FlyX := fireX + stepx;
      FlyY := fireY + stepy;
    end;

    PlayScene.CXYfromMouseXY(FlyX, FlyY, RX, RY);
    if crash and (TargetActor <> nil) then
    begin
      FixedEffect := True;
      start := 0;
      frame := ExplosionFrame;
      curframe := start;
      Repetition := FALSE;
    end;
  end;

  if FixedEffect then
  begin //�̶����
    PlaySound;
    if frame = -1 then
      frame := ExplosionFrame;
    if TargetActor = nil then
    begin
      FlyX := TargetX - ((g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX);
      FlyY := TargetY - ((g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY);
      PlayScene.CXYfromMouseXY(FlyX, FlyY, RX, RY);
    end
    else
    begin
      RX := TActor(TargetActor).m_nRx;
      RY := TActor(TargetActor).m_nRy;
      PlayScene.ScreenXYfromMCXY(RX, RY, FlyX, FlyY);
      FlyX := FlyX + TActor(TargetActor).m_nShiftX;
      FlyY := FlyY + TActor(TargetActor).m_nShiftY;
    end;
  end;
end;

function TMagicEff.Run: Boolean;
begin
  Result := Shift;
  if Result then
  begin
    Result := GetTickCount - m_dwStartTime <= 10000;
  end;
end;

{ ------------------------------------------------------------------------------ }
// �˹�����ʾħ������Ʈ�ƹ���(20071031)
// DrawEff (surface: TAsphyreCanvas);
//
// ***EffectBase��ΪEffectBase���������***
// {------------------------------------------------------------------------------}
procedure TMagicEff.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
  begin
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
    if not FixedEffect then
    begin
      img := EffectBase + FLYBASE + Dir16 * 10;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
      end;
    end
    else
    begin
      img := MagExplosionBase + curframe;
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then
      begin
        surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
      end;
    end;
  end;
end;

function TMagicEff.IsWaiting: Boolean;
begin
  if GetTickCount > m_dwStartWorkTick then
    result := False
  else
  begin
    m_dwStartTime := m_dwStartWorkTick;
    Result := True;
  end;
end;

constructor TFlyingAxe.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited Create(id, effnum, sx, sy, tx, ty, mtype, Recusion, AniTime);
  FlyImageBase := FLYOMAAXEBASE;
  ReadyFrame := 65;
end;

procedure TFlyingAxe.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > ReadyFrame) or (abs(FlyY - fireY) > ReadyFrame)) then
  begin

    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    if not FixedEffect then
    begin
      img := FlyImageBase + Dir16 * 10;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
      end;
    end
    else
    begin
    end;
  end;
end;

{ ------------------------------------------------------------ }
// TFlyingArrow : ���ư��� ȭ��
{ ------------------------------------------------------------ }

constructor TFlyingArrow.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
  frame := 1;
end;

procedure TFlyingArrow.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 40) or (abs(FlyY - fireY) > 40)) then
  begin
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    if not FixedEffect then
    begin
      img := FlyImageBase + Dir16 * frame;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy - 46, d.ClientRect, d, True);
      end;
    end;
  end;
end;

constructor TAcherFlyArrow.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
  frame := 4;
  boBlend := FALSE;
  boTail := FALSE;
  nTailStart := 0;
  nTailLen := 0;
end;

procedure TAcherFlyArrow.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy, tx, ty: integer;
  ox, oy: Real;
  I: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 40) or (abs(FlyY - fireY) > 40)) then
  begin
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    if not FixedEffect then
    begin
      img := EffectBase + Dir16 * 5;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        if boBlend then
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1)
        else
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, True);
      end;
      if boTail then
      begin
        ox := 0.0;
        oy := 0.0;
        for I := 0 to nTailLen - 1 do
        begin
          d := ImgLib.GetCachedImage(nTailStart + I, tx, ty);
          if d <> nil then
          begin
            oy := oy - d.Height / 2 * FYStep;
            ox := ox - d.Width / 2 * FXStep;
            surface.DrawBlend(FlyX + tx + Round(ox) - UNITX div 2 - shx, FlyY + ty + Round(oy) - UNITY div 2 - shy, d, 1);
          end;
        end;
      end;
    end
    else if MagExplosionBase > 0 then
    begin
      d := ImgLib.GetCachedImage(MagExplosionBase + curframe, px, py);
      if d <> nil then
      begin
        if boBlend then
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1)
        else
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, True);
      end;
    end;
  end;
end;

{TAcherFlyArrow151}

constructor TAcherFlyArrow151.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
  frame := 4;
  boBlend := FALSE;
  HitLib := nil;
end;

procedure TAcherFlyArrow151.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy, tx, ty: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 40) or (abs(FlyY - fireY) > 40)) then
  begin
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    if not FixedEffect then
    begin
      img := EffectBase + Dir16 * 5;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        if boBlend then
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1)
        else
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, True);
      end;
    end
    else if MagExplosionBase > 0 then
    begin
      d := HitLib.GetCachedImage(MagExplosionBase + (Dir16 div 2) * 10 + 2 + curframe, px, py);
      if d <> nil then
      begin
        if boBlend then
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1)
        else
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, True);
      end;
    end;
  end;
end;

constructor TCharEffect.Create(effbase, effframe: integer; Target: TObject);
begin
  inherited Create(111, effbase, TActor(Target).m_nCurrX, TActor(Target).m_nCurrY, TActor(Target).m_nCurrX, TActor(Target).m_nCurrY, mtExplosion, FALSE, 0);
  TargetActor := Target;
  frame := effframe;
  NextFrameTime := 30;
end;

function TCharEffect.Run: Boolean;
begin
  Result := True;
  if GetTickCount - steptime > NextFrameTime then
  begin
    steptime := GetTickCount;
    inc(curframe);
    if curframe > start + frame - 1 then
    begin
      curframe := start + frame - 1;
      Result := FALSE;
    end;
  end;
end;

procedure TCharEffect.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
begin
  if TargetActor <> nil then
  begin
    RX := TActor(TargetActor).m_nRx;
    RY := TActor(TargetActor).m_nRy;
    PlayScene.ScreenXYfromMCXY(RX, RY, FlyX, FlyY);
    FlyX := FlyX + TActor(TargetActor).m_nShiftX;
    FlyY := FlyY + TActor(TargetActor).m_nShiftY;
    d := ImgLib.GetCachedImage(EffectBase + curframe, px, py);
    if d <> nil then
    begin
      surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
    end;
  end;
end;

{ -------------------------------------------------------- }

constructor TMapEffect.Create(effbase, effframe: integer; x, y: integer);
begin
  inherited Create(111, effbase, x, y, x, y, mtExplosion, FALSE, 0);
  TargetActor := nil;
  frame := effframe;
  NextFrameTime := 30;
  RepeatCount := 0;
end;

function TMapEffect.Run: Boolean;
begin
  Result := True;
  if GetTickCount - steptime > NextFrameTime then
  begin
    steptime := GetTickCount;
    inc(curframe);
    if curframe > start + frame - 1 then
    begin
      curframe := start + frame - 1;
      if RepeatCount > 0 then
      begin
        dec(RepeatCount);
        curframe := start;
      end
      else
        Result := FALSE;
    end;
  end;
end;

procedure TMapEffect.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
begin
  RX := TargetX;
  RY := TargetY;
  PlayScene.ScreenXYfromMCXY(RX, RY, FlyX, FlyY);
  d := ImgLib.GetCachedImage(EffectBase + curframe, px, py);
  if d <> nil then
    surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
end;

constructor TScrollHideEffect.Create(effbase, effframe: integer; x, y: integer; Target: TObject);
begin
  inherited Create(effbase, effframe, x, y);
end;

function TScrollHideEffect.Run: Boolean;
begin
  Result := inherited Run;

  if frame = 7 then
    if g_TargetCret <> nil then
      PlayScene.DeleteActor(g_TargetCret.m_nRecogId);
end;

{ -------------------------------------------------------- }

constructor TLightingEffect.Create(effbase, effframe: integer; x, y: integer);
begin

end;

function TLightingEffect.Run: Boolean;
begin
  Result := FALSE; // Jacky
end;

{ -------------------------------------------------------- }

constructor TFireGunEffect.Create(effbase, sx, sy, tx, ty: integer);
begin
  inherited Create(111, effbase, sx, sy, tx, ty, // TActor(target).XX, TActor(target).m_nCurrY,
    mtFireGun, True, 0);
  NextFrameTime := 50;
  FillChar(FireNodes, sizeof(TFireNode) * FIREGUNFRAME, #0);
  OutofOil := FALSE;
  firetime := GetTickCount;
end;

function TFireGunEffect.Run: Boolean;
var
  I: integer;
  allgone: Boolean;
begin
  Result := True;
  if GetTickCount - steptime > NextFrameTime then
  begin
    Shift;
    steptime := GetTickCount;
    // if not FixedEffect then begin  //��ǥ�� ���� �ʾ�����
    if not OutofOil then
    begin
      if (abs(RX - TActor(MagOwner).m_nRx) >= 5) or (abs(RY - TActor(MagOwner).m_nRy) >= 5) or (GetTickCount - firetime > 800) then
        OutofOil := True;
      for I := FIREGUNFRAME - 2 downto 0 do
      begin
        FireNodes[I].firenumber := FireNodes[I].firenumber + 1;
        FireNodes[I + 1] := FireNodes[I];
      end;
      FireNodes[0].firenumber := 1;
      FireNodes[0].x := FlyX;
      FireNodes[0].y := FlyY;
    end
    else
    begin
      allgone := True;
      for I := FIREGUNFRAME - 2 downto 0 do
      begin
        if FireNodes[I].firenumber <= FIREGUNFRAME then
        begin
          FireNodes[I].firenumber := FireNodes[I].firenumber + 1;
          FireNodes[I + 1] := FireNodes[I];
          allgone := FALSE;
        end;
      end;
      if allgone then
        Result := FALSE;
    end;
  end;
end;

procedure TFireGunEffect.DrawEff(surface: TAsphyreCanvas);
var
  I, shx, shy, fireX, fireY, prx, pry, img: integer;
  d: TAsphyreLockableTexture;
begin
  prx := -1;
  pry := -1;
  for I := 0 to FIREGUNFRAME - 1 do
  begin
    if (FireNodes[I].firenumber <= FIREGUNFRAME) and (FireNodes[I].firenumber > 0) then
    begin
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      img := EffectBase + (FireNodes[I].firenumber - 1);
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then
      begin
        fireX := FireNodes[I].x + px - UNITX div 2 - shx;
        fireY := FireNodes[I].y + py - UNITY div 2 - shy;
        if (fireX <> prx) or (fireY <> pry) then
        begin
          prx := fireX;
          pry := fireY;
          surface.DrawBlend(fireX, fireY, d, 1);
        end;
      end;
    end;
  end;
end;

{ -------------------------------------------------------- }

constructor TThuderEffect.Create(effbase, tx, ty: integer; Target: TObject);
begin
  inherited Create(111, effbase, tx, ty, tx, ty, // TActor(target).XX, TActor(target).m_nCurrY,
    mtThunder, FALSE, 0);
  TargetActor := Target;
end;

procedure TThuderEffect.DrawEff(surface: TAsphyreCanvas);
var
  img, px, py: integer;
  d: TAsphyreLockableTexture;
begin
  d := ImgLib.GetCachedImage(EffectBase + curframe, px, py);
  if d <> nil then
  begin
    surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
  end;
end;

{ -------------------------------------------------------- }

constructor TLightingThunder.Create(effbase, sx, sy, tx, ty: integer; Target: TObject);
begin
  inherited Create(111, effbase, sx, sy, tx, ty, // TActor(target).XX, TActor(target).m_nCurrY,
    mtLightingThunder, FALSE, 0);
  TargetActor := Target;
end;

procedure TLightingThunder.DrawEff(surface: TAsphyreCanvas);
var
  img, sx, sy, px, py { shx, shy } : integer;
  d: TAsphyreLockableTexture;
begin
  try
    img := EffectBase + Dir16 * 10;
    if curframe < 6 then
    begin
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        PlayScene.ScreenXYfromMCXY(TActor(MagOwner).m_nRx, TActor(MagOwner).m_nRy, sx, sy);
        surface.DrawBlend(sx + px - UNITX div 2, sy + py - UNITY div 2, d, 1);
      end;
    end;
  except
    DebugOutStr('TLightingThunder.DrawEff');
  end;
end;

{ -------------------------------------------------------- }
// �ƻ�ħ��������  20080226
constructor TPHHitEffect.Create(effbase, sx, sy, tx, ty: integer; aowner: TObject);
begin

  inherited Create(111, effbase, sx, sy, tx, ty, mtReady, FALSE, 0);
  NextFrameTime := 80;

  RX := TActor(aowner).m_nRx;
  RY := TActor(aowner).m_nRy;
end;

procedure TPHHitEffect.DrawEff(surface: TAsphyreCanvas);
var
  img, sx, sy, px, py: integer;
  d: TAsphyreLockableTexture;
begin
  try
    img := (Dir16 div 2) * 20 + 10;
    if curframe < 20 then
    begin
      d := g_WMagic4Images.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        PlayScene.ScreenXYfromMCXY(RX, RY, sx, sy);
        surface.DrawBlend(sx + px - UNITX div 2, sy + py - UNITY div 2, d, 1);
      end;
    end;
  except
    DebugOutStr('TPHHitEffect.DrawEff');
  end;
end;
{ -------------------------------------------------------- }

constructor TExploBujaukEffect.Create(effbase, sx, sy, tx, ty: integer; Target: TObject);
begin
  inherited Create(111, effbase, sx, sy, tx, ty, mtExploBujauk, True, 0);
  frame := 3;
  TargetActor := Target;
  NextFrameTime := 50;
  m_boDrawShadow := False;
end;

procedure TExploBujaukEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  try
    if m_boActive and ((abs(FlyX - fireX) > 50) or (abs(FlyY - fireY) > 50) or FixedEffect) then
    begin
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

      if not FixedEffect then
      begin
        img := EffectBase + Dir16 * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
        if m_boDrawShadow then
        begin
          d := ImgLib.GetCachedImage(img + curframe + 170, px, py);
          if d <> nil then
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
      end
      else
      begin
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if d <> nil then
          surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
      end;
    end;
  except
  end;
end;

{ -------------------------------------------------------- }

constructor TBujaukGroundEffect.Create(effbase, magicnumb, sx, sy, tx, ty: integer);
begin
  inherited Create(111, effbase, sx, sy, tx, ty, mtBujaukGroundEffect, True, 0);
  frame := 3;
  MagicNumber := magicnumb;
  BoGroundEffect := FALSE;
  NextFrameTime := 50;
  StrengthenLib := nil;
end;

function TBujaukGroundEffect.Run: Boolean;
begin
  Result := inherited Run;
  if not FixedEffect then
  begin
    if ((abs(TargetX - FlyX) <= 15) and (abs(TargetY - FlyY) <= 15)) or ((abs(TargetX - FlyX) >= prevdisx) and (abs(TargetY - FlyY) >= prevdisy)) then
    begin
      FixedEffect := True; // �̶����
      start := 0;
      frame := ExplosionFrame;
      curframe := start;
      Repetition := FALSE;
      // ������ ����
      g_SoundManager.DXPlaySound(TActor(MagOwner).m_nMagicExplosionSound);
      Result := True;
    end
    else
    begin
      prevdisx := abs(TargetX - FlyX);
      prevdisy := abs(TargetY - FlyY);
    end;
  end;
end;

procedure TBujaukGroundEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  L: TWMImages;
begin
  try
    if m_boActive and ((abs(FlyX - fireX) > 30) or (abs(FlyY - fireY) > 30) or FixedEffect) then
    begin
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      if not FixedEffect then
      begin
        img := EffectBase + Dir16 * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
        end;
      end
      else
      begin
        L := ImgLib;
        if StrengthenLib <> nil then
          L := StrengthenLib;
        case MagicNumber of
          11, 12: img := MagExplosionBase + curframe;
          46:
          begin
            GetEffectBase(MagicNumber, 0, 0, 0, ImgLib, img);
            img := img + 10 + curframe;
          end;
        end;
        d := L.GetCachedImage(img, px, py);
        if d <> nil then
          surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
      end;
    end;
  except
  end;
end;

{ TNormalDrawEffect }

constructor TNormalDrawEffect.Create(XX, YY: integer; WmImage: TWMImages; effbase, nX: integer; frmTime: longword; boFlag: Boolean);
begin
  inherited Create(111, effbase, XX, YY, XX, YY, mtReady, True, 0);
  ImgLib := WmImage;
  EffectBase := effbase;
  start := 0;
  curframe := 0;
  frame := nX;
  NextFrameTime := frmTime;
  boDrawBlend := boFlag;
end;

procedure TNormalDrawEffect.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
  nRx, nRy, nPx, nPy: integer;
begin
  try
    d := ImgLib.GetCachedImage(EffectBase + curframe, nPx, nPy);
    if d <> nil then
    begin
      PlayScene.ScreenXYfromMCXY(FlyX, FlyY, nRx, nRy);
      if boDrawBlend then
      begin
        surface.DrawBlend(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d, 1);
      end
      else
      begin
        surface.Draw(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d.ClientRect, d, True);
      end;
    end;
  except
    DebugOutStr('TNormalDrawEffect.DrawEff');
  end;
end;

function TNormalDrawEffect.Run: Boolean;
begin
  Result := True;
  if m_boActive and (GetTickCount - steptime > NextFrameTime) then
  begin
    steptime := GetTickCount;
    inc(curframe);
    if curframe > start + frame - 1 then
    begin
      curframe := start;
      Result := FALSE;
    end;
  end;
end;

{ TFlyingBug }

constructor TFlyingBug.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited Create(id, effnum, sx, sy, tx, ty, mtype, Recusion, AniTime);
  FlyImageBase := FLYOMAAXEBASE;
  ReadyFrame := 65;
end;

procedure TFlyingBug.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  try
    if m_boActive and ((abs(FlyX - fireX) > ReadyFrame) or (abs(FlyY - fireY) > ReadyFrame)) then
    begin
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

      if not FixedEffect then
      begin
        img := FlyImageBase + (Dir16 div 2) * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
        end;
      end
      else
      begin
        img := curframe + MagExplosionBase;
        d := ImgLib.GetCachedImage(img, px, py);
        if d <> nil then
        begin
          surface.Draw(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d.ClientRect, d, True);
        end;
      end;
    end;
  except
    DebugOutStr('TFlyingBug.DrawEff');
  end;
end;

{ TFlyingFireBall }

procedure TFlyingFireBall.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
begin
  try
    if m_boActive and ((abs(FlyX - fireX) > ReadyFrame) or (abs(FlyY - fireY) > ReadyFrame)) then
    begin
      d := ImgLib.GetCachedImage(FlyImageBase + (GetFlyDirection(FlyX, FlyY, TargetX, TargetY) * 10) + curframe, px, py);
      if d <> nil then
        surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
    end;
  except
    DebugOutStr('TFlyingFireBall.DrawEff');
  end;
end;
{ TRedThunderEffect }

constructor TRedThunderEffect.Create(effbase, tx, ty: integer; Target: TObject);
begin
  inherited Create(111, effbase, tx, ty, tx, ty, // TActor(target).XX, TActor(target).m_nCurrY,
    mtRedThunder, FALSE, 0);
  TargetActor := Target;
  n0 := Random(7);
end;

procedure TRedThunderEffect.DrawEff(surface: TAsphyreCanvas);
var
  px, py: integer;
  d: TAsphyreLockableTexture;
begin
  try
    ImgLib := { FrmMain.WDragonImg } g_WDragonImages;
    d := ImgLib.GetCachedImage(EffectBase + (7 * n0) + curframe, px, py);
    if d <> nil then
    begin
      surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
    end;
  except
    DebugOutStr('TRedThunderEffect.DrawEff');
  end;
end;

{ TLavaEffect }
constructor TLavaEffect.Create(effbase, tx, ty: integer; Target: TObject; nframe: integer);
begin
  inherited Create(111, effbase, tx, ty, tx, ty, // TActor(target).XX, TActor(target).m_nCurrY,
    mtLava, FALSE, 0);
  TargetActor := Target;
  frame := nframe;
end;

procedure TLavaEffect.DrawEff(surface: TAsphyreCanvas);
var
  px, py: integer;
  d: TAsphyreLockableTexture;
begin
  try
    ImgLib := g_WDragonImages;
    if curframe < frame then
    begin
      d := ImgLib.GetCachedImage(470 + curframe, px, py);
      if d <> nil then
      begin
        surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
      end;
    end;
    d := ImgLib.GetCachedImage(EffectBase + curframe, px, py);
    if d <> nil then
    begin
      surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
    end;
  except
    DebugOutStr('TLavaEffect.DrawEff');
  end;
end;

{ TfenshenThunder }

constructor TfenshenThunder.Create(effbase, sx, sy, tx, ty: integer; aowner: TObject);
begin
  RX := TActor(aowner).m_nRx;
  RY := TActor(aowner).m_nRy;
  dir := TActor(aowner).m_btDir;
  inherited Create(111, effbase, sx, sy, tx, ty, mtLightingThunder, FALSE, 0);
end;

procedure TfenshenThunder.DrawEff(surface: TAsphyreCanvas);
  procedure GetFrontPosition(sx, sy, dir: integer; var newx, newy: integer);
  begin
    newx := sx;
    newy := sy;
    case dir of
      DR_UP:
        newy := newy - 100;
      DR_DOWN:
        newy := newy + 100;
      DR_LEFT:
        newx := newx - 145;
      DR_RIGHT:
        newx := newx + 145;
      DR_UPLEFT:
        begin
          newx := newx - 140;
          newy := newy - 105;
        end;
      DR_UPRIGHT:
        begin
          newx := newx + 145;
          newy := newy - 100;
        end;
      DR_DOWNLEFT:
        begin
          newx := newx - 145;
          newy := newy + 90;
        end;
      DR_DOWNRIGHT:
        begin
          newx := newx + 145;
          newy := newy + 90;
        end;
    end;
  end;

var
  img, sx, sy, px, py: integer;
  d: TAsphyreLockableTexture;
  nX, ny: integer;
begin
  try
    img := EffectBase + dir * 10;
    if curframe < 10 then
    begin
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
      begin
        PlayScene.ScreenXYfromMCXY(RX, RY, sx, sy);
        GetFrontPosition(sx + px - UNITX div 2, sy + py - UNITY div 2, dir, nX, ny);
        surface.DrawBlend(nX, ny, d, 1);
      end;
      img := 90;
      if curframe < 10 then
      begin
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          PlayScene.ScreenXYfromMCXY(RX, RY, sx, sy);

          GetFrontPosition(sx + px - UNITX div 2, sy + py - UNITY div 2, dir, nX, ny);
          surface.DrawBlend(nX, ny, d, 1);
        end;
      end;
    end;
  except
    DebugOutStr('TfenshenThunder.DrawEff');
  end;
end;

{ TFairyEffect }

constructor TFairyEffect.Create(effbase, tx, ty: integer; Target: TObject);
begin

end;

procedure TFairyEffect.DrawEff(surface: TAsphyreCanvas);
begin
  inherited;

end;

{ TObjectEffects }
// �Զ���ħ���� 20080809
constructor TObjectEffects.Create(ObjectiD2: TObject; WmImage: TWMImages; effbase, nX: integer; frmTime: longword; boFlag: Boolean);
begin
  inherited Create(111, effbase, 0, 0, 0, 0, mtReady, True, 0);
  ImgLib := WmImage;
  EffectBase := effbase;
  start := 0;
  curframe := 0;
  frame := nX;
  NextFrameTime := frmTime;
  boDrawBlend := boFlag;
  ObjectID := ObjectiD2;
end;

procedure TObjectEffects.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
  RX, RY, nRx, nRy, nPx, nPy: integer;
  Index:Integer;
begin
  try
    Index := EffectBase + curframe;
    d := ImgLib.GetCachedImage(Index, nPx, nPy);
    if (d <> nil) and (ObjectID <> nil) then
    begin
      RX := TActor(ObjectID).m_nRx;
      RY := TActor(ObjectID).m_nRy;
      PlayScene.ScreenXYfromMCXY(RX, RY, nRx, nRy);
      nRx := nRx + TActor(ObjectID).m_nShiftX;
      nRy := nRy + TActor(ObjectID).m_nShiftY;
      if boDrawBlend then
      begin
        surface.DrawBlend(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d, 1);
      end
      else
      begin
        surface.Draw(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d.ClientRect, d, True);
      end;
    end;
  except
    DebugOutStr('TObjectEffects.DrawEff');
  end;
end;

function TObjectEffects.Run: Boolean;
begin
  Result := True;
  if m_boActive and (GetTickCount - steptime > NextFrameTime) then
  begin
    steptime := GetTickCount;
    inc(curframe);
    if curframe > start + frame - 1 then
    begin
      curframe := start;
      Result := FALSE;
    end;
  end;
end;

{ TFireDragonEffect }

constructor TFireDragonEffect.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited Create(id, effnum, sx, sy, tx, ty, mtype, Recusion, AniTime);
  FlyX1 := 0;
  FlyY1 := 0;
  FlyX2 := 0;
  FlyY2 := 0;
  boflyFixedEffect := FALSE;
end;

procedure TFireDragonEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        case Dir16 div 2 of
          3, 4:
            img := EffectBase + FLYBASE;
          5:
            img := EffectBase + FLYBASE + 10;
          6, 7:
            img := EffectBase + FLYBASE + 20;
        end;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
      end
      else
      begin
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if not boflyFixedEffect then
        begin
          FlyX2 := TActor(TargetActor).m_nCurrX;
          FlyY2 := TActor(TargetActor).m_nCurrY;
          boflyFixedEffect := True;
        end;
        PlayScene.ScreenXYfromMCXY(FlyX2, FlyY2, FlyX1, FlyY1);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX1 + px - UNITX div 2, FlyY1 + py - UNITY div 2, d, 1);
        end;
      end;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ TFireFixedEffect }

constructor TFireFixedEffect.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited Create(id, effnum, sx, sy, tx, ty, mtype, Recusion, AniTime);
  FlyX1 := 0;
  FlyY1 := 0;
  FlyX2 := 0;
  FlyY2 := 0;
  boflyFixedEffect := FALSE;
end;

procedure TFireFixedEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        img := EffectBase + FLYBASE + Dir16 * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
      end
      else
      begin
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if not boflyFixedEffect then
        begin
          FlyX2 := TActor(TargetActor).m_nCurrX;
          FlyY2 := TActor(TargetActor).m_nCurrY;
          boflyFixedEffect := True;
        end;
        PlayScene.ScreenXYfromMCXY(FlyX2, FlyY2, FlyX1, FlyY1);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX1 + px - UNITX div 2, FlyY1 + py - UNITY div 2, d, 1);
        end;
        ErrorCode := 10;
      end;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ TBatterMagicEff }

constructor TBatterMagicEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
  skipNum := 0;
end;

procedure TBatterMagicEff.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        img := EffectBase + BatterImageBase + Dir16 * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
      end
      else
      begin
        ErrorCode := 7;
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
        end;
      end;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ THuXiaoMagicEff }

constructor THuXiaoMagicEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
end;

procedure THuXiaoMagicEff.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        ErrorCode := 3;
        // �뷽���йص�ħ��Ч��
        img := EffectBase + BatterImageBase + Round(Dir16 div 2) * 10;
        ErrorCode := 4;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        ErrorCode := 5;
        if d <> nil then
        begin
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
        end;
        ErrorCode := 6;
      end
      else
      begin
        ErrorCode := 7;
        // �뷽���޹ص�ħ��Ч�������籬ը��
        img := MagExplosionBase + curframe + Round(Dir16 div 2) * 10; // EXPLOSIONBASE;
        ErrorCode := 8;
        d := ImgLib.GetCachedImage(img, px, py);
        ErrorCode := 9;
        if d <> nil then
        begin
          surface.Draw(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d.ClientRect, d, True);
        end;
        ErrorCode := 10;
        d := ImgLib.GetCachedImage(img + 80, px, py);
        ErrorCode := 11;
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
        ErrorCode := 12;
      end;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ TJingLeiMagicEff }

constructor TJingLeiMagicEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
end;

procedure TJingLeiMagicEff.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        img := EffectBase + BatterImageBase;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
      end
      else
      begin
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if d <> nil then
        begin
          surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
        end;
        ErrorCode := 10;
      end;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ TBatterSanyanEff }

constructor TBatterSanyanEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
begin
  inherited;
  n01 := GetTickCount;
  n02 := 0;
  m_BoFirst := True;
  m_nfX := 0;
  m_nfY := 0;
end;

procedure TBatterSanyanEff.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
  ErrorCode: integer;
begin
  try
    ErrorCode := 0;
    if m_BoFirst then
    begin
      m_nfX := FlyX;
      m_nfY := FlyY;
    end;
    if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
    begin
      ErrorCode := 1;
      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
      ErrorCode := 2;
      if not FixedEffect then
      begin
        ErrorCode := 3;
        // �뷽���йص�ħ��Ч��
        img := EffectBase + BatterImageBase + Dir16 * 10;
        d := ImgLib.GetCachedImage(img + curframe, px, py);
        if d <> nil then
        begin // ����һ��ëֽ 20091218 �����
          surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
        end;
        if (m_nfX > FlyX) and (m_nfY = FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy, d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy, d, 1);
          end;
        end
        else if (m_nfX < FlyX) and (m_nfY = FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy, d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy, d, 1);
          end;
        end
        else if (m_nfX = FlyX) and (m_nfY > FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end
        else if (m_nfX = FlyX) and (m_nfY < FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end
        else if (m_nfX > FlyX) and (m_nfY > FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end
        else if (m_nfX < FlyX) and (m_nfY < FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end
        else if (m_nfX > FlyX) and (m_nfY < FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx + (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy - (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end
        else if (m_nfX < FlyX) and (m_nfY > FlyY) then
        begin
          if d <> nil then
          begin // ���ڶ���ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 4), FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 4), d, 1);
          end;
          if d <> nil then
          begin // ��������ëֽ 20091218 �����
            surface.DrawBlend(FlyX + px - UNITX div 2 - shx - (abs(m_nfX - FlyX) * 8), FlyY + py - UNITY div 2 - shy + (abs(m_nfY - FlyY) * 8), d, 1);
          end;
        end;
        ErrorCode := 6;
      end
      else
      begin
        ErrorCode := 7;
        img := MagExplosionBase + curframe;
        d := ImgLib.GetCachedImage(img, px, py);
        if d <> nil then
          surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
      end;
      if not m_BoFirst then
      begin
        m_nfX := FlyX;
        m_nfY := FlyY;
      end
      else
        m_BoFirst := FALSE;
    end;
  except
    DebugOutStr('TMagicEff.DrawEff:' + IntToStr(ErrorCode));
  end;
end;

{ TCustomMagicEffect }

procedure TCustomMagicEffect.PlaySound;
var
  ASound: Integer;
begin
  if not FSounded then
  begin
    if curframe = HitSoundFrame then
    begin
      if HitSound <> '' then
      begin
        ASound := StrToIntDef(HitSound, -1);
        if ASound = -1 then
          g_SoundManager.MyPlaySound(HitSound)
        else
          g_SoundManager.DXPlaySound(ASound);
      end;
      FSounded := True;
    end;
  end;
end;

function TCustomMagicEffect.Shift: Boolean;
begin
  Result := inherited;
  if not FixedEffect then
    NextFrameTime := RunFrameTime
  else
    NextFrameTime := HitFrameTime;
end;

procedure TCustomMagicEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then
  begin
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;
    if not FixedEffect then
    begin
      img := EffectBase + Dir16 * RunFrameCount;
      d := RunLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then
        surface.DrawBlend(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, 1);
    end
    else
    begin
      img := MagExplosionBase + curframe;
      d := HitLib.GetCachedImage(img, px, py);
      if d <> nil then
        surface.DrawBlend(FlyX + px - UNITX div 2, FlyY + py - UNITY div 2, d, 1);
    end;
  end;
end;

{ TFallowActionEffect }

constructor TFallowActionEffect.Create(Actor: TObject; Lib: TWMImages;
  ImageIndex,FrameCount, SkipDir: Integer);
begin
  MagOwner := Actor;
  start := ImageIndex;
  FSkipPerDir := SkipDir;
  ImgLib := Lib;
  m_dwStartTime := GetTickCount;
  Frame := FrameCount;
  FixedEffect := True;
  NextFrameTime := 10000;
end;

procedure TFallowActionEffect.DrawEff(surface: TAsphyreCanvas);
var
  Actor : TActor;
  nFrameIndex : Integer;
  Index:Integer;
  nPx,nPy:Integer;
  D: TAsphyreLockableTexture;
  Shx,shy:Integer;
begin
  if MagOwner <> nil then
    Actor := TActor(MagOwner);
  nFrameIndex := Actor.GetCurrentActionFrameIndex();
  if Actor.m_nCurrentAction = FBindAction then
  begin
    if not FEffectStart then
      FEffectStart := True;
    Index :=  start + (Actor.m_btDir * (FSkipPerDir + frame) ) + nFrameIndex;
    if ImgLib <> nil then
    begin
      //Writeln('TFallowActionEffect : ' + IntToStr(Index));
      D := ImgLib.GetCachedImage(Index,nPx,nPy);
      if D <> nil then
      begin
        Shx := Actor.m_nCurrX;
        shy := Actor.m_nCurrY;
        PlayScene.ScreenXYfromMCXY(Shx,shy,Shx,shy);

        shx := Actor.m_nShiftX + Shx;
        shy := Actor.m_nShifty + Shy;
        surface.DrawBlendEffect(shx + nPx, shy + nPy,D,FDrawBlendMode);
      end;
    end;
  end;
end;

function TFallowActionEffect.Run: Boolean;
begin
  Result := True;
  if MagOwner = nil then
  begin
    Result := False;
    Exit;
  end;

  if not FEffectStart then
  begin
    //ʮ�������Ч��û��ʼ�͹���
    if GetTickCount - m_dwStartTime >= 10 * 1000  then
    begin
      Result:= False;
      Exit;
    end;
  end else
  begin
    if TActor(MagOwner).m_nCurrentAction <> FBindAction then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

function TFallowActionEffect.Shift: Boolean;
begin
  // ɶҲ����
end;

{ TFlyEffect }

constructor TFlyEffect.Create(SourceObject,TargetObject:TObject;Lib:TWMImages;ImageIndex:Integer;FrameTime:Cardinal;FrameCount:Integer);
var
  L:Real;
begin
  ImgLib := Lib;
  start := ImageIndex;
  MagOwner := SourceObject;
  TargetActor := TargetObject;
  Frame := FrameCount;
  Repetition := True;
  NextFrameTime := FrameCount;

  Light := 1;
  m_dwStartTime := GetTickCount;
  FlySpeed := 1.3;
end;

procedure TFlyEffect.DrawEff(surface: TAsphyreCanvas);
var
  img: integer;
  d: TAsphyreLockableTexture;
  shx, shy: integer;
begin
  if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15)) then
  begin
    //���� �ɳ�ȥ��ʱ�� ���ҵ�ǰ��λ��ƫ�� ����ƫ�ơ�
    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    img := Start + Dir16 * (Frame + SkipFramePerDir);
    d := ImgLib.GetCachedImage(img + curframe, px, py);
    if d <> nil then
    begin
      surface.DrawBlendEffect(FlyX + px - UNITX div 2 - shx, FlyY + py - UNITY div 2 - shy, d, FDrawBlendMode);
    end;
  end;
end;

procedure TFlyEffect.SetFlySpeed(Value: Single);
begin
  FlySpeed := Value;
end;

function TFlyEffect.Shift: Boolean;
  function OverThrough(olddir, newdir: integer): Boolean;
  begin
    Result := FALSE;
    if abs(olddir - newdir) >= 2 then
    begin
      Result := True;
      if ((olddir = 0) and (newdir = 15)) or ((olddir = 15) and (newdir = 0)) then
        Result := FALSE;
    end;
  end;

var
  ms, stepx, stepy: integer;
  shx, shy, passdir16: integer;
  NewXStep, NewYStep, stepxf, stepyf: Real;
  NowTime:Cardinal;
begin
  Result := True;
  NowTime := TimeGetTime();
  if Not CalcOffset then
  begin
      //��¼��Ч���г�ȥ��ʱ�� ���Լ�����Ļ��λ�á�
    FireMyselfX := g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX;
    FireMyselfY := g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY;

    TargetX := TActor(TargetActor).m_nCurrX;
    TargetY := TActor(TargetActor).m_nCurrY;
    fireX := TActor(MagOwner).m_nCurrX;
    fireY := TActor(MagOwner).m_nCurrY;

    PlayScene.ScreenXYfromMCXY(fireX, fireY, fireX, fireY);
    PlayScene.ScreenXYfromMCXY(TargetX, TargetY, TargetX, TargetY);

    fireX := fireX + TActor(MagOwner).m_nShiftX;
    fireY := fireY + TActor(MagOwner).m_nShiftY;

    Dir16 := GetFlyDirection16(fireX, fireY, TargetX, TargetY);
    OldDir16 := Dir16;
    FlyX := fireX;
    FlyY := fireY;
    OldFlyX := fireX;
    OldFlyY := fireY;
    FlyXf := fireX;
    FlyYf := FireY;
    FFlyDistance := Sqrt(Sqr(TargetX - fireX) + Sqr(TargetY - fireY));

    FXStep := (TargetX - fireX) / FFlyDistance;
    FYStep := (TargetY - fireY) / FFlyDistance;

    FFlyTime := GetFlyTime(FFlyDistance,FlySpeed);

    m_dwFrameTime := NowTime;
    FFlyStartTime := m_dwFrameTime;
    CalcOffset := True;
    prevdisx := 99999;
    prevdisy := 99999;
  end;

  //����֡��
  if NowTime - steptime > NextFrameTime then
  begin
    steptime := NowTime;
    inc(curframe);
    if curframe > frame - 1 then
      curframe := 0;
  end;


  //��ʾ����
  if not IsCrashed then
  begin
    if TargetActor <> nil then
    begin
      ms := NowTime - FFlyStartTime;
      //�ѶԷ���ʵ������ת��Ϊ ��Ļ����
      PlayScene.ScreenXYfromMCXY(TActor(TargetActor).m_nRx, TActor(TargetActor).m_nRy, TargetX, TargetY);

      shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
      shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

      //����õ�Ŀ��Ŀǰ����Ļ�Ϻ��ҵ�ʵ�����ز�ࡣ
      TargetX := TargetX + shx;
      TargetY := TargetY + shy;

      stepxf := FXStep * (ms / FFlyTime) * FFlyDistance;
      stepyf := FYStep * (ms / FFlyTime) * FFlyDistance;

      FlyXf := fireX + stepxf;
      FlyYf := fireY + stepyf;
      FlyX := Round(FlyXf);
      FlyY := Round(FlyYf);

      OldFlyX := FlyX;
      OldFlyY := FlyY;

      //�������ʱ��� ���е�Ŀ�� �ж��Ƿ�ﵽĿ�ꡣ
      passdir16 := GetFlyDirection16(FlyX, FlyY, TargetX, TargetY);
      if (ms >= FFlyTime) or ((abs(TargetX - FlyX) <= 15) and (abs(TargetY - FlyY) <= 15)) or ((abs(TargetX - FlyX) >= prevdisx) and (abs(TargetY - FlyY) >= prevdisy)) or OverThrough(OldDir16, passdir16) then
      begin
        IsCrashed := True;
      end
      else
      begin
        prevdisx := abs(TargetX - FlyX);
        prevdisy := abs(TargetY - FlyY);
      end;
      OldDir16 := passdir16;
    end
    else
    begin
      ms := NowTime - m_dwFrameTime;
      stepx := Round(FXStep * ms / FlySpeed);
      stepy := Round(FYStep * ms / FlySpeed);
      FlyX := fireX + stepx;
      FlyY := fireY + stepy;
    end;
  end else
  begin
    Result := False;
  end;


end;

{ TPlayAnimationEffect }

constructor TPlayAnimationEffect.Create(Actor:TObject;Lib:TWMImages;ImageIndex,FrameCount:Integer;FrameTime:Cardinal);
begin
  EventDraw := False;
  ObjectID := Actor;
  if Actor <> nil then
  begin
    FlyX := TActor(Actor).m_nCurrX;
    FlyY := TActor(Actor).m_nCurrY;
  end else
  begin
    FlyX := 0;
    FlyY := 0;
  end;
  ImgLib := Lib;
  start := 0;
  EffectBase := ImageIndex;
  frame := FrameCount;
  NextFrameTime := FrameTime;
  steptime := GetTickCount;
  boDrawBlend := True;
end;

destructor TPlayAnimationEffect.Destroy;
begin
  if FFrameTimeList <> nil then
    FFrameTimeList.Free;
  inherited;
end;

procedure TPlayAnimationEffect.DrawEff(surface: TAsphyreCanvas);
var
  d: TAsphyreLockableTexture;
  RX, RY, nRx, nRy, nPx, nPy: integer;
  Index:Integer;
begin
  try
    if EventDraw then
    begin
        d := ImgLib.GetCachedImage(EffectBase + curframe, nPx, nPy);
        if d <> nil then
        begin
          nRx := FlyX;
          nRy := FlyY;
          surface.DrawBlendEffect(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d, FDrawBlendMode);
        end;
    end else
    begin
      if FBoAddToScene then
      begin
        d := ImgLib.GetCachedImage(EffectBase + curframe, nPx, nPy);
        if d <> nil then
        begin
          PlayScene.ScreenXYfromMCXY(FlyX, FlyY, nRx, nRy);
          surface.DrawBlendEffect(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d, FDrawBlendMode);
        end;
      end else
      begin
        Index := EffectBase + curframe;
        d := ImgLib.GetCachedImage(Index, nPx, nPy);
        if (d <> nil) and (ObjectID <> nil) then
        begin
          RX := TActor(ObjectID).m_nRx;
          RY := TActor(ObjectID).m_nRy;
          PlayScene.ScreenXYfromMCXY(RX, RY, nRx, nRy);
          nRx := nRx + TActor(ObjectID).m_nShiftX;
          nRy := nRy + TActor(ObjectID).m_nShiftY;
          surface.DrawBlendEffect(nRx + nPx - UNITX div 2, nRy + nPy - UNITY div 2, d, FDrawBlendMode);
        end;
      end;
    end;
  except
    DebugOutStr('TPlayAnimationEffect.DrawEff');
  end;
end;

procedure TPlayAnimationEffect.SetFrameTime(const S: String);
var
  SList: TStringList;
  i: Integer;
begin
  if FFrameTimeList <> nil then
  begin
    FFrameTimeList.Clear;
  end else
  begin
    FFrameTimeList := TList<Integer>.Create;
  end;

  SList := TStringList.Create;
  SList.Delimiter := ',';
  SList.DelimitedText := S;

  for i := 0 to SList.Count - 1 do
  begin
    FFrameTimeList.Add(StrToIntDef(SList[i],0));
  end;

  SList.Free;

  curframe := 0;
end;

procedure TPlayAnimationEffect.SetIsSceneEffect;
begin
  FBoAddToScene := True;
end;

function TPlayAnimationEffect.Shift: Boolean;

var
  TimeIndex:Integer;
  FrameTime:Integer;
  function NowFrameTime():Integer;
  begin
    TimeIndex := Min(Max(0,curframe - start),FFrameTimeList.Count - 1);
    Result := FFrameTimeList[TimeIndex];
  end;
begin
  Result := True;
  //֧��ÿ֡ʱ�䲻һ��
  if FFrameTimeList <> nil then
    FrameTime := NowFrameTime
  else
    FrameTime := NextFrameTime;

  if GetTickCount - steptime > FrameTime then
  begin
    steptime := GetTickCount;
    inc(curframe);
    if curframe > start + frame - 1 then
    begin
      Result := False;
    end;
  end;


  if (not Result) and Repetition then
  begin
    if curframe > start + frame - 1 then
    begin
      curframe := start;
      Result := True;
    end;
  end;
end;

end.
