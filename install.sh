mkdir -p ~/.coffee
cd ~/.coffee
curl -sSfO https://raw.githubusercontent.com/benjohnde/coffee-counter/master/coffee.sh
chmod +x coffee.sh
echo "alias coffee='sh ~/.coffee/coffee.sh' # handy shortcut for coffee-counter" >> ~/.bash_profile
source ~/.bash_profile
coffee init
