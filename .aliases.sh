alias antdl="ant pre-compile compile deploy-local deploy-local-release"
alias antcl="ant compile localize"

alias ls="ls -G"

# Different java versions
alias usejava6="export JAVA_HOME=`/usr/libexec/java_home --version 1.6`"
alias usejava7="export JAVA_HOME=`/usr/libexec/java_home --version 1.7`"
alias usejava8="export JAVA_HOME=`/usr/libexec/java_home --version 1.8`"

alias remvn='mvn clean;mvn -DskipTests=true install'

alias node="env NODE_NO_READLINE=1 rlwrap node"

alias g="git"
alias st="g st"
alias po="g po"
alias pou="g pou"
alias br="g branch"
alias brr="g branch -r"
alias bra="g branch -a"
alias ga="g a"
alias gc="g c"
alias gd="g d"
alias gdc="g dc"
alias gds="g d --summary"
alias glp="g log --pretty='%C(yellow)%h 	%C(blue)%aN 	%C(green)%ar 	%C(white)%s'|column -t -s'	'"
alias gap="g ap"
alias pull="g pull"
alias stash_pull="g stash && g pull && g stash pop"
alias gmerge="g merge --no-ff"
alias push="g push"
alias gss="g ss"
alias yum="ssh vtyumrepo1.dealer.ddc"
alias format_for_confluence="gawk 'match(\$0, /([^ ]+) (.*$)/, m) {print \"|\", m[1], \"|\", m[2], \"|\"}'"

alias grc="gr clean"
alias grr="gr run-app"
alias grt="gr test-app"
alias grfc="gr full-clean"

# Wrap some utils in rlwrap to get vim keybindings
alias groovysh="rlwrap -a dummy groovysh"
alias mongo="rlwrap -a dummy mongo"

# Search for a process
alias tm='ps -ef | grep'

# Show hidden directories only
alias l.='ls -d .*'

# Rebuild crm...
alias crm-rebuild="pushd ~/Projects/crm && ./gradlew quickRebuild --info --stacktrace --daemon --parallel && popd"

source ~/.mongo_creds

# Mongo commands
alias mongodev="mongo vtdevccmongo1/dashboard -u$MONGO_QA_USER -p$MONGO_QA_PASSWORD"
alias mongoqa="mongo vtqaccmongo1/dashboard -u$MONGO_QA_USER -p$MONGO_QA_PASSWORD"
alias mongolive="mongo wcccmongodb1/dashboard -u$MONGO_LIVE_USER -p$MONGO_LIVE_PASSWORD"

# node webkit
alias nw=/Applications/node-webkit.app/Contents/MacOS/node-webkit

# Flush dns
alias flushdns="sudo killall -HUP mDNSResponder"

# Python simple server
alias ss="python -mSimpleHTTPServer"

# Run admiral-services
alias run-admiral-services="cd ~/Projects/admiral-svc/service && usejava8 && mvn spring-boot:run"

# Walaxy
alias walaxy='/Users/ddcddavis/Projects/walaxy/walaxy-cli-poc/bin/walaxy'
