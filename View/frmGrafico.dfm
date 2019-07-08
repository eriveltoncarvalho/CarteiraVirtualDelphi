object frmGraficoF: TfrmGraficoF
  Left = 0
  Top = 0
  Caption = 'Gr'#225'fico'
  ClientHeight = 566
  ClientWidth = 980
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 566
    Align = alClient
    TabOrder = 0
    object DBChart1: TDBChart
      Left = 1
      Top = 1
      Width = 978
      Height = 564
      Title.Font.Height = -21
      Title.Margins.Left = 8
      Title.Text.Strings = (
        'Gr'#225'fico')
      Chart3DPercent = 31
      Legend.TextStyle = ltsLeftPercent
      Legend.VertSpacing = 3
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DOptions.ZoomText = ztAuto
      Align = alClient
      TabOrder = 0
      DefaultCanvas = 'TTeeCanvas3D'
      PrintMargins = (
        15
        24
        15
        24)
      ColorPaletteIndex = 13
      object Series1: TPieSeries
        DataSource = cdsMovimentacao
        Title = 'Movimentacao'
        XLabelsSource = 'Categoria'
        XValues.Order = loAscending
        YValues.DateTime = True
        YValues.Name = 'Pie'
        YValues.Order = loNone
        YValues.ValueSource = 'Valor'
        Frame.InnerBrush.BackColor = clRed
        Frame.InnerBrush.Gradient.EndColor = clGray
        Frame.InnerBrush.Gradient.MidColor = clWhite
        Frame.InnerBrush.Gradient.StartColor = 4210752
        Frame.InnerBrush.Gradient.Visible = True
        Frame.MiddleBrush.BackColor = clYellow
        Frame.MiddleBrush.Gradient.EndColor = 8553090
        Frame.MiddleBrush.Gradient.MidColor = clWhite
        Frame.MiddleBrush.Gradient.StartColor = clGray
        Frame.MiddleBrush.Gradient.Visible = True
        Frame.OuterBrush.BackColor = clGreen
        Frame.OuterBrush.Gradient.EndColor = 4210752
        Frame.OuterBrush.Gradient.MidColor = clWhite
        Frame.OuterBrush.Gradient.StartColor = clSilver
        Frame.OuterBrush.Gradient.Visible = True
        Frame.Width = 4
        OtherSlice.Legend.Visible = False
        Transparency = 3
      end
    end
  end
  object cdsMovimentacao: TClientDataSet
    PersistDataPacket.Data = {
      5A0000009619E0BD0100000018000000020000000000030000005A0009436174
      65676F726961020049000000010005574944544802000200FF000556616C6F72
      080004000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 313
    object cdsMovimentacaoCategoria: TStringField
      FieldName = 'Categoria'
      Size = 255
    end
    object cdsMovimentacaoValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object dsMovimentacao: TDataSource
    DataSet = cdsMovimentacao
    Left = 632
    Top = 313
  end
end
