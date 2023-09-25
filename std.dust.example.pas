unit std.dust.example;

interface

uses
  {$REGION 'Common'}
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  {$ENDREGION}

  std.dust;

type

  TaskRepository = class
     class function Load(Date: TDatetime): Option<String>;
  end;
  TFileRepository = class
     class function OpenAsString(Filename: TFilename): Result<String, Exception>;
  end;

  TfrmExample = class(TForm)
    Option: TButton;
    btnResult: TButton;
    procedure OptionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnResultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;

implementation

var task: Option<String>;
var content: Result<String, Exception>;

{$R *.dfm}

procedure TfrmExample.btnResultClick(Sender: TObject);
const
  filename = '/InvalidFilename.pdf';
begin
  content := TFileRepository.OpenAsString(filename);
  case content.match of
    Ok: Showmessage('That is the file content: ' + content.value);
    Err: Showmessage('That was not good, look: ' + content.err.message)
  end;
end;

procedure TfrmExample.FormCreate(Sender: TObject);
var
  Value: Option<String>;
begin
  Value.Create('Yeah. It works!');
//  Value.HasNoValue;
  case Value.Match of
    Some: caption := Value.Value
    else caption := 'Oh no!';
  end;

end;

procedure TfrmExample.OptionClick(Sender: TObject);
begin
  var today := now();
  var tasks := TaskRepository.Load(today);
  case task.match of
    Some:
      Showmessage('That is for today: ' + task.value)
  else
    Showmessage('Take a day off')
  end;

end;

{ TaskRepository }

class function TaskRepository.Load(Date: TDatetime): Option<String>;
begin
  case Trunc(Date) mod 7 of
    0, 1: Result.HasNoValue //Sat, Mon has no tasks
    else Result.Create('You have a lot of work today')
  end;
end;

{ FileRepository }

class function TFileRepository.OpenAsString(Filename: TFilename): Result<String, Exception>;
begin
  if FileExists(Filename) then
    Result.Create('Loading...')
  else
    Result.Create(exception.Create('The file does not exists'))
end;

end.
