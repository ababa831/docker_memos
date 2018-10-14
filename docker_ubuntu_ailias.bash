# `k_docker ${コンテナ名}`で指定先コンテナイメージの作業環境を開くシェルスクリプト　（Ubuntu用）
# コマンドラインオプション周りとかちゃんと書いていない
k_docker()
{
	sudo docker run --rm -it $1
}

k_python()
{
	sudo docker run -v $PWD:/tmp/working -w=/tmp/working --rm -it $1 python "$@"
}

k_jupyter()
{
	(sleep 3 && xdg-open "http://localhost:8888")&
	sudo docker run -v $PWD:/tmp/working -w=/tmp/working -p 8888:8888 --rm -it $1 jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=/tmp/working --allow-root --NotebookApp.token=''
}

# nvidia-docker2を利用して，gpu環境を開く場合
## tensorflow/tensorflow:latest-gpu-py3 nvidia-docker2 environments
## Requirements: nvidia-docker2
tf_docker()
{
    sudo docker run --runtime=nvidia -v $PWD:/tmp/working -w /tmp/working --rm -it tensorflow/tensorflow:latest-gpu-py3 bash
}
## これを起点に色々なライブラリを追加していき，自分用のdockerimageをcommitしていく．
## kaggle/docker-gpu-buildはubuntuであっても，nvidia-docker2との連携がうまく行かなかった．
## 原因を特定して潰すより，こちらを起点にしたほうが早いという判断．