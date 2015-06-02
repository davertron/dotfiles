function parse_git_branch {
 ref=$(git symbolic-ref HEAD 2> /dev/null) || return
   echo "("${ref#refs/heads/}")"
}

function logdiff {
    g log $1 --not $2 --no-merges --oneline
}

function logdifff {
    g log $1 --not $2 --no-merges --oneline --name-status
}

function rm-ddc-grails-core {
    if [ "$1" ]; then
        echo "Killing core for $1"
        find ~/.m2 ~/.grails/ivy-cache/ ~/.grails/2.0.3/projects/$1/plugins/ -name "*ddc-grails-core-*" -exec rm -rf {} \;
    else
        echo "Killing core for all grails projects"
        find ~/.m2 ~/.grails/ivy-cache/ ~/.grails/2.0.3/projects/ -name "*ddc-grails-core-*" -exec rm -rf {} \;
    fi
}

function e {
    mvim --servername `basename $PWD` $1;
}

function f {
    find . -name "*$1*" \! -name "*.class"
}

function delbranch {
    g branch -d $1 

	if [[ $? == 0 ]]; then
		g push origin :$1
	else
		FORCE=''
		while [[ $FORCE != "y" && $FORCE != "n" ]]; do
			echo ""
			echo "Force (y/n)?"
			read FORCE
		done

		if [[ $FORCE == 'y' ]]; then
			g branch -D $1 && g push origin :$1
		fi
	fi
}

function promote {
    job=$1
    latest_build=
    promotion_action=
    curl -3 -X POST "https://ddcddavis:98eb15d0938e5b687bbf895c3b69a28e@builds.dealer.ddc/user/ddcddavis/job/$job/$latest_build/promotion/$promotion_action" 
}

# Run command (or last command) as sudo
s(){
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

# Find and open
fo(){
	find . -regex '$1' -exec mvim {} \;
}

function grep-cc {
    for i in `seq 1 7`; do echo -----------------wccc${i}-----------------; ssh wccc${i}.dealer.ddc "grep '$1' /opt/apps/controlcenter/logs/wrapper.log"; done
}

function mytail {
    logfile=/usr/local/tomcat-instances/advertising_p9430/logs/catalina.out
    if [[ $# == 1 ]]; then
        ssh $1 tail -f $logfile
    else
        multitail -l "ssh $1 \"tail -f $logfile\"" -l "ssh $2 \"tail -f $logfile\""
    fi
}

function tailccdev {
    mytail vtdevad-ccadvertising0{1,2}.dealer.ddc
}

function tailccqa {
    mytail vtqaad-ccadvertising01.dealer.ddc
}

function tailccbeta {
    mytail vtbetaad-ccadvertising0{1,2}.dealer.ddc
}

function tailcclive {
    mytail wcad-ccadvertising0{1,2}.dealer.ddc
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

