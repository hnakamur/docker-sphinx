# Sphinx documentation with Docker

## Set up

Clone this project to some directory. In the following example, I clone it to
my home directory.

```
cd $HOME
git clone https://github.com/hnakamur/docker-sphinx
```

Then add `$HOME/docker-sphinx/bin` to your `PATH` environment variable.

## Quickstart
To start `hnakamur/sphinx`, You can use `my-sphinx-quickstart` (custom `sphinx-quickstart`)

http://docs.readthedocs.io/en/latest/getting_started.html

```
sphinx-run.sh my-sphinx-quickstart
```

```
sphinx-run.sh my-sphinx-quickstart -q -p "YourProjectName" -a "John Doe <john.doe@example.com>" -r 1.0
```

## Build your documents

The default `CMD` of `hnakamur/docker-sphinx` is `make html`.

Go to the document base directory (which is the parent directory of `source` and `build`)
and then run `sphinx-run.sh`.

```
cd ${base_directory}
sphinx-run.sh
```

Or you can set `BASE_DIR` environment variable and run `sphinx-run.sh`.

```
BASE_DIR=${base_directory} sphinx-run.sh
```

You can run your favorite build commands.

```
# make html
sphinx-run.sh make html

# sphinx-build
sphinx-run.sh sphinx-build -b html source build
```

## Autobuild

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

You can start autobuild with running the following command.

```
sphinx-livehtml.sh
```

You can see the output at http://127.0.0.1:8000
If you would like to change the port and the listen address, run `sphinx-livehtml.sh` as below:

```
PORT=8888 LISTEN_ADDR=127.0.0.1 sphinx-livehtml.sh
```

When you are done, press Control-C to stop autobuild and go back to the prompt.


## Build dockerfile

```
docker build -t hnakamur/sphinx ${directory_this_project}
```

## Fork this project

When you fork this project, change the image tag `hnakamur/sphinx` to
`${your_docker_ID}/${your_favorite_container_name}` when you build
a docker image, and then replace `hnakamur/sphinx` in `sphinx-run.sh`
and `sphinx-livehtml.sh` with that tag.


Thank you.
