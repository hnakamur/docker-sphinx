# Sphinx documentation with Docker

## Quickstart
To start `hnakamur/sphinx`, You can use `my-sphinx-quickstart` (custom `sphinx-quickstart`)

http://docs.readthedocs.io/en/latest/getting_started.html

```
./run.sh my-sphinx-quickstart
```

```
./run.sh my-sphinx-quickstart -q -p "YourProjectName" -a "John Doe <john.doe@example.com>" -v 1.0.0
```


## Build your documents

The default `CMD` of `hnakamur/sphinx` is `make html`.

``` 
./run.sh
```

Your can use your favorite build commands.

```
# make html
./run.sh make html

# sphinx-build
./run.sh sphinx-build -b html source build
```

This dockerfile include [sphinx-autobuild](https://github.com/GaretJax/sphinx-autobuild)

```
# use autobuild with make
./run.sh make livehtml

# use autobuild with sphinx-autobuild
./run.sh sphinx-autobuild -b html $SOURCE $OUTPUT -H 0.0.0.0
```

## Run shell for interactive use

```
./run.sh sh
```

Then run the following commands in the running container.

```
my-sphinx-quickstart
```

```
make html
```

```
make livehtml
```

## Build dockerfile

```
./build.sh
```

## Fork this project

When you fork this project, replace `hnakamur/sphinx` in `run.sh` and `build.sh` with your favorite name.


Thank you.
