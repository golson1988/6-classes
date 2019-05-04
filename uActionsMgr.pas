unit uActionsMgr;

interface

type
  TActionInfo = packed record
    start: Word;// ��ʼ֡
    frame: Word;// ֡��
    skip: Word;// ������֡��
    ftime: Word; //ÿ֡���ӳ�ʱ��
  end;
  pTActionInfo = ^TActionInfo;

  // ��ҵĶ�������
  THumanAction = record
    ActStand: TActionInfo; // 1
    ActWalk: TActionInfo; // 8
    ActRun: TActionInfo; // 8
    ActRushLeft: TActionInfo;
    ActRushRight: TActionInfo;
    ActWarMode: TActionInfo; // 1
    ActBatter: TActionInfo;
    ActHit: TActionInfo; // 6
    ActHeavyHit: TActionInfo; // 6
    ActBigHit: TActionInfo; // 6
    ActSpell: TActionInfo; // 6
    ActSitdown: TActionInfo; // 1
    ActStruck: TActionInfo; // 3
    ActDie: TActionInfo; // 4
    ActCircinate: TActionInfo;
    ActFireDragon: TActionInfo;
    ActSpurn: TActionInfo;
    ActSneak: TActionInfo;
    ActShamanHit: TActionInfo;
    ActShamanPush: TActionInfo;
    ActJumpHit : TActionInfo; //�̿���������
  end;
  pTHumanAction = ^THumanAction;

  TMonsterAction = record
    ActShow: TActionInfo;
    ActHide: TActionInfo;
    ActStand: TActionInfo;
    ActWalk: TActionInfo;
    ActAttack: TActionInfo;
    ActCritical: TActionInfo;
    ActStruck: TActionInfo;
    ActDie: TActionInfo;
    ActDeath: TActionInfo;
  end;
  pTMonsterAction = ^TMonsterAction;

  TMonActionManager = class

  end;

const
  // ���ද������
  // ÿ������ÿ������ÿ���Ա�600��ͼ
  // �輶��=L���Ա�=S����ʼ֡=L*600+600*S

  // Start:�ö�������������µĿ�ʼ֡
  // frame:�ö�����Ҫ��֡��
  // skip:������֡��
  HA: THumanAction = ( // ��ʼ֡       ��Ч֡     ����֡    ÿ֡�ӳ�
    ActStand: (start: 0; frame: 4; skip: 4; ftime: 200);  //վ��
    ActWalk: (start: 64; frame: 6; skip: 2; ftime: 90);  //����
    ActRun: (start: 128; frame: 6; skip: 2; ftime: 120); //��
    ActRushLeft: (start: 128; frame: 3; skip: 5; ftime: 120);  //����
    ActRushRight: (start: 131; frame: 3; skip: 5; ftime: 120); //�ҳ��
    ActWarMode: (start: 192; frame: 1; skip: 0; ftime: 200); // �ӵ���ȴ
        //�̿Ͷ���
    ActBatter: (start: 80; frame: 8; skip: 2; ftime: 60); //����
    ActHit: (start: 200; frame: 6; skip: 2; ftime: 85); //����
    ActHeavyHit: (start: 264; frame: 6; skip: 2; ftime: 90); //�ػ�
    ActBigHit: (start: 328; frame: 8; skip: 0; ftime: 70);//���
    ActSpell: (start: 392; frame: 6; skip: 2; ftime: 60); //ʩ��
    ActSitdown: (start: 456; frame: 2; skip: 0; ftime: 300);//��ȡ
    ActStruck: (start: 472; frame: 3; skip: 5; ftime: 70); //�ܻ�
    ActDie: (start: 536; frame: 4; skip: 4; ftime: 120); //����

    ActCircinate:(start: 616; frame:10; skip: 0; ftime: 80);  //���ֹ���
    ActFireDragon:(start: 696; frame:6; skip: 2; ftime: 80); //������
    ActSpurn:(start: 760; frame:8; skip: 0; ftime: 80);    //������
    ActSneak:(start: 824; frame:6; skip: 2; ftime: 80);   //Ǳ��
    ActShamanHit:(start: 600; frame:8; skip: 0; ftime: 80);  //��ɮ�Ĺ���
    ActShamanPush:(start: 664; frame:6; skip: 2; ftime: 80);  //��ɮ������
    ActJumpHit:(start:328;frame:8;skip:0; ftime:100); //�̿���������

    );

  MA9: TMonsterAction = ( // 4C03D4
    ActStand: (start: 0; frame: 1; skip: 7; ftime: 200); ActWalk: (start: 64; frame: 6; skip: 2; ftime: 120);
    ActAttack: (start: 64; frame: 6; skip: 2; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 64; frame: 6; skip: 2; ftime: 100); ActDie: (start: 0; frame: 1; skip: 7; ftime: 140);
    ActDeath: (start: 0; frame: 1; skip: 7; ftime: 0););
  MA10: TMonsterAction = ( // (8Frame) ������ʿ
    // ÿ������8֡    //����������Ʋ�������м��֣�//������280��
    ActStand: (start: 0; frame: 4; skip: 4; ftime: 200); ActWalk: (start: 64; frame: 6; skip: 2; ftime: 120);
    ActAttack: (start: 128; frame: 4; skip: 4; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 192; frame: 2; skip: 0; ftime: 100); ActDie: (start: 208; frame: 4; skip: 4; ftime: 140);
    ActDeath: (start: 272; frame: 1; skip: 0; ftime: 0););
  MA11: TMonsterAction = ( // �罿(10Frame¥��)  //ÿ������10֡ //280,(360��),440,430,,
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 120);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 140);
    ActDeath: (start: 340; frame: 1; skip: 0; ftime: 0););
  MA12: TMonsterAction = ( // ���, ������ �ӵ� ������.//ÿ������8֡��ÿ������8�����򣬹�7�ֶ��� (280),360,440,430,,
    ActStand: (start: 0; frame: 4; skip: 4; ftime: 200); ActWalk: (start: 64; frame: 6; skip: 2; ftime: 120);
    ActAttack: (start: 128; frame: 6; skip: 2; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 192; frame: 2; skip: 0; ftime: 150); ActDie: (start: 208; frame: 4; skip: 4; ftime: 160);
    ActDeath: (start: 272; frame: 1; skip: 0; ftime: 0););
  MA13: TMonsterAction = ( // mon2.wil�е�ʳ�˻�
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200);
    // ��mon2.wil���Կ���ʳ�˻�,actstand��ʳ�˻�վ��״̬
    ActWalk: (start: 10; frame: 8; skip: 2; ftime: 160);
    // actwalkʵ������ʳ�˻�վ������������Ч��ע�⵽��β������ʵ��һЩobjects.wil����Ҳ������tiles
    // ʯĹʬ�������ʱ�ĵ�ͼЧ������ʳ�˻���Ч�����������ƣ���֪�������Ķ��������ǲ���Ҳ����ma13
    ActAttack: (start: 30; frame: 6; skip: 4; ftime: 120);
    // actattack��30��ʼ�ǴӸ�����λ������Ч��
    ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    // actcritical���������ȥ
    ActStruck: (start: 110; frame: 2; skip: 0; ftime: 100);
    // ����110��ʼ����
    ActDie: (start: 130; frame: 10; skip: 0; ftime: 120);
    // 130��ʼ����Ч��
    ActDeath: (start: 20; frame: 9; skip: 0; ftime: 150);
    // 20��ʼ��ʳ�˻�������Ч��Ҳ��������Ч�������������ã���ֻ��9֡���һ֡��ȥ
  );
  MA14: TMonsterAction = ( // �ذ� ���� mon3���������սʿ,,��������ͬma13
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 340; frame: 10; skip: 0; ftime: 100); // ����ΰ��(��ȯ)
  );
  MA15: TMonsterAction = ( // ����ս��??�����⣺Դ�����жԹ���ķ����߼��ǲ��Ǿ���mon*.wil�ķ����߼�
    // ��ע�⵽����սʿ������û��,�����Ŀ��Ǻ��꣬���ѵ���Ҳ��hum.wilһ��Ҫ��weapon.wil�ҹ����ܹ�������������?
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 120);
    // die��death��ʲô����???һ����������ʼ����һ�����ڵ����ϵĲк�??���ǰ�����˵������߼����԰�!!
    ActDeath: (start: 1; frame: 1; skip: 0; ftime: 100););
  MA16: TMonsterAction = ( // ������� ������  mon5����ĵ罩ʬ����������ƶ���ħ�����������Ĺ���һ��??
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 160); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 4; skip: 6; ftime: 160);
    ActDeath: (start: 0; frame: 1; skip: 0; ftime: 160););
  MA17: TMonsterAction = ( // �ٵ������� ��  mon6�еĺ��н�������ʯĹʬ������һ����
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 60); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 100);
    ActDeath: (start: 340; frame: 1; skip: 0; ftime: 140); //
  );
  MA19: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 140);
    ActDeath: (start: 340; frame: 1; skip: 0; ftime: 140); //
  );
  MA20: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 100);
    ActDeath: (start: 340; frame: 10; skip: 0; ftime: 170););
  MA21: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 10; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 20; frame: 2; skip: 0; ftime: 100); ActDie: (start: 30; frame: 10; skip: 0; ftime: 160);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA22: TMonsterAction = (ActStand: (start: 80; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 160; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 240; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 320; frame: 2; skip: 0; ftime: 100); ActDie: (start: 340; frame: 10; skip: 0; ftime: 160);
    ActDeath: (start: 0; frame: 6; skip: 4; ftime: 170););
  MA23: TMonsterAction = (ActStand: (start: 20; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 100; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 180; frame: 6; skip: 4; ftime: 100); //
    ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0); ActStruck: (start: 260; frame: 2; skip: 0; ftime: 100);
    ActDie: (start: 280; frame: 10; skip: 0; ftime: 160); ActDeath: (start: 0; frame: 20; skip: 0; ftime: 100););
  MA24: TMonsterAction = ( // (����) mon14�е�Ы��??ͨ�����µķ��������ֲ���?
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 240; frame: 6; skip: 4; ftime: 100);
    ActStruck: (start: 320; frame: 2; skip: 0; ftime: 100); ActDie: (start: 340; frame: 10; skip: 0; ftime: 140);
    ActDeath: (start: 420; frame: 1; skip: 0; ftime: 140); //
  );
  MA25: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 70; frame: 10; skip: 0; ftime: 200);
    ActAttack: (start: 20; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 10; frame: 6; skip: 4; ftime: 120);
    ActStruck: (start: 50; frame: 2; skip: 0; ftime: 100); ActDie: (start: 60; frame: 10; skip: 0; ftime: 200);
    ActDeath: (start: 80; frame: 10; skip: 0; ftime: 200););

  MA26: TMonsterAction = (ActStand: (start: 0; frame: 1; skip: 7; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 160);
    ActAttack: (start: 56; frame: 6; skip: 2; ftime: 500); ActCritical: (start: 64; frame: 6; skip: 2; ftime: 500);
    ActStruck: (start: 0; frame: 4; skip: 4; ftime: 100); ActDie: (start: 24; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 150););
  MA27: TMonsterAction = (ActStand: (start: 0; frame: 1; skip: 7; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 160);
    ActAttack: (start: 0; frame: 0; skip: 0; ftime: 250); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 250);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 100); ActDie: (start: 0; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 150););
  MA28: TMonsterAction = (ActStand: (start: 80; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 160; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 0; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 100););
  MA29: TMonsterAction = (ActStand: (start: 80; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 160; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 240; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActStruck: (start: 320; frame: 2; skip: 0; ftime: 100); ActDie: (start: 340; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 100););
  MA30: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 10; skip: 0; ftime: 200);
    ActAttack: (start: 10; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 10; frame: 6; skip: 4; ftime: 120);
    ActStruck: (start: 20; frame: 2; skip: 0; ftime: 100); ActDie: (start: 30; frame: 20; skip: 0; ftime: 150);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 200););
  MA31: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 10; skip: 0; ftime: 200);
    ActAttack: (start: 10; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 0; frame: 6; skip: 4; ftime: 120);
    ActStruck: (start: 0; frame: 2; skip: 8; ftime: 100); ActDie: (start: 20; frame: 10; skip: 0; ftime: 200);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 200););
  MA32: TMonsterAction = (ActStand: (start: 0; frame: 1; skip: 9; ftime: 200); ActWalk: (start: 0; frame: 6; skip: 4; ftime: 200);
    ActAttack: (start: 0; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 0; frame: 6; skip: 4; ftime: 120);
    ActStruck: (start: 0; frame: 2; skip: 8; ftime: 100); ActDie: (start: 80; frame: 10; skip: 0; ftime: 80);
    ActDeath: (start: 80; frame: 10; skip: 0; ftime: 200););
  MA33: TMonsterAction = (
    // ��ʼ֡    ��Ч֡    ����֡   ÿ֡�ӳ�
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200);
    // actstand��վ��״̬
    ActWalk: (start: 80; frame: 6; skip: 4; ftime: 200); ActAttack: (start: 160; frame: 6; skip: 4; ftime: 120);
    // actattack��30��ʼ�ǴӸ�����λ������Ч��
    ActCritical: (start: 340; frame: 6; skip: 4; ftime: 120); ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100);
    ActDie: (start: 260; frame: 10; skip: 0; ftime: 200); ActDeath: (start: 260; frame: 10; skip: 0; ftime: 200););
  MA34: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 200);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 120); ActCritical: (start: 320; frame: 6; skip: 4; ftime: 120);
    ActStruck: (start: 400; frame: 2; skip: 0; ftime: 100); ActDie: (start: 420; frame: 20; skip: 0; ftime: 200);
    ActDeath: (start: 420; frame: 20; skip: 0; ftime: 200););
  MA35: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 30; frame: 10; skip: 0; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 1; skip: 9; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA36: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 30; frame: 20; skip: 0; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 1; skip: 9; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA37: TMonsterAction = (ActStand: (start: 30; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 30; frame: 4; skip: 6; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 1; skip: 9; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA38: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 80; frame: 6; skip: 4; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA39: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 300); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 10; frame: 6; skip: 4; ftime: 150); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 20; frame: 2; skip: 0; ftime: 150); ActDie: (start: 30; frame: 10; skip: 0; ftime: 80);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA40: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 250); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 210);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 110); ActCritical: (start: 580; frame: 20; skip: 0; ftime: 135);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 120); ActDie: (start: 260; frame: 20; skip: 0; ftime: 130);
    ActDeath: (start: 260; frame: 20; skip: 0; ftime: 130););
  MA41: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 0; frame: 0; skip: 0; ftime: 0); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA42: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 10; frame: 8; skip: 2; ftime: 160);
    ActAttack: (start: 0; frame: 0; skip: 0; ftime: 0); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 30; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 30; frame: 10; skip: 0; ftime: 150););
  MA43: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 160); ActCritical: (start: 160; frame: 6; skip: 4; ftime: 160);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 150); ActDie: (start: 260; frame: 10; skip: 0; ftime: 120);
    ActDeath: (start: 340; frame: 10; skip: 0; ftime: 100););
  MA44: TMonsterAction = (ActStand: (start: 0; frame: 10; skip: 0; ftime: 300); ActWalk: (start: 10; frame: 6; skip: 4; ftime: 150);
    ActAttack: (start: 20; frame: 6; skip: 4; ftime: 150); ActCritical: (start: 40; frame: 10; skip: 0; ftime: 150);
    ActStruck: (start: 40; frame: 2; skip: 8; ftime: 150); ActDie: (start: 30; frame: 6; skip: 4; ftime: 150);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA45: TMonsterAction = (ActStand: (start: 0; frame: 10; skip: 0; ftime: 300); ActWalk: (start: 0; frame: 10; skip: 0; ftime: 300);
    ActAttack: (start: 10; frame: 10; skip: 0; ftime: 300); ActCritical: (start: 10; frame: 10; skip: 0; ftime: 100);
    ActStruck: (start: 0; frame: 1; skip: 9; ftime: 300); ActDie: (start: 0; frame: 1; skip: 9; ftime: 300);
    ActDeath: (start: 0; frame: 1; skip: 9; ftime: 300););
  MA46: TMonsterAction = (ActStand: (start: 0; frame: 20; skip: 0; ftime: 100); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 0; frame: 0; skip: 0; ftime: 0); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  { MA47: TMonsterAction = (//4C0A4C ��Ѫ����
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200);
    ActWalk:(Start:80;  frame:6;  skip:4;  ftime:200);
    ActAttack:(Start:160;  frame:6;  skip:4;  ftime:120);
    ActCritical:(Start:260;  frame:6;  skip:4;  ftime:120);
    ActStruck:(Start:240;  frame:2;  skip:0;  ftime:100);
    ActDie:(Start:524;  frame:6;  skip:0;  ftime:200);
    ActDeath:(Start:524;  frame:6;  skip:0;  ftime:200);
    ); }
  MA49: TMonsterAction = (ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 160); ActCritical: (start: 340; frame: 6; skip: 4; ftime: 160);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 160);
    ActDeath: (start: 420; frame: 4; skip: 6; ftime: 200););
  MA50: TMonsterAction = ( // ѩ��
    ActStand: (start: 0; frame: 10; skip: 0; ftime: 60); ActWalk: (start: 0; frame: 10; skip: 0; ftime: 60);
    ActAttack: (start: 0; frame: 10; skip: 0; ftime: 60); ActCritical: (start: 0; frame: 10; skip: 0; ftime: 60);
    ActStruck: (start: 0; frame: 10; skip: 0; ftime: 60); ActDie: (start: 0; frame: 10; skip: 0; ftime: 60);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 60););
  MA51: TMonsterAction = ( // ѩ��
    ActStand: (start: 0; frame: 1; skip: 0; ftime: 60); ActWalk: (start: 0; frame: 1; skip: 0; ftime: 60);
    ActAttack: (start: 0; frame: 1; skip: 0; ftime: 60); ActCritical: (start: 0; frame: 1; skip: 0; ftime: 60);
    ActStruck: (start: 0; frame: 1; skip: 0; ftime: 60); ActDie: (start: 0; frame: 1; skip: 0; ftime: 60);
    ActDeath: (start: 0; frame: 1; skip: 0; ftime: 60););
  MA61: TMonsterAction = ( // ������
    ActStand: (start: 0; frame: 20; skip: 0; ftime: 200); ActWalk: (start: 0; frame: 20; skip: 0; ftime: 200);
    ActAttack: (start: 0; frame: 20; skip: 0; ftime: 200); ActCritical: (start: 0; frame: 20; skip: 0; ftime: 200);
    ActStruck: (start: 0; frame: 20; skip: 0; ftime: 200); ActDie: (start: 0; frame: 20; skip: 0; ftime: 200);
    ActDeath: (start: 0; frame: 20; skip: 0; ftime: 200););
  MA63: TMonsterAction = ( // ʥ������
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 4; skip: 6; ftime: 200);
    ActAttack: (start: 0; frame: 4; skip: 6; ftime: 200); ActCritical: (start: 0; frame: 4; skip: 6; ftime: 200);
    ActStruck: (start: 0; frame: 4; skip: 6; ftime: 200); ActDie: (start: 0; frame: 4; skip: 6; ftime: 200);
    ActDeath: (start: 0; frame: 4; skip: 6; ftime: 200););
  MA70: TMonsterAction = ( // �����ʼ�NPC
    ActStand: (start: 0; frame: 4; skip: 0; ftime: 200); ActWalk: (start: 0; frame: 4; skip: 0; ftime: 200);
    ActAttack: (start: 0; frame: 4; skip: 0; ftime: 200); ActCritical: (start: 0; frame: 4; skip: 0; ftime: 200);
    ActStruck: (start: 0; frame: 4; skip: 0; ftime: 200); ActDie: (start: 0; frame: 4; skip: 0; ftime: 200);
    ActDeath: (start: 0; frame: 4; skip: 0; ftime: 200););
  MA71: TMonsterAction = ( // �ƹ�3������NPC 20080308
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 10; frame: 19; skip: 0; ftime: 200); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA93: TMonsterAction = ( // �������� 200808012
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 340; frame: 10; skip: 0; ftime: 160);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 160);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA94: TMonsterAction = ( // ѩ�򺮱�ħ��ѩ������ħ��ѩ���嶾ħ
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160);
    ActAttack: (start: 160; frame: 6; skip: 4; ftime: 100); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100); ActDie: (start: 260; frame: 10; skip: 0; ftime: 160);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA95: TMonsterAction = ( // �����ػ���
    ActStand: (start: 3; frame: 1; skip: 0; ftime: 0); ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 8; frame: 10; skip: 2; ftime: 160); ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 0; skip: 0; ftime: 0); ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0););
  MA100: TMonsterAction = ( // ����
    ActStand: (start: 360; frame: 4; skip: 6; ftime: 200); ActWalk: (start: 440; frame: 6; skip: 4; ftime: 200);
    ActAttack: (start: 520; frame: 6; skip: 4; ftime: 160);

    ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0); ActStruck: (start: 600; frame: 2; skip: 0; ftime: 100); // �ܹ���
    ActDie: (start: 620; frame: 6; skip: 4; ftime: 130); ActDeath: (start: 0; frame: 10; skip: 0; ftime: 100););

  MA111: TMonsterAction = (
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200);
    ActWalk: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActAttack: (start: 30; frame: 10; skip: 0; ftime: 150);
    ActCritical: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActStruck: (start: 0; frame: 1; skip: 9; ftime: 0);
    ActDie: (start: 0; frame: 0; skip: 0; ftime: 0);
    ActDeath: (start: 0; frame: 0; skip: 0; ftime: 0);
  );
  MA112: TMonsterAction = (//�ƹ��޹���
    ActStand: (start: 0; frame: 4; skip: 6; ftime: 200);
    ActWalk: (start: 80; frame: 6; skip: 4; ftime: 160); //
    ActAttack: (start: 0; frame: 0; skip: 0; ftime: 150);
    ActCritical: (start: 340; frame: 6; skip: 4; ftime: 100);
    ActStruck: (start: 240; frame: 2; skip: 0; ftime: 100);
    ActDie: (start: 260; frame: 10; skip: 0; ftime: 140);
    ActDeath: (start: 340; frame: 1; skip: 0; ftime: 140); //
  );
  MAGate:  TMonsterAction = ( // ѩ��
    ActStand: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActWalk: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActAttack: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActCritical: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActStruck: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActDie: (start: 0; frame: 10; skip: 0; ftime: 100);
    ActDeath: (start: 0; frame: 10; skip: 0; ftime: 100);
  );
  MAGate1:  TMonsterAction = ( // ѩ��
    ActStand: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActWalk: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActAttack: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActCritical: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActStruck: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActDie: (start: 0; frame: 6; skip: 4; ftime: 100);
    ActDeath: (start: 0; frame: 6; skip: 4; ftime: 100);
  );


  { ------------------------------------------------------------------------------ }
  // ��������˳�� (�Ƿ������������: 0��/1��)
  // WEAPONORDERS: array [Sex, FrameIndex] of Byte
  { ------------------------------------------------------------------------------ }
  WORDER: Array [0 .. 1, 0 .. 887] of byte = ( // 1: Ů,  0: ��
    // ��һά���Ա𣬵ڶ�ά�Ƕ���ͼƬ����
    ( // ��
    // վ
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1,
    // ��
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1,
    // ��
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1,
    // war���
    0, 1, 1, 1, 0, 0, 0, 0,
    // ��
    1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1,
    // �� 2
    0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1,
    1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1,
    // ��3
    1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1,
    0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0,
    // ����
    0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0,
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1,
    0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1,
    // �ر�
    0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0,
    // �±�
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1,
    // ������
    0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1,
    //�̿�
    1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,1,1,0,0,1,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,0,
    0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,1,0,1,1,0,0,0,0,1,0,1,
    1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,1,1,0,0,0,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0
    ),
    (
    // ����
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0,
    1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1,
    // �ȱ�
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1,
    // �ٱ�
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0,
    0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1,
    // war���
    1, 1, 1, 1, 0, 0, 0, 0,
    // ����
    1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1,
    // ���� 2
    0, 1, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1,
    1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1, 1,
    // ����3
    1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1,
    0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0,
    // ����
    0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0,
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1,
    0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1,
    // �ر�
    0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0,
    // �±�
    0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1,
    // ������
    0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
    1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1,
    //�̿�
    1,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,1,0,0,0,0,0,1,1,0,0,1,0,1,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,0,
    0,0,0,1,0,0,1,0,0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,1,0,1,1,0,0,0,0,1,0,1,
    1,0,0,0,0,1,0,0,1,1,0,0,0,1,0,0,1,1,0,0,0,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0
    ));
var
WORDER_CKR : Array[0..1,0..887] of Byte = (
(
0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,
0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,0,
1,0,1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,
1,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,1,1,0,1,0,0,
0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,
1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,0,1,0,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,
0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,1,1,1,1,0,0,0,1,0,0,0,1,1,1,1,
1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,
0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,1,1,0,0,1,
1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0),
(
0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,
0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,0,
1,0,1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,
1,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,1,1,0,1,0,0,
0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,
1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,0,1,0,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,
0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,1,1,1,1,0,0,0,1,0,0,0,1,1,1,1,
1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,
0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,1,1,0,0,1,
1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0
));



WORDER_CKL : Array[0..1,0..887] of Byte = (
(
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,
1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,
0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,
1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,1,1,1,0,1,0,0,1,1,0,1,1,0,0,0,
1,1,0,1,1,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,
1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,0,1,1,0,0,0,0,1,1,0,1,0,0,1,1,0,0,1,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,
0,0,1,1,1,1,0,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,
1,1,0,0,0,0,1,0,0,1,1,0,0,0,1,1,0,0,0,0,1,1,0,0,1,1,0,1,1,1,0,0,1,0,0,1,1,1,0,0,
1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,
1,0,1,1,1,1,0,0,1,1,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,0,0,1,0,0,1,1,1,
0,0,1,0,0,0,1,0,0,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0),
(
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,1,
1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1,0,0,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,
0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,
1,1,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,1,1,1,0,1,0,0,1,1,0,1,1,0,0,0,
1,1,0,1,1,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,
1,1,1,0,1,1,1,1,0,1,1,1,1,1,1,1,0,0,1,1,0,1,1,0,0,0,0,1,1,0,1,0,0,1,1,0,0,1,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,0,
0,0,1,1,1,1,0,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,
1,1,0,0,0,0,1,0,0,1,1,0,0,0,1,1,0,0,0,0,1,1,0,0,1,1,0,1,1,1,0,0,1,0,0,1,1,1,0,0,
1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,
1,0,1,1,1,1,0,0,1,1,0,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0,1,1,1,1,0,0,1,0,0,1,1,1,
0,0,1,0,0,0,1,0,0,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0
));



var
     //������
WORDER_ARCHER : Array[0..1,0..887] of Byte = (
(
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,
0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,0,
1,0,1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,
1,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,1,1,0,1,0,0,
0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,
1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,0,1,0,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,
0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,1,1,1,1,0,0,0,1,0,0,0,1,1,1,1,
1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,
0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,1,1,0,0,1,
1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0),
(
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,
1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,
0,0,0,1,1,0,0,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,0,0,1,0,0,1,1,1,0,0,1,0,0,
1,0,1,1,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,
1,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,1,0,0,1,0,0,0,0,1,1,0,1,0,0,
0,0,1,1,1,1,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,0,1,0,1,0,1,1,0,0,0,0,1,1,1,1,1,0,0,0,
1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,1,0,1,0,0,1,1,1,1,0,1,1,0,1,1,0,1,0,1,1,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,
1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,0,0,0,0,
0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,
0,0,0,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,0,1,1,1,1,0,0,0,1,0,0,0,1,1,1,1,
1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,
0,0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,0,0,0,1,0,1,1,1,0,0,0,1,0,0,1,1,0,0,1,
1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,
0,0,0,0,0,0,0,0
));



implementation

end.
