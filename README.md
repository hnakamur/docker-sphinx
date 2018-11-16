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
./docker-sphinx/sphinx-run.sh my-sphinx-quickstart
```

```
./docker-sphinx/sphinx-run.sh my-sphinx-quickstart -q -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

## Build your documents

The default `CMD` of `hnakamur/docker-sphinx` is `make html`.

```
./docker-sphinx/sphinx-run.sh
```

You can run your favorite build commands.

```
# make html
./docker-sphinx/sphinx-run.sh make html

# sphinx-build
./docker-sphinx/sphinx-run.sh sphinx-build -b html source build
```

## Autobuild

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

```
./docker-sphinx/sphinx-livehtml.sh
```
You can see the output at http://127.0.0.1:8000
If you would like to change the port and the listen address, run `sphinx-livehtml.sh` like:

```
PORT=8888 LISTEN_ADDR=127.0.0.1 ./docker-sphinx/sphinx-livehtml.sh
```

When you are done, press Control-C to stop autobuild and go back to the prompt.


## Build dockerfile

```
./docker-sphinx/build.sh
```

## Fork this project

When you fork this project, replace `hnakamur/sphinx` in `run.sh` and `build.sh` with your favorite name.


Thank you.
