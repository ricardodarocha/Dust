# Dust
Implements Rust-like types for Delphi

This is a very single interpretation of how things should be. Be free and keep your mind free.

## How to use

```rust
uses std.dust;

var task: Option<String>;
var file: Result<String, Exception>;
```

## Practical example

```rust
var today := now();
var tasks := TaskRepository.Load(today);
for task in tasks do
  case task.match
    Some: Showmessage('That is for today: ' + task.value),
    else continue
  end;
```

```rust
var filename := '/AnInvalidFilename.pdf';
var file := TSafeFile.OpenAsString();
case file.match
  Ok: Showmessage('That is the file content: ' + file.value),
  Err: Showmessage('That was not good, look: ' + file.err.message),
end;
```
