<!-- markdownlint-disable first-line-h1 -->
[![docker build automated?](https://img.shields.io/docker/cloud/automated/mstmelody/image-name.svg)](https://hub.docker.com/r/mstmelody/image-name/builds)
[![docker build passing?](https://img.shields.io/docker/cloud/build/mstmelody/image-name.svg)](https://hub.docker.com/r/mstmelody/image-name/builds)
[![image size and number of layers](https://images.microbadger.com/badges/image/mstmelody/image-name.svg)](https://hub.docker.com/r/mstmelody/image-name/dockerfile)

# Quick reference

- **PyInstaLive**:

  [dvingerh/PyInstaLive: Python script to download Instagram livestreams and replays.](https://github.com/dvingerh/PyInstaLive)

<!-- markdownlint-disable no-trailing-punctuation -->
# What is PyInstaLive?
<!-- markdownlint-enable no-trailing-punctuation -->

This Python script enables you to download any ongoing Instagram livestreams as well as any available replays. It is based on [another script](https://github.com/taengstagram/instagram-livestream-downloader) that has now been discontinued.

# How to use this image

1\.
Create workspace directory to bind mount:

```console
mkdir workspace
```

2\.
Create [pyinstalive.ini](https://github.com/dvingerh/PyInstaLive#usage) into workspace directory:

```text
workspace
+---pyinstalive.ini
```

Note that setting `download_path` as `.` in `pyinstalive.ini` lets download livestreams into the workspace directory:

```ini
[pyinstalive]
download_path = .
```

3\.
Download:

```console
docker run --rm --volume $(pwd)/workspace:/workspace mstmelody/pyinstalive <target username>
```

However, if you press `Ctrl + C` to stop the container in the middle, the downloading file cannot be played.

Therefore, first connect the terminal to the container to operate interactively:

```console
docker run -it --rm --volume $(pwd)/workspace:/workspace --entrypoint=bash mstmelody/pyinstalive
```

Then download:

```console
pyinstalive -d <target username>
```

In this case, the downloading process can be stopped with `Ctrl + C`, and the contents of the downloaded file can be played back up to that point.

## ... via docker-compose

It would be useful to create Compose file like:

```yaml
version: "3.8"
services:
  pyinstalive:
    entrypoint: bash
    image: mstmelody/pyinstalive
    tty: yes
    volumes:
      - ./workspace:/workspace/
```

You can connect the terminal to shell of the container by using following command to operate interactively:

```console
docker-compose run --rm pyinstalive
```

# License

View license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
