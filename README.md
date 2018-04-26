# Dockerfile : JavaScript dev environment

This repository contains a Dockerfile for creating a JavaScript dev environment anywhere (macOS, Linux, Windows) with Docker. It includes Git, Oh My Zsh, NodeJS, Yarn, NPM, Cordova, Ionic, Android SDK, Java JDK, Gradle, Firebase CLI Tools and Heroku CLI.

## Table of contents

   1. [Prerequisites](#prerequisites)
   2. [Usage](#usage)
   3. [Shortcuts](#shortcuts)
   4. [Create and publish a new version](#create-and-publish-a-new-version)
   5. [Release notes](#release-notes)

## Prerequisites

### Docker latest (https://www.docker.com/get-docker)

This will be used to create and run our container.

## Usage

* Removing existing container:
```
docker container rm -f javascript-dev-env
```

This command will remove the javascript-dev-env container from your machine. This is needed before recreating it because a container must have a unique name.

* Create and start your container:

(Replace "/path/to/projects" to the actual absolute path where your projects are located. This container must be init with your projects folder path since it can be used by multiple projects and because you may need several terminal instance within it.)

```
docker run --restart always --name javascript-dev-env -d -v "/path/to/projects:/projects:cached" --workdir /projects -p 8100:8100 -p 3000:3000 romainfallet/javascript-dev-env:latest
```

You can also pick a specific tag, for example "romainfallet/javascript-dev-env:2018-04-26" instead of "romainfallet/javascript-dev-env:latest" (see [Release notes](#release-notes) for all available tags).

This command will create and start the javascript-dev-env container in background so that you can attach multiple terminal instance in it.

The container will live forever until you remove or stop it. It will start automatically again each time the Docker app boots up.

* Start a new terminal session:

Go in the project you want to use into the container:
```
cd /path/to/projects/project
```

Then, use:
```
docker exec -it javascript-dev-env bash -c "cd ${PWD##*/} && /bin/zsh"
```

This will start a Z-shell from your current directory into the javascript-dev-env container so that you can use Git, Node, Yarn, NPM, Ionic, Cordova and Firebase in your project without worrying about installing anything.

## Shortcuts

Because these commands are very verbose and are not easily usable daily, you can set the aliases below.

```
alias startdevenv='docker container rm -f javascript-dev-env && docker run --restart always --name javascript-dev-env -d -i -v "/path/to/projects:/projects:cached" --workdir /projects -p 8100:8100 -p 3000:3000 romainfallet/javascript-dev-env:latest'
```
```
alias devterminal='docker exec -it javascript-dev-env bash -c "cd ${PWD##*/} && /bin/zsh"'
```

Restart your terminal then, you can run:
```
startdevenv
```
To remove and recreate the container (it can be needed sometimes if it becomes buggy or uses too much CPU).

and

```
devterminal
```

Inside a project directory to start a new terminal.


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

* [2018-04-26](../../releases/tag/2018-04-26) - **Ubuntu 16.04:** Git v2.7.4, Zsh v5.1.1, NodeJS v8.11.1, Yarn v1.6.0, NPM v5.6.0, Cordova v8.0.0, Ionic v3.20.0, Android SDK Platform-tools v27.0.1, Android SDK Build-tools v27.0.3, Android SDK API 26, Java OpenJDK v1.8.0_162, Gradle v4.6.1, Firebase CLI Tools v3.18.4, Heroku CLI (auto-updated)

* [2018-04-23](../../releases/tag/2018-04-23) - **Ubuntu 16.04:** Git v2.7.4, Zsh v5.1.1, NodeJS v8.11.1, Yarn v1.6.0, NPM v5.6.0, Cordova v8.0.0, Ionic v3.20.0, Android SDK Platform-tools v27.0.1, Android SDK Build-tools v27.0.3, Android SDK API 26, Java OpenJDK v1.8.0_162, Gradle v4.6.1, Firebase CLI Tools v3.18.4

* [2018-04-17](../../releases/tag/2018-04-17) - **Ubuntu 16.04:** Git v2.7.4, Zsh v5.1.1, NodeJS v8.11.1, Yarn v1.6.0, NPM v5.6.0, Cordova v8.0.0, Ionic v3.20.0, Android SDK Platform-tools v27.0.1, Android SDK Build-tools v27.0.3, Android SDK API 26, Java OpenJDK v1.8.0_162, Gradle v4.6.1

## Authors

* **Romain Fallet** - *Initial work*

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
