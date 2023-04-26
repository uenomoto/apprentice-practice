## 現在の位置(HEAD)の下に一連のコミットをコピーしたいという意を単純に表す方法です。

- `git cherry-pick C2 C4`

今いるブランチの真下に選択したコミットナンバーをコピーする

## 別の場所にブランチ作ってコピー

- `git rebase -i HEAD~4`
- `git rebase -i main --solution-ordering C4`
- `git rebase bugFix main`

## コミットのやりくり

git rebase -i を使って順番を変更する。これで、変更をかけたいコミットを一番先頭に持ってくる。
git commit --amend コマンドで僅かな変更を行う
git rebase -i コマンドを再度使って、先頭に持ってきていたコミットを元に戻す
最後に、レベルクリアのために main ブランチを先頭に持ってくる

```
git rebase -i HEAD~2 --solution-ordering C3,C2

git commit --amend

git rebase -i HEAD~2 --solution-ordering C2'',C3'

git rebase caption main
```
