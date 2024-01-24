### clang-format

Move this file to `~/.clang-format`

Has been tested with clang-format version 16.0.6, but it should work with
version >=11 (Since it uses `SpaceBeforeCaseColon`).

#### References

- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
- https://zed0.co.uk/clang-format-configurator/

#### TODO

Some arrays like:

```c
color_t colors[] = {
    { 0x000000, LEFT },
    { 0xEEEEEE, RIGHT },
    { 0xEEEEEE, RIGHT },
    { 0xEEEEEE, RIGHT },
    { 0xEEEEEE, RIGHT },
    { 0xEEEEEE, RIGHT },
};
```

Get formatted to:

```c
color_t colors[] = {
    { 0x000000, LEFT },  { 0xEEEEEE, RIGHT }, { 0xEEEEEE, RIGHT },
    { 0xEEEEEE, RIGHT }, { 0xEEEEEE, RIGHT }, { 0xEEEEEE, RIGHT },
};
```

Even with the trailing comma. I tried setting `AlignArrayOfStructures` to
`Left` and `Right`, but it removes spaces (afaik overwrites
`Cpp11BracedListStyle`, but perhaps those spaces are from another setting).
