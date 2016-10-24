docker run -d -v [source to be indexed on host]:/src \
-e GitHubOrg='MyGitHub-Organization' \
-e SubD='~/dev' \
-e Username='GitHubUserName' \
-e Password1='GitHubPassword' \
-p [public port]:8080 cap10bill/opengrok