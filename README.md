# category-theory-slides

[Typst](https://typst.app/) + [Touying](https://touying-typ.github.io/) で作成するスライド集。
各プロジェクト（トップレベルのディレクトリ）が1つのスライドに対応し、共通の設定は
`globals.typ` にまとめている。

## 必要なもの

- [typst](https://github.com/typst/typst)

## スクリプト

### `make.sh` — 新規スライドプロジェクトの作成

```sh
./make.sh <プロジェクト名>
```

`.template/` の中身を `<プロジェクト名>/` にコピーして新規プロジェクトを作成する。
生成される構成は以下の通り。

```
<プロジェクト名>/
├── main.typ
└── sections/
    ├── title.typ
    ├── toc.typ
    └── section1.typ
```

すでに同名のディレクトリが存在する場合はエラーになる。

### `comp.sh` — スライドのコンパイル

```sh
./comp.sh <プロジェクト名>
```

`<プロジェクト名>/main.typ` を `<プロジェクト名>/main.pdf` にコンパイルする。

### `watch.sh` — スライドのウォッチコンパイル

```sh
./watch.sh <プロジェクト名>
```

`comp.sh` のウォッチモード版。`<プロジェクト名>/main.typ` を監視し、変更のたびに
`<プロジェクト名>/main.pdf` へ自動的に再コンパイルする。

