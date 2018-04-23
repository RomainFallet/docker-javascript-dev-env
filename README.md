# Dockerfile : JavaScript dev environment

This repository contains a Dockerfile for creating a JavaScript dev environment anywhere (macOS, Linux, Windows) with Docker. It includes Git, Oh My Zsh, NodeJS, Yarn, NPM, Cordova, Ionic, Android SDK, Java JDK, Gradle and Firebase CLI Tools.

### Prerequisites

#### Docker latest (https://www.docker.com/get-docker)

This will be used to create our container.

### Usage

* Go inside your working directory:
```
cd ./my-working-directory
```

* Create and start your container:
```
docker run --rm -it -v $(pwd):/data --workdir /data -p 8100:8100 -p 3000:3000 romainfallet/javascript-dev-env:latest /bin/zsh
```

You can also pick a specific tag (see [Release notes](#release-notes) for all available tags):
```
docker run --rm -it -v $(pwd):/data --workdir /data -p 8100:8100 -p 3000:3000 romainfallet/javascript-dev-env:2018-04-23 /bin/zsh
```

This will mount your current directory into the JavaScript dev environment container (in the "data" directory) and provide you a Z-shell so that you can use Git, Node, Yarn, NPM, Ionic and Cordova in your project without worrying about installing anything.

## Create and publish a new version

To create a new version, make all the changes you need in the Dockerfile.

Then use these commands:
```
docker image build -t javascript-dev-env:<YYYY-mm-dd> ./
docker image tag javascript-dev-env:<YYYY-mm-dd> <docker-username>/javascript-dev-env:<YYYY-mm-dd>
docker image tag javascript-dev-env:<YYYY-mm-dd> <docker-username>/javascript-dev-env:latest
docker push <docker-username>/javascript-dev-env:<YYYY-mm-dd>
docker push <docker-username>/javascript-dev-env:latest
```

## Built with

* [Docker](https://www.docker.com/) - Docker is the world’s leading software containerization platform.

## Versioning

Versioning is based on a tag of the date the image was built (in format YYYY-mm-dd).

## Release notes

* [2018-04-23](../../releases/tag/2018-04-23) - **Ubuntu 16.04:** Git v2.7.4, Zsh v5.1.1, NodeJS v8.11.1, Yarn v1.6.0, NPM v5.6.0, Cordova v8.0.0, Ionic v3.20.0, Android SDK Platform-tools v27.0.1, Android SDK Build-tools v27.0.3, Android SDK API 26, Java OpenJDK v1.8.0_162, Gradle v4.6.1, Firebase CLI Tools v3.18.4
* 
* [2018-04-17](../../releases/tag/2018-04-17) - **Ubuntu 16.04:** Git v2.7.4, Zsh v5.1.1, NodeJS v8.11.1, Yarn v1.6.0, NPM v5.6.0, Cordova v8.0.0, Ionic v3.20.0, Android SDK Platform-tools v27.0.1, Android SDK Build-tools v27.0.3, Android SDK API 26, Java OpenJDK v1.8.0_162, Gradle v4.6.1

## Authors

* **Romain Fallet** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
