# Sphinx documentation with Docker

## Set up

Add this project to your document project as a git submdoule.

```
cd ${your_project_directory}
git submodule add https://github.com/hnakamur/docker-sphinx
```

## Quickstart
To start `hnakamur/sphinx`, You can use `my-sphinx-quickstart` (custom `sphinx-quickstart`)

http://docs.readthedocs.io/en/latest/getting_started.html

```
./docker-sphinx/run.sh my-sphinx-quickstart
```

```
./docker-sphinx/run.sh my-sphinx-quickstart -q -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

If you want to edit documents with non-root user, you need to run the
following command on the docker host.

```
./docker-sphinx/chown.sh
```

## Build your documents

You can run your favorite build commands.

```
# make html
./docker-sphinx/run.sh make html

# sphinx-build
./docker-sphinx/run.sh sphinx-build -b html source build
```

## Autobuild

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

```
# use autobuild with make
./docker-sphinx/live.sh make livehtml

# use autobuild with sphinx-autobuild
./docker-sphinx/live.sh sphinx-autobuild -b html $SOURCE $OUTPUT -H 0.0.0.0
```

However with the above commands, you cannot stop the container by pressing Control-C.
You need to run `docker ps` on another terminal to get the container ID and
run `docker kill $containerID`.

I recommend running a shell and then run `make livehtml` in the container.
First on the docker host:

```
./docker-sphinx/live.sh
```

Then on the docker container:

```
make livehtml
```

You can see the output at http://127.0.0.1:8000
If you would like to change the port from the default 8000, run `live.sh` like:

```
PORT=8888 ./docker-sphinx/live.sh
```

When you are done, press Control-C to stop autobuild and then press Control-D
to exit the shell and stop the container.


## Build dockerfile

```
./docker-sphinx/build.sh
```

## Fork this project

When you fork this project, replace `hnakamur/sphinx` in `run.sh` and `build.sh` with your favorite name.


Thank you.
