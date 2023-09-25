unit std.dust;

interface
uses
  Generics.Collections;

type
  OptionKind = (Some, None);

  Option<T> = record
  private
    FValue: T;
    HasValue: Boolean;
  public
    property Value: T read FValue;
    function Match: OptionKind;
  {$REGION 'constructor'}
    constructor Create(AValue: T);
    procedure HasNoValue;
{$ENDREGION}
  end;

  ResultKind = (Ok, Err);

  Result<T, E> = record
  private
    FValue: T;
    FErr: E;
    IsValid: Boolean;
  public
    property Value: T read FValue;
    property Err: E read FErr;
    function Match: ResultKind;
  {$REGION 'constructor'}
    constructor Create(AValue: T); overload;
    constructor Create(AError: E); overload;
{$ENDREGION}
  end;

implementation

{ Option<T> }
constructor Option<T>.Create(AValue: T);
begin
  FValue := AValue;
  HasValue := true;
end;
procedure Option<T>.HasNoValue;
begin
  HasValue := false;
end;
function Option<T>.Match: OptionKind;
begin
  if HasValue then
    Result := OptionKind.Some
  else
    Result := OptionKind.None;
end;

{ Result<T, E> }
constructor Result<T, E>.Create(AValue: T);
begin
  FValue := AValue;
  IsValid := True;
end;
constructor Result<T, E>.Create(AError: E);
begin
  FErr := AError;
  IsValid := False;
end;
function Result<T, E>.Match: ResultKind;
begin
  if IsValid then
    Result := ResultKind.Ok
  else
    Result := ResultKind.Err;
end;
end.
