object dmDatabase: TdmDatabase
  OnCreate = DataModuleCreate
  Height = 647
  Width = 724
  object FDPhysMySQL: TFDPhysMySQLDriverLink
    VendorHome = 'J:\!PROJECTS 2023\soneTrunk\BUILD'
    VendorLib = 'libmariadb.dll'
    Left = 400
    Top = 16
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=J:\!PROJECTS 2023\soneTrunk\BUILD\DB\SONE.FDB'
      'User_Name=SYSDBA'
      'Server=Localhost'
      'CharacterSet=UTF8'
      'Password=R0ck#masterkey'
      'Protocol=TCPIP'
      'ExtendedMetadata=True'
      'IBAdvanced=1'
      'GUIDEndian=Big'
      'DriverID=FB')
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SizeMax = 16
        SizeMin = 16
        SourceDataType = dtByteString
        TargetDataType = dtGUID
      end>
    Transaction = FDTransaction
    UpdateTransaction = FDUpdateTransaction
    Left = 56
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 57
    Top = 80
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection
    Left = 56
    Top = 216
  end
  object FDUpdateTransaction: TFDTransaction
    Connection = FDConnection
    Left = 56
    Top = 145
  end
  object FDEventAlerter1: TFDEventAlerter
    Connection = FDConnection
    Left = 632
    Top = 88
  end
  object FDError: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 632
    Top = 16
  end
  object FDWait: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 632
    Top = 168
  end
  object FDPhysFB: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorHome = 'J:\!PROJECTS 2023\soneTrunk\BUILD\'
    VendorLib = 'fbclient.dll'
    Left = 164
    Top = 17
  end
end
