# coffee-counter

Tiny coffee-counter script to monitor your daily dose of caffeine, based on Git.

Highly WIP.

## Installation

mkdir ~/.coffee
cd ~/.coffee
curl -fsSLO https://raw.githubusercontent.com/benjohnde/coffee-counter/master/coffee.sh
echo "alias coffee='sh ~/.coffee/coffee.sh'" > ~/.bash_profile
coffee init

## Usage

```bash
# Ramp up
coffee init

# Consume some fresh brewed cup of coffee
coffee up

# Show your coffee log
coffee log
```
