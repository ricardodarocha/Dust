unit std.dust;

interface
uses
  Generics.Collections;

type
 OptionKind = (Some, None);

 Option<T> = record
    HasValue: Boolean;
    Value: T;
    function Match: OptionKind;
    {$REGION 'constructor'}
    constructor Create(AValue: T); overload;
    procedure HasNoValue;
    {$ENDREGION}
 end;

 ResultKind = (Ok, Err);

 Result<T, E> = record
    Value: T;
    Err: E;
    IsValid: Boolean;
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
  Value := AValue;
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
  Value := AValue;
  IsValid := True;
end;
constructor Result<T, E>.Create(AError: E);
begin
  Err := AError;
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
