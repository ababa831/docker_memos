# docker_memos/kaggle

Kaggleコンペ用開発環境 (Mac)

## Usage

1. `$ ./build.sh`
2. `alias_for_mac.bash`に記述されたbash用エイリアスを`~/.bash_profile`に登録する
3. データ分析・開発時は用途に応じて以下のコマンドを実行

- 作成したKaggle用コンテナイメージに入る

```
$ k_docker ababa831/kaggle-custom:latest
```

- Jupyter notebookサーバを起動する

```
$ k_docker ababa831/kaggle-custom:latest
```