# いまどこ #

ランナーなどを応援するサポートアプリ

#### システム概要 ####
- **Ruby**: 2.0.0
- **DB**: SQLite
- **Production Server**: sakura VPS

## データベース ##
マイグレーションする。

    % bundle exec rake db:migrate

## テスト ##
`rspec` + `guard` + `spring` + `simplecov` を使う。

`guard` の起動。

    % bundle exec guard start
    11:53:31 - INFO - Guard is using Emacs to send notifications.
    11:53:31 - INFO - Guard is using Tmux to send notifications.
    11:53:31 - INFO - Guard is using TerminalTitle to send notifications.
    11:53:31 - INFO - Bundle already up-to-date
    11:53:31 - INFO - Guard::RSpec is running
    11:53:31 - INFO - Guard is now watching at '/Users/mikagami/prj/rails/bybine'
    [1] guard(main)>

テストが実行されるとカバレッジのレポートが `coverage` に出力される。

    % open coverage/index.html

コントローラーのカバレッジを**100%**にするとよい。

## ビュー ##
`bootstrap` + `slim` を使ってみる。

## モデル ##

### クローラー ###
`app/models/crawler` に作る。

新しいクローラーを作るには、`Crawler::Base` を継承し、`#crawl` を実装する。
```ruby
module Crawler
  class Tokyo << Base
    def crawl
      # do something
    end
  end
end
```
