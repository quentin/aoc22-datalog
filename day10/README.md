
## Running puzzle `b`

```sh
ruby prepare.rb input > day10.facts
souffle --no-preprocessor -D. -F. day10b.dl
ruby display.rb
```
