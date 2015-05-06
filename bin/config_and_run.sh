#!/bin/bash

# a bit of heavy lifting so we don't have to deal with escaping slashes via sed
py_replace() {
    python -c "
f = open('/GitLab-Pages/_config.js')
if $# == 3:
    txt = f.read().replace('$1: \"$3\"','$1: \"$2\"')
else:
    txt = f.read().replace('$1: null','$1: \"$2\"')
f.close()
f = open('/GitLab-Pages/_config.js', 'w')
f.write(txt)
f.close()"
}

cp /GitLab-Pages/default_config.js /GitLab-Pages/_config.js

py_replace url $GITLAB_URL
py_replace publicUrl $EXT_URL
py_replace deployBranch $REF_TO_DEPLOY gl-pages

if [ ! -f keys/id_rsa ]; then
    ssh-keygen -t rsa -f "keys/id_rsa"
fi

npm start
