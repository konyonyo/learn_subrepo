# git-subrepoの練習

## 設定

git subrepoコマンドを使うために以下のツールをcloneする。

```
git clone git@github.com:ingydotnet/git-subrepo.git
```

.bashrcファイルの最後に以下を追加する。

```
source <path-to-git-subrepo>/.rc
```

## sub repositoryの取り込み

sub repositoryのbranchをsubdirにする。

```
git subrepo clone <repository URL> <subdir> -b <branch>
```

## sub repositoryの変更の取り込み

sub repositoryのbranchの変更をsubdirに反映させる。

```
git subrepo pull <subdir> -b <branch>
```

## sub repositoryへのpush

本repositoryでsubrepositoryのファイルを変更した場合に、この変更をsub repositoryのbranchにpushする。

```
git subrepo push <subdir> -b <branch>
```
