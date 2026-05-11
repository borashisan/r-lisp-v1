# R-Lisp

Rubyで実装されたScheme風の純Lisp インタプリタ。

## 設計思想

McCarthyの純Lispに倣い、**言語の核を最小に保つ**ことを重視しています。

### 特殊形式（5つのみ）

| 形式 | 役割 |
|------|------|
| `quote` | 式を評価せずそのまま返す |
| `define` | 変数・関数を環境に束縛する |
| `if` | 条件分岐 |
| `cond` | 多分岐 |
| `lambda` | 関数を生成する |

### プリミティブ関数

| 分類 | 関数 |
|------|------|
| データ操作 | `car`, `cdr`, `cons`, `atom`, `eq?` |
| 算術 | `+`, `-`, `*`, `/` |
| 比較 | `<`, `>`, `<=`, `>=` |
| I/O | `display`, `newline` |

これら以外の機能（整数除算、固定小数点演算など）は、すべてLispのユーザーコードとして実装できます。

## 使い方

### REPL

```sh
ruby bin/repl.rb
```

### ファイル実行

```sh
ruby bin/repl.rb <ファイルパス>
```

## Examples

### フィボナッチ数列

```sh
ruby bin/repl.rb examples/fibonacci.lisp
```
`cond` と再帰でフィボナッチ数列を計算し、0番目から30番目まで出力します。

### マンデルブロ集合

```sh
ruby bin/repl.rb examples/mandelbrot.lisp
```

固定小数点演算（×1,000,000）と倍々法による整数除算を**純Lispのユーザーコードで**実装し、ASCIIアートでマンデルブロ集合を描画します。

## テスト

```sh
bundle exec rspec
```
