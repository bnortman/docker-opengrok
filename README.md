# docker-opengrok

Project Goal:

The one-liner to spin up a code search engine and connect to GitHub Organization
build up a full set of all Repos in that Organization
then Index that code nightly after a complete refresh
Automatically setup OpenGrok to use Active Directory user auth
Automatically setup SSL include self signed or import

[OpenGrok](http://opengrok.github.io/OpenGrok/) is a code search engine 
made by Sun (and now Oracle). 

It provides similar functions to [LXR](http://lxr.linux.no/) but much more. 
This project encapsulated OpenGrok into a docker container, allowing you 
to start an instance of OpenGrok by one command.



## Usage

To start the OpenGrok, simply edit and run a script like sample-docier-run.sh

```sh

docker run -d \
-e GitHubOrg='MyGitHub-Organization' \
-e SubD='~/dev' \
-e Username='GitHubUserName' \
-e Password1='GitHubPassword' \
-p [public port]:8080 cap10bill/opengrok



```

It may take a while for the indexer to finish the first-time indexing, after
that, the search engine is available at `https://host:[public port]/source/`.

## Note

The project supports dynamic index updating through `inotifywait` recursively on the source folder. 
This can be disabled with the environment variable `INOTIFY_NOT_RECURSIVE` at runtime.
Also, if you have more than 8192 files to watch, you will need to increase the amount of inotify watches allowed per user `(/proc/sys/fs/inotify/max_user_watches)` on your host system.

NOTE: `touch` doesn't trigger inotify. You should add, delete or modify the content of some source file to make it happen.
