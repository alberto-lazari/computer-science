#set page(numbering: "1")
#set list(marker: ([•], [◦], [--]))
#let unipd-red = rgb(180, 27, 33)

#set heading(numbering: "1.1.")
#show heading.where(level: 1): it => {
  v(0.5em)
  set text(size: 20pt, fill: unipd-red)

  counter(heading).display(n => if n > 0 [#n. ])
  it.body

  v(0.5pt)
}

#show outline.entry.where(level: 1): it => {
  v(1em, weak: true)
  strong(it)
}

#let make_title(title: none, subtitle: none, author: none, date: none) = align(center, [
    #text(size: 30pt, weight: "bold", fill: unipd-red, smallcaps(title)) \
    #v(5pt)
    #text(size: 25pt, weight: "bold", fill: unipd-red, subtitle)

    #set text(size: 18pt)
    #author

    #date
  ]
)

// Comment-style lecture number annotation (# Lecture n)
#let lecture(number) = {
  set text(gray)
  [\# Lecture #number]
}

#v(10em)
#figure(image("images/unipd-logo.png", width: 50%))
#v(3em)

#make_title(
  title:    [Mobile programming],
  subtitle: [Notes],
  author:   [Alberto Lazari],
  date:     [I Semester A.Y. 2023-2024],
)
#pagebreak()

#outline(
  title: "Index",
  indent: 2em,
)

#set text(font: "Arial")

= Installing Android SDK on M1
```bash
brew install android-commandlinetools
# Reload env to see the commands
zsh --login || bash --login

sdkmanager --install 'platform-tools' 'platforms;android-33' 'system-images;android-33;google_apis_playstore;arm64-v8a'
avdmanager create avd --name Test -k 'system-images;android-33;google_apis_playstore;arm64-v8a'

# Link binaries somewhere or include them in $PATH
ln -s /opt/homebrew/share/android-commandlinetools/platform-tools/adb ~/bin/adb
ln -s /opt/homebrew/share/android-commandlinetools/emulator/emulator ~/bin/emulator

# The python script will need a non-trivial library
pip3 install androguard
```
