#!/usr/bin/env bash
_script=$(basename $0)
if [ ! -d $HOME/.dotfiles ]; then
   exit 0
fi
if [ ! -z $BASH_VERSION ] ; then
   _shell=bash
   _profile=$HOME/.bash_profile
fi
if [ ! -z $KSH_VERSION ] ; then
   _shell=ksh
   _profile=$HOME/.profile
fi
echo "$_script: setting up your dot file configuration for $_shell"
cd $HOME/.dotfiles
_ignore=(. .. .git .gitignore)
_bashonly=(.profile.bash.opts .inputrc)
_kshonly=()
_bancsonly=(.profile.cobmods .cobterminfo .ora .mailrc)
for _file in .*; do
   printf '%s\n' ${_ignore[@]} | grep "^${_file}$" > /dev/null 2>&1
   if [ $? -eq 0 ]; then
      continue
   fi
   if [[ $_file =~ '.swp' ]]; then
      continue
   fi
   printf '%s\n' ${_kshonly[@]} | grep "^${_file}$" > /dev/null 2>&1
   if [ $? -eq 0 -a $_shell == bash ]; then
      continue
   fi
   printf '%s\n' ${_bashonly[@]} | grep "^${_file}$" > /dev/null 2>&1
   if [ $? -eq 0 -a $_shell == ksh ]; then
      continue
   fi
   printf '%s\n' ${_bancsonly[@]} | grep "^${_file}$" > /dev/null 2>&1
   if [[ $? == 0 ]] && ! [[ $LOGNAME =~ fns ]]; then
      continue
   fi
   if [ -h $HOME/$_file ]; then
      echo "$_script: soft link for $_file already exists in $HOME"
   elif [ -f $HOME/$_file -o -d $HOME/$_file ]; then
      echo "$_script: removing (backing-up) regular file $_file from $HOME and creating softlink"
      mv -f $HOME/$_file $HOME/${_file}.$(date '+%Y%m%d')
      ln -s $HOME/.dotfiles/$_file $HOME/$_file
   else
      echo "$_script: creating softlink for $_file"
      ln -s $HOME/.dotfiles/$_file $HOME/$_file
   fi
done

grep '.profile.addon' $_profile  | grep -vE '^#' 2>&1> /dev/null
if [ $? -eq 1 ]; then
   echo "$_script: adding .profile.addon to $_profile"
   echo "source \$HOME/.profile.addon" >> $_profile
fi
echo "$_script: dot file configuration done"
