# Sphinx documentation with Docker

## Set up

Pull the docker image.

```
docker pull hnakamur/sphinx
```

Open a terminal on Linux or macOS, or a command prompt on Windows, and then change directory to the top directory (which is the parent directory of `source` and `build`) of your document project.

On Windows, you also need [hnakamur/docker-windows-volume-watcher: A command to notify file changes on Windows to docker containers](https://github.com/hnakamur/docker-windows-volume-watcher). Download `docker-windows-volume-watcher.exe` from [Releases page](https://github.com/hnakamur/docker-windows-volume-watcher/releases).

## Quickstart

To start `hnakamur/sphinx`, You can use `my-sphinx-quickstart` (custom `sphinx-quickstart`)

http://docs.readthedocs.io/en/latest/getting_started.html

### Linux

On Linux, you need to pass uid and gid to mount the document directory

```
docker run --rm -it -v "$PWD:/documents" -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx my-sphinx-quickstart
```

```
docker run --rm -it -v "$PWD:/documents" -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx my-sphinx-quickstart -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

### macOS

On macOS, you don't need to pass uid and gid.

```
docker run --rm -it -v "$PWD:/documents" hnakamur/sphinx my-sphinx-quickstart
```

```
docker run --rm -it -v "$PWD:/documents" hnakamur/sphinx my-sphinx-quickstart -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

### Windows

```
docker run --rm -it -v "%cd%:/documents" hnakamur/sphinx my-sphinx-quickstart
```

```
docker run --rm -it -v "%cd%:/documents" hnakamur/sphinx my-sphinx-quickstart -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

## Build your documents

The default `CMD` of `hnakamur/sphinx` is `make html`.

### Linux

```
docker run --rm -it -v "$PWD:/documents" -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx
```

You can run your favorite build commands.

```
# make html
docker run --rm -it -v "$PWD:/documents" -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx make html

# sphinx-build
docker run --rm -it -v "$PWD:/documents" -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx sphinx-build -b html source build
```

### macOS

```
docker run --rm -it -v "$PWD:/documents" hnakamur/sphinx
```

You can run your favorite build commands.

```
# make html
docker run --rm -it -v "$PWD:/documents" hnakamur/sphinx make html

# sphinx-build
docker run --rm -it -v "$PWD:/documents" hnakamur/sphinx sphinx-build -b html source build
```

### Windows

```
docker run --rm -it -v "%cd%:/documents" hnakamur/sphinx
```

You can run your favorite build commands.

```
# make html
docker run --rm -it -v "%cd%:/documents" hnakamur/sphinx make html

# sphinx-build
docker run --rm -it -v "%cd%:/documents" hnakamur/sphinx sphinx-build -b html source build
```

## Autobuild

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

### Linux

```
docker run --rm -it -v "$PWD:/documents" -p 8000:8000 -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx sphinx-autobuild --host 0.0.0.0 source build/html
```

You can see the output at http://127.0.0.1:8000

If you would like to change the port and the listen address, for example 8888 and 127.0.0.1

```
docker run --rm -it -v "$PWD:/documents" -p 8888:8000 -e SWITCH_USER=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) hnakamur/sphinx sphinx-autobuild --host 0.0.0.0 source build/html
```

When you are done, press Control-C to stop autobuild and go back to the prompt.

### macOS

```
docker run --rm -it -v "$PWD:/documents" -p 8000:8000 hnakamur/sphinx sphinx-autobuild --host 0.0.0.0 source build/html
```

You can see the output at http://127.0.0.1:8000

If you would like to change the port and the listen address, for example 8888 and 127.0.0.1

```
docker run --rm -it -v "$PWD:/documents" -p 8888:8000 hnakamur/sphinx sphinx-autobuild --host 0.0.0.0 source build/html
```

When you are done, press Control-C to stop autobuild and go back to the prompt.

### Windows

```
docker run --rm -it -v "%cd%:/documents" -p 8000:8000 hnakamur/sphinx sphinx-autobuild --host 0.0.0.0 source build/html
```

You can see the output at http://127.0.0.1:8000

If you would like to change the port and the listen address, for example 8888 and 127.0.0.1

```
docker run --rm -it -v "%cd%:/documents" -p 8888:8000 hnakamur/sphinx sphinx-autobuild --host 127.0.0.1 source build/html
```

You also need to run `docker-windows-volume-watcher.exe` on another command prompt.

```
docker-windows-volume-watcher.exe -ignoredir git;build
```

When you are done, press Control-C to stop autobuild and go back to the prompt.


## Build dockerfile

```
docker build -t hnakamur/sphinx ${work_directory_of_this_project}
```

## Fork this project

When you fork this project, change the image tag `hnakamur/sphinx` to
`${your_docker_ID}/${your_favorite_container_name}`.

Thank you.
