unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    iFloor5: TImage;
    iFloor4: TImage;
    iFloor3: TImage;
    iFloor2: TImage;
    iFloor1: TImage;
    bToFindWay: TButton;
    mEscapePlan: TMemo;
    iSign5: TImage;
    iSign4: TImage;
    iSign3: TImage;
    iSign2: TImage;
    iSign1: TImage;
    lMapFloor5: TLabel;
    lMapFloor4: TLabel;
    lMapFloor3: TLabel;
    lMapFloor2: TLabel;
    lMapFloor1: TLabel;
    lMainPlan: TLabel;
    rgColorQuestion: TRadioGroup;
    rgSeeItemQuestion: TRadioGroup;
    lQuestionFound: TLabel;
    eQuestionFoundAns: TEdit;
    mExplainBoard: TMemo;
    rgTimeQuestion: TRadioGroup;
    lYou101: TLabel;
    lYou102: TLabel;
    lYou103: TLabel;
    lYou104: TLabel;
    lYou105: TLabel;
    lYou106: TLabel;
    lYou107: TLabel;
    lYou201: TLabel;
    lYou202: TLabel;
    lYou203: TLabel;
    lYou204: TLabel;
    lYou205: TLabel;
    lYou206: TLabel;
    lYou207: TLabel;
    lYou301: TLabel;
    lYou302: TLabel;
    lYou303: TLabel;
    lYou304: TLabel;
    lYou305: TLabel;
    lYou401: TLabel;
    lYou402: TLabel;
    lYou403: TLabel;
    lYou404: TLabel;
    lYou405: TLabel;
    lYou406: TLabel;
    lYou407: TLabel;
    lYou501: TLabel;
    lYou502: TLabel;
    lYou503: TLabel;
    lYou504: TLabel;
    lYou505: TLabel;
    lYou506: TLabel;
    lYou507: TLabel;
    lWarning: TLabel;
    procedure bToFindWayClick(Sender: TObject);
    procedure rgSeeItemQuestionClick(Sender: TObject);
    procedure rgColorQuestionClick(Sender: TObject);
    procedure rgTimeQuestionClick(Sender: TObject);
    procedure eQuestionFoundAnsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  QuestionPoints: word = 0;
  DiffColoPoints: word = 0;
  DiffTimePoints: word = 0;
  DiffItemPoints: word = 0;
  DiffThingPoints: word = 0;
  NumberChar: integer;

implementation

{$R *.dfm}

// -------------------------------------------------------------------------------

procedure PrintWay1Floor(var mEscapePlan, mExplainBoard: TMemo; rgColorQuestion, rgTimeQuestion: TRadioGroup);
var
  ConNumberChar: integer;
  Counter: word;
begin
  ConNumberChar := NumberChar;

  if  rgColorQuestion.ItemIndex > 1 then
  begin
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ����� ����, ���� �� ������� ����� ������� ����� �� ��������.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� � ������� ������.');

    if (rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 3) then
    begin
      Inc(ConNumberChar);
      mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ���������� � �������.');
      Inc(ConNumberChar);
      mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ��������� ����.');

      for Counter := 1 to 2 do
        case rgTimeQuestion.ItemIndex of
          2:
          begin
            mExplainBoard.Lines.Add('  �� 4-�� � �� 2-�� �����');
            mExplainBoard.Lines.Add(' ������� ����� �� ���� �� ���������.');
            rgTimeQuestion.ItemIndex := 3;
          end;

          3:
          begin
            mExplainBoard.Lines.Add('  � ����� ������������');
            mExplainBoard.Lines.Add(' ��������� ��������� ���� �����.');
            mExplainBoard.Lines.Add(' ����� ��������� ����...');
            rgTimeQuestion.ItemIndex := 0;
          end;
        end;
    end;

    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� �� ������� (���������� �������).');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� � ������� ������.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� �� ������� (���������� �������).');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ����� ���� �� �����.');
  end;

  if rgColorQuestion.ItemIndex > 0 then
  begin
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� � ����.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ���������� �� 1-�� ���� � ������� �� �����.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ����� �����, � �����.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� � �������.')
  end;;

  if rgTimeQuestion.ItemIndex = 1 then
  begin
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ���������� � �������.');
    Inc(ConNumberChar);
    mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ��������� ������.');
    rgTimeQuestion.ItemIndex := 2;
  end;

  Inc(ConNumberChar);
  mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ������� �� ������� (���������� �����).');
  Inc(ConNumberChar);
  mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. ����� � ������ ������� �� �����.');
  Inc(ConNumberChar);
  mEscapePlan.Lines.Add(IntToStr(ConNumberChar) + '. �� �����!');
end;

// -------------------------------------------------------------------------------

procedure TForm1.bToFindWayClick(Sender: TObject);
//var FoundExit: integer;
var
  SaveStr: string;
  SaveBool: boolean;
begin
  NumberChar := 0;
  SaveBool := True;
  //FoundExit := 0;
  mEscapePlan.Lines.Clear;

  lWarning.Visible := True;

  if QuestionPoints = 4 then
  begin
    if (rgColorQuestion.ItemIndex < 3) and (rgSeeItemQuestion.ItemIndex = 1) then
    begin
      mEscapePlan.Lines.Clear;
      mEscapePlan.Lines.Add('������������ ������!');
      mEscapePlan.Lines.Add('����� ������� ����� ����� �����...');
    end
    else
    begin
      case rgColorQuestion.ItemIndex of
        0: iSign1.Visible := True;
        1: iSign2.Visible := True;
        2: iSign3.Visible := True;
        3: iSign4.Visible := True;
        4: iSign5.Visible := True;
      end;

      lMapFloor1.Visible := True;
      lMapFloor2.Visible := True;
      lMapFloor3.Visible := True;
      lMapFloor4.Visible := True;
      lMapFloor5.Visible := True;

      iFloor1.Visible := True;
      iFloor2.Visible := True;
      iFloor3.Visible := True;
      iFloor4.Visible := True;
      iFloor5.Visible := True;

      // ----------------------!!!!!!!!!!!!!!!!!----------------------------------
      case rgColorQuestion.ItemIndex of
        0:
        begin
          case rgTimeQuestion.ItemIndex of
            0:
            begin
              mExplainBoard.Lines[4] := '|  �� 4-�� ����� ���-���';
              mExplainBoard.Lines[5] := '| ��������� ������� � ���������.';
              mExplainBoard.Lines[6] := '| ������ �� �����!';
            end;

            1:
            begin
              mExplainBoard.Lines[4] := '|  �� 1-�� � �� 5-�� �����';
              mExplainBoard.Lines[5] := '| ����� ����� ����� ���.';
              mExplainBoard.Lines[6] := '| ����� ��������� ������...';
            end;

            2:
            begin
              mExplainBoard.Lines[4] := '|  �� 4-�� � �� 2-�� �����';
              mExplainBoard.Lines[5] := '| ������� ����� �� ���� �� ���������.';
              mExplainBoard.Lines[6] := '| ����� � ������!';
            end;

            3:
            begin
              mExplainBoard.Lines[4] := '|  � ����� ������������';
              mExplainBoard.Lines[5] := '| ��������� ��������� ����.';
              mExplainBoard.Lines[6] := '| ����� � ������!';
            end;
          end;
        end;

        1:
        case rgTimeQuestion.ItemIndex of
          0:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� ����� ���-���';
            mExplainBoard.Lines[5] := '| ��������� ������� � ���������.';
            mExplainBoard.Lines[6] := '| ������ �� �����!';
          end;

          1:
          begin
            mExplainBoard.Lines[4] := '|  �� 1-�� � �� 5-�� �����';
            mExplainBoard.Lines[5] := '| ����� ����� ����� ���.';
            mExplainBoard.Lines[6] := '| ����� ��������� ������...';
          end;

          2:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� � �� 2-�� �����';
            mExplainBoard.Lines[5] := '| ������� ����� �� ���� �� ���������.';
            mExplainBoard.Lines[6] := '| ����� ��������� ����...';
          end;

          3:
          begin
            mExplainBoard.Lines[4] := '|  � ����� ������������';
            mExplainBoard.Lines[5] := '| ��������� ��������� ����.';
            mExplainBoard.Lines[6] := '| ����� ��������� ����...';
          end;
        end;

        2:
        case rgTimeQuestion.ItemIndex of
          0:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� ����� ���-���';
            mExplainBoard.Lines[5] := '| ��������� ������� � ���������.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;

          1:
          begin
            mExplainBoard.Lines[4] := '|  �� 1-�� � �� 5-�� �����';
            mExplainBoard.Lines[5] := '| ����� ����� ����� ���.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;

          2:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� � �� 2-�� �����';
            mExplainBoard.Lines[5] := '| ������� ����� �� ���� �� ���������.';
            mExplainBoard.Lines[6] := '| ����� ��������� ����...';
          end;

          3:
          begin
            mExplainBoard.Lines[4] := '|  � ����� ������������';
            mExplainBoard.Lines[5] := '| ��������� ��������� ����.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;
        end;

        3:
        case rgTimeQuestion.ItemIndex of
          0:
          begin
            mExplainBoard.Lines[4] := '|  �� ����� ����� ���-���';
            mExplainBoard.Lines[5] := '| ��������� ������� � ���������.';
            mExplainBoard.Lines[6] := '| ����� ��������� ���...';
          end;

          1:
          begin
            mExplainBoard.Lines[4] := '|  �� 1-�� � �� 5-�� �����';
            mExplainBoard.Lines[5] := '| ����� ����� ����� ���.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;

          2:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� � �� 2-�� �����';
            mExplainBoard.Lines[5] := '| ������� ����� �� ���� �� ���������.';
            mExplainBoard.Lines[6] := '| ����� ��������� ����...';
          end;

          3:
          begin
            mExplainBoard.Lines[4] := '|  � ����� ������������';
            mExplainBoard.Lines[5] := '| ��������� ��������� ����.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;
        end;

        4:
        case rgTimeQuestion.ItemIndex of
          0:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� ����� ���-���';
            mExplainBoard.Lines[5] := '| ��������� ������� � ���������.';
            mExplainBoard.Lines[6] := '| ����� ���������� � ������.';
          end;

          1:
          begin
            mExplainBoard.Lines[4] := '|  �� 1-�� � �� 5-�� �����';
            mExplainBoard.Lines[5] := '| ����� ����� ����� ���.';
            mExplainBoard.Lines[6] := '| ����� ��������� ������...';
          end;

          2:
          begin
            mExplainBoard.Lines[4] := '|  �� 4-�� � �� 2-�� �����';
            mExplainBoard.Lines[5] := '| ������� ����� �� ���� �� ���������.';
            mExplainBoard.Lines[6] := '| �������� �� 3-�� �����.';
          end;

          3:
          begin
            mExplainBoard.Lines[4] := '|  � ����� ������������';
            mExplainBoard.Lines[5] := '| ��������� ��������� ����.';
            mExplainBoard.Lines[6] := '| �������� �� 2-�� �����.';
          end;
        end;
      end;

      // -------------------------------------------------------------------------
      //while FoundExit <> -1 do
      //begin
      if (rgColorQuestion.ItemIndex = 0) {or (FoundExit = 1)} then
      begin
        lYou101.Visible := False;
        lYou102.Visible := False;
        lYou103.Visible := False;
        lYou104.Visible := False;
        lYou105.Visible := False;
        lYou106.Visible := False;
        lYou107.Visible := False;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou101.Visible := True;

          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� ����).');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� � ������ ������� �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. �� �����!');

          //FoundExit := -1;
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou102.Visible := True;

          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou103.Visible := True;

          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou104.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� �����).');
          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou105.Visible := True;

          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou106.Visible := True;

          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� (������� � �������).');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou107.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� �����).');
          if rgTimeQuestion.ItemIndex = 1 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
          end;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;
      end
      else
      begin
        lYou101.Visible := False;
        lYou102.Visible := False;
        lYou103.Visible := False;
        lYou104.Visible := False;
        lYou105.Visible := False;
        lYou106.Visible := False;
        lYou107.Visible := False;
      end;

      if (rgColorQuestion.ItemIndex = 1) {or (FoundExit = 2)} then
      begin
        lYou201.Visible := False;
        lYou202.Visible := False;
        lYou203.Visible := False;
        lYou204.Visible := False;
        lYou205.Visible := False;
        lYou206.Visible := False;
        lYou207.Visible := False;


        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou201.Visible := True;

          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� �����.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou202.Visible := True;

          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou203.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou204.Visible := True;

          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou205.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� �����, ���� �� ������� ����� ������� ����� �� ��������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou206.Visible := True;

          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ����).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou207.Visible := True;

          if rgTimeQuestion.ItemIndex = 2 then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ����).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� ������.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �������).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ���� �� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;
      end
      else
      begin
        lYou201.Visible := False;
        lYou202.Visible := False;
        lYou203.Visible := False;
        lYou204.Visible := False;
        lYou205.Visible := False;
        lYou206.Visible := False;
        lYou207.Visible := False;
      end;

      if (rgColorQuestion.ItemIndex = 2) {or (FoundExit = 3)} then
      begin
        lYou301.Visible := False;
        lYou302.Visible := False;
        lYou303.Visible := False;
        lYou304.Visible := False;
        lYou305.Visible := False;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou305.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ����).');
          eQuestionFoundAns.Text := '�����';
          SaveStr := '�����';
          SaveBool := False;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou304.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ������).');
          eQuestionFoundAns.Text := '���������';
          if not SaveBool then lYou304.Visible := False;
          if SaveBool then
          begin
            SaveStr := '�����';
            SaveBool := False;
          end;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou303.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');
          eQuestionFoundAns.Text := '�������';
          if not SaveBool then lYou303.Visible := False;
          if SaveBool then
          begin
            SaveStr := '���������';
            SaveBool := False;
          end;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou301.Visible := True;
          if not SaveBool then
          begin
            eQuestionFoundAns.Text := SaveStr;
            lYou301.Visible := False;
          end;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� �� �������� ����� �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� �� �������� �� 2 ����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou302.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ����).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� �� �������� ����� �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� �� �������� �� 2 ����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);
        end;
      end
      else
      begin
        lYou301.Visible := False;
        lYou302.Visible := False;
        lYou303.Visible := False;
        lYou304.Visible := False;
        lYou305.Visible := False;
      end;

      if (rgColorQuestion.ItemIndex = 3) {or (FoundExit = 4)} then
      begin
        lYou401.Visible := False;
        lYou402.Visible := False;
        lYou403.Visible := False;
        lYou404.Visible := False;
        lYou405.Visible := False;
        lYou406.Visible := False;
        lYou407.Visible := False;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou401.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ��������� ����� ������.');

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          eQuestionFoundAns.Text := '������';
          if SaveBool then
          begin
            SaveStr := '�������';
            SaveBool := False;
          end;
        end;
        if rgSeeItemQuestion.ItemIndex = 1 then
        begin
          lYou406.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          eQuestionFoundAns.Text := '���������';
          SaveStr := '';
          SaveBool := False;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou407.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          eQuestionFoundAns.Text := '���������';
          SaveStr := '�������';
          SaveBool := False;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou402.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;
          if SaveBool then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ��������� ����� ������.');
          end;

          eQuestionFoundAns.Text := '�������';
          if not SaveBool then lYou402.Visible := False;
          if SaveBool then
          begin
            SaveStr := '������';
            SaveBool := False;
          end;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou403.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          eQuestionFoundAns.Text := '�����';
          if not SaveBool then lYou403.Visible := False;
          if SaveBool then
          begin
            SaveStr := '�������';
            SaveBool := False;
          end;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou404.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ������ �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� � ���������� �� �������� �� 2-��� �����.');

          eQuestionFoundAns.Text := '���������';
          if not SaveBool then lYou404.Visible := False;
          if SaveBool then
          begin
            SaveStr := '�����';
            SaveBool := False;
          end;
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������' then
        begin
          lYou405.Visible := True;

          if ((rgTimeQuestion.ItemIndex = 2) or (rgTimeQuestion.ItemIndex = 0)) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ����.');
          end;

          if (rgSeeItemQuestion.ItemIndex = 1) or (SaveStr = '�������') then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� ����).');
          end;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ������ �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� � ���������� �� �������� �� 2-��� �����.');
          if rgTimeQuestion.ItemIndex = 0 then rgTimeQuestion.ItemIndex := 1;
          if rgTimeQuestion.ItemIndex = 2 then rgTimeQuestion.ItemIndex := 3;
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);

          if not SaveBool then lYou405.Visible := False;
          if SaveBool then
          begin
            SaveStr := '���������';
            SaveBool := False;
          end;

          eQuestionFoundAns.Text := SaveStr;
        end;
      end
      else
      begin
        lYou401.Visible := False;
        lYou402.Visible := False;
        lYou403.Visible := False;
        lYou404.Visible := False;
        lYou405.Visible := False;
        lYou406.Visible := False;
        lYou407.Visible := False;
      end;

      if (rgColorQuestion.ItemIndex = 4) {or (FoundExit = 5)} then
      begin
        lYou501.Visible := False;
        lYou502.Visible := False;
        lYou503.Visible := False;
        lYou504.Visible := False;
        lYou505.Visible := False;
        lYou506.Visible := False;
        lYou507.Visible := False;

        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������' then
        begin
          lYou501.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ������ �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� �����.');
          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;

          SaveStr := '�������';
          SaveBool := False;
          eQuestionFoundAns.Text := '�����';
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou502.Visible := True;

          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� �����).');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� �������� (���������� �����).');

          SaveStr := '������';
          SaveBool := False;
          eQuestionFoundAns.Text := '�����';
        end;
        if rgSeeItemQuestion.ItemIndex = 1 then
        begin
          lYou503.Visible := True;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� �����).');
          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;

          SaveStr := '';
          SaveBool := False;
          eQuestionFoundAns.Text := '�����';
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '��������' then
        begin
          lYou506.Visible := True;

          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� ����).');


          if not SaveBool then lYou506.Visible := False;
          if SaveBool then
          begin
            SaveStr := '��������';
            SaveBool := False;
          end;

          eQuestionFoundAns.Text := '�����';
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou505.Visible := True;

          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� �����).');

          if not SaveBool then lYou505.Visible := False;
          if SaveBool then
          begin
            SaveStr := '�����';
            SaveBool := False;
          end;

          eQuestionFoundAns.Text := '�����';
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����' then
        begin
          lYou504.Visible := True;

          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
          end;
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� �� �����.');
          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');

          if not SaveBool then lYou504.Visible := False;
          if SaveBool then
          begin
            SaveStr := '�����';
            SaveBool := False;
          end;

          eQuestionFoundAns.Text := '������';
        end;
        if Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������' then
        begin
          lYou507.Visible := True;

          if (rgTimeQuestion.ItemIndex = 1) and (SaveBool) then
          begin
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� � ������� (���������� ����).');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ���������� � �������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ��������� ������.');
            Inc(NumberChar);
            mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ������� �� ������� (���������� �����).');
            rgTimeQuestion.ItemIndex := 2;
          end;

          Inc(NumberChar);
          mEscapePlan.Lines.Add(IntToStr(NumberChar) + '. ����� ����� � ���������� �� �������� �� 2-��� �����.');
          PrintWay1Floor(mEscapePlan, mExplainBoard, rgColorQuestion, rgTimeQuestion);

          if not SaveBool then lYou507.Visible := False;
          if SaveBool then
          begin
            SaveStr := '������';
            //SaveBool := False;
          end;

          eQuestionFoundAns.Text := SaveStr;
        end;
      end
      else
      begin
        lYou501.Visible := False;
        lYou502.Visible := False;
        lYou503.Visible := False;
        lYou504.Visible := False;
        lYou505.Visible := False;
        lYou506.Visible := False;
        lYou507.Visible := False;
      end;
      //end;
    end;
  end
  else
  begin
    mEscapePlan.Lines[0] := '';
    mEscapePlan.Lines[1] := '';
    mEscapePlan.Lines[2] := '';
    mEscapePlan.Lines[3] := '';
    mEscapePlan.Lines[4] := '';
  end;
end;

procedure TForm1.eQuestionFoundAnsChange(Sender: TObject);
var ItemFloor1, ItemFloor2, ItemFloor3, ItemFloor4, ItemFloor5: boolean;
begin
  ItemFloor1 := (rgColorQuestion.ItemIndex = 0) and ((Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����'));

  ItemFloor2 := (rgColorQuestion.ItemIndex = 1) and ((Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����'));

  ItemFloor3 := (rgColorQuestion.ItemIndex = 2) and ((Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������'));

  ItemFloor4 := (rgColorQuestion.ItemIndex = 3) and ((Trim(LowerCase(eQuestionFoundAns.Text)) = '�����')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '���������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������'));

  ItemFloor5 := (rgColorQuestion.ItemIndex = 4) and ((Trim(LowerCase(eQuestionFoundAns.Text)) = '�����')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�������') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '�����') xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '��������')
    xor (Trim(AnsiLowerCase(eQuestionFoundAns.Text)) = '������'));

  if (ItemFloor1 xor ItemFloor2 xor ItemFloor3
      xor ItemFloor4 xor ItemFloor5) and (DiffThingPoints = 0) then
  begin
    Inc(QuestionPoints);
    DiffThingPoints := 1;
  end
  else if not (ItemFloor1 xor ItemFloor2 xor ItemFloor3
      xor ItemFloor4 xor ItemFloor5) and (DiffThingPoints = 1) then
  begin
    Dec(DiffThingPoints);
    Dec(QuestionPoints);
  end;
end;

procedure TForm1.rgColorQuestionClick(Sender: TObject);
begin
  mExplainBoard.Lines[0] := '�� ���������� �� ' + IntToStr(rgColorQuestion.ItemIndex + 1) + ' �����';
  mExplainBoard.Lines[1] := '������ �����:';

  mExplainBoard.Lines[4] := '';
  mExplainBoard.Lines[5] := '';
  mExplainBoard.Lines[6] := '';

  iSign1.Visible := False;
  iSign2.Visible := False;
  iSign3.Visible := False;
  iSign4.Visible := False;
  iSign5.Visible := False;

  lYou101.Visible := False;
  lYou102.Visible := False;
  lYou103.Visible := False;
  lYou104.Visible := False;
  lYou105.Visible := False;
  lYou106.Visible := False;
  lYou107.Visible := False;

  lYou201.Visible := False;
  lYou202.Visible := False;
  lYou203.Visible := False;
  lYou204.Visible := False;
  lYou205.Visible := False;
  lYou206.Visible := False;
  lYou207.Visible := False;

  lYou301.Visible := False;
  lYou302.Visible := False;
  lYou303.Visible := False;
  lYou304.Visible := False;
  lYou305.Visible := False;

  lYou401.Visible := False;
  lYou402.Visible := False;
  lYou403.Visible := False;
  lYou404.Visible := False;
  lYou405.Visible := False;
  lYou406.Visible := False;
  lYou407.Visible := False;

  lYou501.Visible := False;
  lYou502.Visible := False;
  lYou503.Visible := False;
  lYou504.Visible := False;
  lYou505.Visible := False;
  lYou506.Visible := False;
  lYou507.Visible := False;

  lMapFloor1.Visible := False;
  lMapFloor2.Visible := False;
  lMapFloor3.Visible := False;
  lMapFloor4.Visible := False;
  lMapFloor5.Visible := False;

  iFloor1.Visible := False;
  iFloor2.Visible := False;
  iFloor3.Visible := False;
  iFloor4.Visible := False;
  iFloor5.Visible := False;

  case rgColorQuestion.ItemIndex of
    0:
    begin
      iFloor1.Visible := True;
      mExplainBoard.Lines[2] := '�������, ������, ������, ���������,';
      mExplainBoard.Lines[3] := '�������, ����� � ���������.';
    end;
    1:
    begin
      iFloor2.Visible := True;
      mExplainBoard.Lines[2] := '���������, �����, ���������,';
      mExplainBoard.Lines[3] := '�����, ������, ������ � ������.';
    end;
    2:
    begin
      iFloor3.Visible := True;
      mExplainBoard.Lines[2] := '�����, �����, ���������,';
      mExplainBoard.Lines[3] := '������� � ������.';
    end;
    3:
    begin
      iFloor4.Visible := True;
      mExplainBoard.Lines[2] := '���������, �������, �����,';
      mExplainBoard.Lines[3] := '������, ������� � �������.';
    end;
    4:
    begin
      iFloor5.Visible := True;
      mExplainBoard.Lines[2] := '������, ��������, �����,';
      mExplainBoard.Lines[3] := '�����, ������� � ������.';
    end;
  end;

  if DiffColoPoints = 0 then
  begin
    Inc(QuestionPoints);
    DiffColoPoints := 1;
  end;
end;

procedure TForm1.rgSeeItemQuestionClick(Sender: TObject);
begin
  if rgSeeItemQuestion.ItemIndex = 0 then
  begin
    lQuestionFound.Visible := True;
    eQuestionFoundAns.Visible := True;

    QuestionPoints := QuestionPoints + (1 - DiffItemPoints);
    DiffItemPoints := 1;
  end
  else
  begin
    eQuestionFoundAns.Text := '';
    lQuestionFound.Visible := False;
    eQuestionFoundAns.Visible := False;

    Inc(QuestionPoints, 2 - DiffItemPoints);
    DiffItemPoints := 2;
  end;

end;

procedure TForm1.rgTimeQuestionClick(Sender: TObject);
begin
  if DiffTimePoints = 0 then
  begin
    Inc(QuestionPoints);
    DiffTimePoints := 1;
  end;

  case rgTimeQuestion.ItemIndex of
    0: Form1.Color := $00FFE7CE;
    1: Form1.Color := $00FFD2A6;
    2: Form1.Color := $00FFBE7D;
    3: Form1.Color := $0096674B;
  end;

end;

end.
