# Cheatsheets

## Versions used
* ruby '2.6.5'
* rails '6.0.3.1'

## Installation

To use the code:

1. Open Terminal and change the current working directory to the location where you want the cloned directory to be made.

2. Download the repository using the [instruction](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository).

3. In the command line go to the directory with the files downloaded:
```
cd cheatsheets
```

4. Install all necessary gems:
```
bundle install
```

5. Install all the dependencies listed within package.json in the local node_modules folder:
```
yarn install
```

6. To run migrations:
```
bundle exec rails db:migrate
```
