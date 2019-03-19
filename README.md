# Functional Test Automation Tutorial

## Overview
This test suite accompanies a series of tutorials demonstrating functional test automation best practices. It makes use of the following elements:

- Cucumber
- Capybara (via the Selenium web driver)
- A custom page object pattern

This test suite runs against a demo instance the [grandnode](https://grandnode.com/) open-source e-commerce platform.

It is optimized to be run locally on a Mac via the Chrome browser.

## Pre-requisites
To run the test suite via Chrome you must have the following pre-requisites installed:

1. Ruby 2.2.0 or greater;
2. Chrome web browser;
3. ChromeDriver.

## Mac setup
The following instructions are for installing the necessary pre-requisites to run the test suite on a Mac.

### Install Homebrew (if not already installed)
Install the Homebrew package manager using the following command:
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Check your version of Ruby
Check your version of Ruby with the following command
```
$ ruby -v
```
If you have a version lower than 2.2.0, install an updated version as follows:

#### Install the latest version of Ruby (if current version < 2.2.0)
Install the latest stable version of Ruby using the following commands:
```
$ brew update
$ brew install ruby-build
$ brew install rbenv
$ rbenv install 2.5.0
$ rbenv global 2.5.0
```
### Download and install the Chrome browser (if not already installed)
If you don't already have the Chrome browser installed. download and install it from the following url:
https://www.google.com/chrome/browser/

### Install ChromeDriver
Install the ChromeDriver with the following command:
```
$ brew install chromedriver
```
### Clone the repo and install the gem dependencies
Clone the repo and install the project dependencies by executing the following commands:
```
$ git clone git@bitbucket.org:keverdige/fyt-automation-web.git
$ cd fyt-automation-web
$ gem install bundler
$ bundler install
```
### Run the test suite
To run the test cases against a [hosted demo instance of grandnode](http://demo.grandnode.com), execute the following commands in the root of the repo folder:

```
$ cucumber -p prod
```