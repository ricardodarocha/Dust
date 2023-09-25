unit std.primitives;

interface

uses
  Generics.Collections;

type
    bool               = type              Boolean;
    str                = type               String;

    u8                 = type                 Byte; // UInt8
    u16                = type                 Word; // UInt16
    u32                = type             Cardinal; // UInt32
    u64                = type               UInt64; // UInt64

    i8                 = type             ShortInt; //Int8
    i16                = type             SmallInt; //Int16
    i32                = type              Integer; //Int32
    i64                = type                Int64; //Int64

    f8                 = type               Double;

    f16                = type             Extended; //  8 bytes size on 64-bit Intel Windows
                                                    // 10 byes on 32-bit Intel Windows
                                                    // 16 bytes 64-bit Intel Linux
                                                    //          64-bit Intel macOS
                                                    //          32-bit Intel iOS Simulator

    Struct             = TObject;
//  Enum               = TEnum<T>;

    TString = class

    end;

implementation

end.
