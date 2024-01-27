FROM mstmelody/python-ffmpeg:20240127133000
RUN apt-get update \
    && apt-get -y install --no-install-recommends git=1:2.25.1-1ubuntu3.11 \
    && rm -rf /var/lib/apt/lists/*
COPY ./Pipfile /workspace/
RUN pip3 --no-cache-dir install pipenv==2023.11.17 \
 && pipenv install --skip-lock --deploy --system \
 && pip3 uninstall -y pipenv virtualenv-clone virtualenv \
 && rm -rf /workspace/*
ENTRYPOINT [ "pyinstalive", "-d" ]
