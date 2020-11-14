FROM mstmelody/python-ffmpeg:20201114221500
RUN apt-get update \
    && apt-get -y install git \
    && rm -rf /var/lib/apt/lists/*

COPY ./Pipfile /workspace/

RUN pip --no-cache-dir install pipenv \
 && pipenv install --skip-lock --deploy --system \
 && pip uninstall -y pipenv virtualenv-clone virtualenv \
 && rm -rf /workspace/*
# Pipenv has bug that not install pakcage from Git repository into system.
# pip has bug that not install pakcage from Git repository in Dockerfile.
RUN git clone --branch 3.2.0 https://github.com/dvingerh/PyInstaLive.git /tmp/PyInstaLive \
 && cd /tmp/PyInstaLive \
 && python3 setup.py install
ENTRYPOINT [ "pyinstalive", "-d" ]
