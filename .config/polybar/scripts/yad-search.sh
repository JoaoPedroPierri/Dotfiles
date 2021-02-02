#!/bin/env bash

Search(){

Entry(){
yad --licon /home/frank/.i3/yad/icons/google_icon.png \
--no-buttons \
--entry \
--posx=-8 --posy=-40 \
--completion \
--fixed
}

go="$(Entry)"

if [ "$go" > "0" ]; then
  firefox http://www.google.co.uk/search?q="$go" 
fi

}
Search
