# Various aliases for convenience
alias ..='cd ..'
alias cd..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'

# Set vim as the default editor
export EDITOR=vim

#
# Shortcut for ls -lart since we use that all the time
#
function l () { ls -lart $@; }

#
# Format an XML file and open it in vi
#
function xmlvi () {
  xmllint --format $@ | vi -
}

#
# Format an XML file and open it in vim
#
function xmlvim () {
  xmllint --format $@ | vim -
}

#
# Format a JSON file and open it in vi
#
function jsonvi () {
  python -mjson.tool $@ | vi -
}

#
# Format a JSON file and open it in vim
#
function jsonvim () {
  python -mjson.tool $@ | vim -
}

#
# Pretty print a JSON string
#
function json () {
  python -mjson.tool $@
}

#
# Pretty print a XML string
#
function xml () {
  xmllint --format $@
}

#
# Obtain a colourful diff from svn
#
function svndiff () {
  svn diff $@ | colordiff | less -R
}
