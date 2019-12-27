# SSH into a server via URL instead of IP Address
function pingSSH(){
    hostname=$1
    ip=`dig +short $hostname`
    if [ -n "$ip" ]; then
        ssh root@$ip
    else
        echo Could not resolve hostname.
    fi
}

# Go Home
function home(){
        cd ~
}

# push the current branch up
function pushBranch(){
        branchname=$(git branch | grep "*")
        branchname=${branchname/'* '/''}
        git push origin $branchname
}

# pull the current branch down
function pullBranch(){
    git fetch
    branchname=$(git branch | grep "*")
    branchname=${branchname/'* '/''}
    git pull origin $branchname
}

# get the status of the branch
function gs(){
    git status
}

# short hand for commits
function commit () {
    git commit -m $1
}

# add all items to git
function gitadd(){
    git add .
}
