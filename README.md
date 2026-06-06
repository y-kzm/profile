# profile

個人プロフィールサイト: https://y-kzm.github.io/profile/

Jekyll 製のワンページサイトで、GitHub Pages (`docs/` ディレクトリ) から公開しています。

## 構成

```
.
├── docs/
│   ├── index.md              # コンテンツ (front matter にすべてのデータを記述)
│   ├── _layouts/default.html # レイアウト・スタイル
│   ├── _config.yml           # Jekyll 設定
│   └── img/icon.jpg          # アイコン画像
├── jekyll.sh                 # ローカルサーバ管理スクリプト
└── README.md
```

## コンテンツの編集

ページの内容はすべて `docs/index.md` の front matter (YAML) で管理しています。

| キー | 内容 |
|------|------|
| `about` | 自己紹介・Research Interests・所属・経歴 |
| `events` | 参加イベント |
| `talks` | 口頭発表・ポスター発表 |
| `publications` | 論文 (著者名は自動で下線強調) |
| `oss` | OSS コントリビューション |
| `contact` | メールアドレス (クリックで表示) |

## ローカルプレビュー

Homebrew の Ruby を使用します (システム Ruby 2.6 では動きません)。

```bash
./jekyll.sh start    # http://localhost:4000 (ライブリロード付き)
./jekyll.sh status
./jekyll.sh stop
```

初回のみ依存関係のインストールが必要です:

```bash
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
cd docs && bundle install
```

## デプロイ

`main` ブランチに push すると GitHub Pages が自動で公開します。
