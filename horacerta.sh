#!/bin/sh
#
# Este script vem com nenhuma garantia!
#
# USE POR SUA CONTA E RISCO!!!
#
#
# Qua Jan 28 11:10:25 UTC 2009
# Por Daniel Roque
# 2006roque@gmail.com
# 
#
#
#

if [ `whoami` != 'root' ];then
  echo 'Voce precisa ser root para executar este comando'
  exit 1
fi

if [ ! -e /usr/bin/lynx ];then
  if [ ! -e /usr/local/bin/lynx ];then
    echo 'Voce nao parece ter instalado o programa lynx
por favor reinstale e tente novamente.'
    exit 1
  fi
fi

# pega a nova hora, observe que me baseio em um site, e que este site pode sofrer mudancas. Ai o script vai precisar de ajustes

horacerta=`lynx -dump http://pcdsh01.on.br/HoraLegalBrasileira.asp|sed -n '/.*\/.*\/.*/p;s/  / /g'|sed -n 2p|sed 's/\//-/g;s/  / /g;s/  / /g;s/  / /g;s/  / /g;s/  / /g;s/  / /g;s/^ //g'|sed -n 's/\(.*\)\(-\)\(.*\)\(-\)\(.*\)\( \)\(.*\)/\5-\3-\1 \7/p'`
if [ "$horacerta" != '' ];
then
  date -s "$horacerta"
  date >/var/log/horacerta.log
else
  echo 'Ha algo errado com o script, provavelmente o link http://pcdsh01.on.br/HoraLegalBrasileira.asp nao fornece mais a hora como fornecida, da criacao deste script :).
Ja era!'
  exit 1
fi

exit 0
