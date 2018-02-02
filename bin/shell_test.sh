#/bin/bash

# func of log
function log_warn()
{
  local date=`date "+%H-%M-%S"`
  local para=$1
  echo -e "\033[0;33m[WARN] $date: $1\033[0m"
}

function log_info()
{
  local date=`date "+%H-%M-%S"`
  local para=$1
  echo -e "\033[0;32m[INFO] $date: $1\033[0m"
}


function log_err()
{
  local date=`date "+%H-%M-%S"`
  local para=$1
  echo -e "\033[0;31m[ERROR] $date: $1\033[0m"
}

log_warn "aaa"
log_info "bbb"
log_err "cc"
