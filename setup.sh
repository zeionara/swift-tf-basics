#!/bin/bash
SWIFT_VERSION=${1:-5.2.2}
SWIFT_ARCHIVE_WITHOUT_EXTENSION=swift-$SWIFT_VERSION
SWIFT_ARCHIVE=$SWIFT_ARCHIVE_WITHOUT_EXTENSION.tar.gz
LOCATION=${2:-/usr/share/}
SWIFT_ROOT=$LOCATION$SWIFT_ARCHIVE_WITHOUT_EXTENSION
echo "Installing dependencies..."
sudo apt install curl git clang libsqlite3-dev libblocksruntime-dev libncurses5-dev libncurses5
echo "Downloading swift $SWIFT_VERSION for ubuntu 18.04..."
wget -O $SWIFT_ARCHIVE https://swift.org/builds/swift-$SWIFT_VERSION-release/ubuntu1804/swift-$SWIFT_VERSION-RELEASE/swift-$SWIFT_VERSION-RELEASE-ubuntu18.04.tar.gz
echo "Extracting archive to $LOCATION..."
sudo tar xzvf $SWIFT_ARCHIVE -C $LOCATION
sudo mv $LOCATION"swift-$SWIFT_VERSION-RELEASE-ubuntu18.04" $LOCATION$SWIFT_ARCHIVE_WITHOUT_EXTENSION
echo "Setting up PATH env variable through ~/.bashrc..."
echo export PATH='$PATH':$SWIFT_ROOT/usr/bin >> ~/.bashrc
source ~/.bashrc
echo "Testing swift version..."
swift --version
echo "Cloning sourcekit-lsp..."
git clone https://www.github.com/apple/sourcekit-lsp
cd sourcekit-lsp
echo "Updating swift packages..."
swift package update
echo "Building swift..."
swift build -Xcxx -I$SWIFT_ROOT/usr/lib/swift
echo "Moving built results to the bin folder..."
sudo mv .build/x86_64-unknown-linux-gnu/debug/sourcekit-lsp /usr/local/bin/sourcekit-lsp-$SWIFT_VERSION
echo "Installing nodejs..."
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Generating extension for vscode..."
cd Editors/vscode
npm run createDevPackage
echo "Installing newly created extension..."
code --install-extension out/sourcekit-lsp-vscode-dev.vsix

SWIFT_VERSION=tf
SWIFT_ARCHIVE_WITHOUT_EXTENSION=swift-$SWIFT_VERSION
SWIFT_ARCHIVE=$SWIFT_ARCHIVE_WITHOUT_EXTENSION.tar.gz
LOCATION=/usr/share/
SWIFT_ROOT=$LOCATION$SWIFT_ARCHIVE_WITHOUT_EXTENSION
