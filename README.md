# coffee-counter

Tiny coffee-counter script to monitor your daily dose of caffeine, based on Git.

Highly WIP.

## Usage

```bash
# Ramp up
coffee init

# Consume some fresh brewed cup of coffee
coffee up

# Show your coffee log
coffee log
```

## Installation

```bash
mkdir ~/.coffee
cd ~/.coffee
curl -fsSLO https://raw.githubusercontent.com/benjohnde/coffee-counter/master/coffee.sh
chmod +x coffee.sh
echo "alias coffee='sh ~/.coffee/coffee.sh'" >> ~/.bash_profile
source ~/.bash_profile
coffee init
```
