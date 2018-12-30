# Kaggle docker customize
k_docker() {
    docker run --rm -it -v $PWD:/workspace/kaggle -w /workspace/kaggle $@
}
k_jupyter() {
    (sleep 3 && open "http://localhost:8888")&
    docker run --rm -it -p 8888:8888 -v $PWD:/workspace/kaggle -w /workspace/kaggle $@ jupyter notebook --no-browser --ip="0.0.0.0" --notebook-dir=$
}