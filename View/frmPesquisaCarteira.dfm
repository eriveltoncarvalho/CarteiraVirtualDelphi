object frmPesquisaCarteiraF: TfrmPesquisaCarteiraF
  Left = 0
  Top = 0
  Caption = 'Pesquisa Carteira'
  ClientHeight = 282
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 236
    Width = 456
    Height = 46
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 237
    ExplicitWidth = 396
    object Bevel: TBevel
      Left = 10
      Top = 4
      Width = 431
      Height = 16
      Shape = bsTopLine
    end
    object btnOK: TBitBtn
      Left = 234
      Top = 7
      Width = 100
      Height = 33
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancelar: TBitBtn
      Left = 339
      Top = 7
      Width = 100
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 456
    Height = 236
    Align = alClient
    Caption = 'Carteira'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    ExplicitWidth = 425
    ExplicitHeight = 233
    object dbgPesqCarteira: TDBGrid
      Left = 2
      Top = 15
      Width = 452
      Height = 219
      Align = alClient
      DataSource = dsPesqCarteira
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDblClick = dbgPesqCarteiraDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Title.Alignment = taRightJustify
          Title.Caption = 'C'#243'digo'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Carteira'
          Width = 294
          Visible = True
        end>
    end
  end
  object cdsPesqCarteira: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 129
    object cdsPesqCarteiraCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsPesqCarteiraCarteira: TStringField
      FieldName = 'Carteira'
      Size = 255
    end
  end
  object dsPesqCarteira: TDataSource
    DataSet = cdsPesqCarteira
    Left = 328
    Top = 129
  end
end
