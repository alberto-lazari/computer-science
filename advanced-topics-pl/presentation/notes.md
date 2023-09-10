# Typst
As a programming language

## Source
Master thesis: https://www.user.tu-berlin.de/laurmaedje/programmable-markup-language-for-typesetting.pdf

## How does it improve the LaTeX experience?
Technical analysis on how it is implemented. Try to be objective

## Programming language analysis
Describe the runtime of the language or try to present implementation details, such as how dynamic typing is managed

# Modes
<!-- https://typst.app/docs/reference/foundations/eval/ -->
Three modes are available to interpret typst code:
- Code `{ code }`
- Markup `[ content ]`
- Math `$ math $`

By default a typst file is interpreted in markup mode, hence the need to prepend a `#` for code

## Markup
Basically just syntactic sugar for functions..

Examples:
- `# Heading` -> `#heading("Heading", level: 1)`
- `*bold text*` -> `#strong[bold text]` ??

## Math
<!-- TODO Is math also just a syntactic sugar? Or can it be expressed only with pure functions? -->

# Functions
<!-- https://typst.app/docs/reference/types/function/ -->
They are pure and cannot change the state outside of them (except builtin types)

Ex:
```typst
#let i = 0

#let test(x) = {
  i += 1
  x + i
}

#test(2)
```
Produces error
```
error: variables from outside the function are read-only and cannot be modified
```

Not actually true, because it's allowed to have stateful parts of the code (useful for counters).
That actually returns only content via its `.display()` method, so it can't be used for logic

## Arguments
Either:
- Positional `fun(a, b, c)`
- Named  `fun(len: 1em, width: 2px)`

Argument sinks are available to allow any argument. An array or dictionary can be spread with `..array` to cast it to the `arguments` type

# Compilation
It seems that the evaluation is lazy: if a variable or function is never called it never gets evaluated and don't throw errors (unless it's syntax related?)

# Clearly defined syntax
Very interesting piece (p. 64 of the paper). LaTeX does not have a defined syntax for everything (ex. math mode: `$math\)`)


# Fun fact
Typst can be used in a simil-interactive mode with
```bash
cat << '#quit()' | typst compile /dev/stdin /dev/stdout | pdftotext - -
```
Use `#quit()` to trigger the compilation
