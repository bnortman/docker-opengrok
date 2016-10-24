#!/bin/sh
mkdir $OPENGROK_INSTANCE_BASE
mkdir $OPENGROK_INSTANCE_BASE/data
mkdir $OPENGROK_INSTANCE_BASE/etc

wget https://github.com/OpenGrok/OpenGrok/files/467358/opengrok-0.12.1.6.tar.gz.zip
unzip opengrok-0.12.1.6.tar.gz.zip
tar zxvf opengrok-0.12.1.6.tar.gz
echo "Move Directory"
mv opengrok-0.12.1.6 opengrok
echo "Change Directory"
cd opengrok/bin
echo "Deploy OpenGrok"
./OpenGrok deploy
echo "Getting GitHub Org Processor"
git pull git@github.com:bnortman/useful-utilities.git
