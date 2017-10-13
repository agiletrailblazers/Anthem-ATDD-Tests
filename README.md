# Selenium Tests

## Languages and Technologies
- Ruby
- Selenium
- Cucumber/Gherkin
- Text Editor or IDE (SublimeText, Atom, Notepad++, Eclipse)
- Firefox

## Setup Steps
Install Firefox<br/>
Note: On Windows, if FF is installed in a non standard location (i.e. outside Program Files) the you must add the FF directory to your PATH environment variables in Windows.

#### Mac Installation

Install Ruby & Cucumber:
```
$> brew install ruby
$> gem install bundler
$> sudo gem install selenium-webdriver
$> gem install cucumber
$> gem install rspec
```

#### Windows Installation

Use the Windows Ruby Installer: http://rubyinstaller.org/

* Download RubyInstaller for Ruby 2.2.4
* Install in a directory *that does not contain spaces in its path* (such as C:\Ruby, but not C:\Program Files\Ruby)
* Download the Ruby Development Kit (RDK) for your associated Ruby Installer (check the instructions on the side of the page)
* Run the RDK installer and extract it somewhere permanent (for convenience, consider extracting it in the same directory as where you installed Ruby)
* Navigate to the DevKit via command prompt and execute the following two commands:

```
$> ruby dk.rb init
$> ruby dk.rb install
```

* To verify everything works, try installing the necessary gems:

```
$> gem install bundler
$> gem install selenium-webdriver
$> gem install cucumber
```

(Instructions sourced from https://github.com/oneclick/rubyinstaller/wiki/Development-Kit

#### Linux (Ubuntu) Installation
Install Ruby:<br/>
http://tecadmin.net/install-ruby-on-rails-on-ubuntu/
```
$> gem install bundler
$> sudo apt-get install ruby-dev
$> sudo gem install selenium-webdriver
$> gem install cucumber
$> gem install rspec
```
Install headless Xvfb Firefox Browser:<br/>
http://www.installationpage.com/selenium/how-to-run-selenium-headless-firefox-in-ubuntu/

## Running Cucumber
$> cucumber env={ENVIRONMENT}
<br>
ENVIRONMENTS PARAMS:
* dev
* test
<br>
The default value is 'dev' if no 'env' parameter is specified
<br>
# Anthem-ATDD-Tests
