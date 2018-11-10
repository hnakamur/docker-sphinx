# Sphinx documentation with Docker

## Quickstart
To start `hnakamur/sphinx`, You can use `my-sphinx-quickstart` (custom `sphinx-quickstart`)

http://docs.readthedocs.io/en/latest/getting_started.html

```
./run.sh my-sphinx-quickstart
```

```
./run.sh my-sphinx-quickstart -q -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

If you want to edit documents with non-root user, you need to run the
following command on the docker host.

```
./chown.sh
```

## Build your documents

The default `CMD` of `hnakamur/sphinx` is `sh`.

``` 
./run.sh
```

Then you can run your favorite build commands on the container.

```
make html
```

When you are done, press Control-D to exit the shell and stop the
container.

Also, You can run your favorite build commands directlyy without
running a shell.

```
# make html
./run.sh make html

# sphinx-build
./run.sh sphinx-build -b html source build
```

## Autobuild

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

```
# use autobuild with make
PORT=8000 ./run.sh make livehtml

# use autobuild with sphinx-autobuild
PORT=8000 ./run.sh sphinx-autobuild -b html $SOURCE $OUTPUT -H 0.0.0.0
```

However with the above commands, you cannot stop the container by pressing Control-C.
You need to run `docker ps` on another terminal to get the container ID and
run `docker kill $containerID`.

I recommend running a shell and then run `make livehtml` in the container.
First on the docker host:

```
PORT=8000 ./run.sh
```

Then on the docker container:

```
make livehtml
```

When you are done, press Control-C to stop autobuild and then press Control-D
to exit the shell and stop the container.

## Build dockerfile

```
./build.sh
```

## Fork this project

When you fork this project, replace `hnakamur/sphinx` in `run.sh` and `build.sh` with your favorite name.


Thank you.
