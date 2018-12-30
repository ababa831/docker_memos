FROM ababa831/kaggle:latest

MAINTAINER ababa831 <flvonlineconverter@gmail.com>

# Ubuntu パッケージ追加インストール
RUN apt-get install -y locales

# 日本語周りの設定
RUN locale-gen ja_JP.UTF-8  
ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP:ja  
ENV LC_ALL ja_JP.UTF-8 

# 追加モジュール
# pip で入るもの
RUN pip install wikipedia2vec \
    plotly \
    catboost \
    --pre xgboost

# git clone経由するもの
# LightGBM
RUN git clone --recursive https://github.com/Microsoft/LightGBM && \
    cd LightGBM/python-package && python setup.py install

# 不要なパッケージやキャッシュを削除する
RUN apt-get autoremove -y && apt-get clean && \
    conda clean -i -l -t -y && \
    rm -rf /usr/local/src/*