#!/bin/bash

# a bit of heavy lifting so we don't have to deal with escaping slashes via sed
py_replace() {
    python -c "
f = open('/GitLab-Pages/_config.js')
txt = f.read().replace('$1: null','$1: \"$2\"')
f.close()
f = open('/GitLab-Pages/_config.js', 'w')
f.write(txt)
f.close()"
}

cp /GitLab-Pages/default_config.js /GitLab-Pages/_config.js

py_replace url $GITLAB_URL
py_replace publicUrl $EXT_URL

sed -i 's/deployBranch: "gl-pages"/deployBranch: "master"/' /GitLab-Pages/_config.js

npm start