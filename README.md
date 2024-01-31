# djhouseknecht/tinyproxy
Docker build files for a small [tinyproxy](https://tinyproxy.github.io/) docker container. Tinyproxy is a light-weight HTTP/HTTPS proxy daemon for POSIX operating systems.

### Credit / Reason
This is an indirect fork of [vimagick/tinyproxy](https://github.com/vimagick/dockerfiles/tree/master/tinyproxy).

This repo is necessary because [vimagick/tinyproxy](https://hub.docker.com/r/vimagick/tinyproxy/tags) is currently only built for `linux/amd64`. This repo builds for more architectures.

## Usage

1. Create a `tinyproxy.conf` file and adjust the settings to your needs.
    * [See tinyproxy's documentation](https://tinyproxy.github.io/)
    * [See an example.tinyproxy.conf file](https://github.com/djhouseknecht/tinyproxy/blob/main/data/example.tinyproxy.conf)

2. Run the docker container:
    ```sh
    docker run -p 8888:8888 \
      -v $PWD/tinyproxy.conf:/etc/tinyproxy.conf:ro \
      -d \
      --restart unless-stopped \
      --name tiny \
      djhouseknecht/tinyproxy
    ```
    * _Be sure to adjust the location of your `tinyproxy.conf` file_.
    * You can also use directory binding: `-v $HOME/proxy/data:/etc/tinyproxy` where your config is located at `~/proxy/data/tinyproxy.conf`