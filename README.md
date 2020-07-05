# Cheatsheets

## Versions used
* ruby '2.6.5'
* rails '6.0.3.1'

## Installation

To use the code:

1. Open Terminal and change the current working directory to the location where you want the cloned directory to be made.
Run the following to clone the repository using HTTPS:
```
git clone https://github.com/kgoncharova/cheatsheets.git
```
2. In the command line go to the directory with the files downloaded.
```
cd cheatsheets
```
3. Install all necessary gems:
```
bundle install
```
4. Install all the dependencies listed within package.json in the local node_modules folder:
```
yarn install
```
5. To run migrations:
```
bundle exec rails db:migrate
```
