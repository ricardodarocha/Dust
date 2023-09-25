# Dust
Implements Rust-like types for Delphi

This is a very single interpretation of how things should be. Be free and keep your mind free.

## How to use

```Pascal
uses std.dust;

var task: Option<String>;
var content: Result<String, Exception>;
```

## Practical example

```Pascal
var today := now();
task := TaskRepository.Load(today);
  case task.match
    Some: Showmessage('That is for today: ' + task.value)
    else continue
  end;
```

```Pascal
const
  filename = '/InvalidFilename.pdf';

content := TFileRepository.OpenAsString(filename);
case content.match of
  Ok: Showmessage('That is the file content: ' + content.value);
  Err: Showmessage('That was not good, look: ' + content.err.message)
end;
```
