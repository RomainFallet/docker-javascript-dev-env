FROM ubuntu:16.04

LABEL maintainer="Romain Fallet"

RUN \
# Get the list of packages from the registry
apt-get update && \
# Install and say "yes" to everything prompt (-y)
apt-get install -y curl git zsh unzip openjdk-8-jdk && \
# Install Oh My Zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
# Install Git flow zsh plugin
git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion
COPY ./.zshrc /root/.zshrc

RUN \
# Install NodeJS & NPM
# Download the .tar.gz file, extract (x) in gzip format (z) and change the destination (-C) to "/usr/local/"
# without creating the folder "node-v8.11.1-linux-x64" by stripping one level (--strip=1)
curl -L https://nodejs.org/dist/v8.11.1/node-v8.11.1-linux-x64.tar.gz | tar xz -C /usr/local/ --strip=1 && \
# Install Yarn
# Download the .tar.gz file, extract (x) in gzip format (z) and change the destination (-C) to "/usr/local/"
# without creating the folder "yarn-v1.6.0" by stripping one folder level (--strip=1)
curl -L https://github.com/yarnpkg/yarn/releases/download/v1.6.0/yarn-v1.6.0.tar.gz | tar xz -C /usr/local/ --strip=1  && \
# Install Ionic & Cordova
npm install -g ionic@3.20.0 cordova@8.0.0

# Install Gradle
RUN curl -Ls https://services.gradle.org/distributions/gradle-4.6-bin.zip > gradle-4.6-bin.zip && \
unzip -d / /gradle-4.6-bin.zip && \
rm /gradle-4.6-bin.zip

# Set GRADLE_HOME environment variable
ENV GRADLE_HOME /gradle-4.6/bin

# Install Android SDK
RUN curl -L http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz -C /usr/local/
 
# Accept license and update android-sdk to API 26
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/local/android-sdk-linux/tools/android update sdk --no-ui -a --filter platform-tool,build-tools-27.0.3,android-26

# Set ANDROID_HOME environment variable
ENV ANDROID_HOME /usr/local/android-sdk-linux

# Add ANDROID_HOME and GRADLE_HOME to PATH
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${GRADLE_HOME}

# Add all executables to the system PATH environment variable
ENV PATH ${PATH}:/usr/local/bin