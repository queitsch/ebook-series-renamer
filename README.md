# ebook-series-renamer
* ONLY USE ON FOLDERS CONTAINING NOTHING BUT TARGET .MOBI 
* HAVE BACKUPS

Adds the name of a book series to the `title` metadata field of Kindle-formated (`.mobi`) eBooks so they show up sorted by series name on a Kindle device.

Optionally renames .mobi files from `$filename` to `$series_$filename` (uncomment the mv_cmd lines).

### Usage:
`./ebook-series-renamer.rb [folder]`

Takes the series name from the containing foldername. The expected folder structure looks like this:
```
├─┬◆ [The Lord of the Rings]
│ ├──◆ The Fellowship Of The Ring.mobi
│ ├──◆ The Two Towers.mobi
│ └──◆ The Return Of The King.mobi
├─┬◆ [Some Other Series]
│ ├──◆ Volume One.mobi
│ ├──◆ Volume Two.mobi
│ └──◆ Volume Three.mobi
```

### Requirements:
* "ebook-meta" binary from the [calibre project](http://calibre-ebook.com) somewhere in PATH. If you install calibre via [Homebrew](https://brew.sh), it's added to your PATH automatically.
* The `mobi` gem.
```
$ brew install calibre
$ gem install mobi
```

### Does not (yet):
* *do any checks to try to be non-destructive*
* do any sorting **inside** a series
* handle anything besides .mobi
* spider a website and turn it into a perfectly formatted and metadata'd set of [Pandoc Markdown](http://pandoc.org/README.html#pandocs-markdown) source files and prettyprinted eBooks.
