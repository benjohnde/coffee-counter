#!/bin/bash

mkdir -p ~/.coffee
cd ~/.coffee
curl -sSfO https://raw.githubusercontent.com/benjohnde/coffee-counter/master/coffee.sh
chmod +x coffee.sh

if ! cat ~/.bash_profile | grep -q "handy shortcut for coffee-counter"; then
  echo "alias coffee='sh ~/.coffee/coffee.sh' # handy shortcut for coffee-counter" >> ~/.bash_profile
  ~/.coffee/coffee.sh init
fi

echo ""
echo ""
echo "You may need to either:"
echo ""
echo "- source ~/.bash_profile"
echo "- restart your terminal window in order to re-init your shell"
echo "- if you are using zsh/fish, may adjust those profile files as well"
echo ""
echo ""
echo "After that you are good to go with:"
echo ""
echo "# track the injection of some fresh brewed cup of coffee"
echo "coffee up"
echo ""
echo "# show your daily dose"
echo "coffee log"
echo ""
echo ""
