Test on ruby with selenium plus cucumber. Should be fun!

## The task
1. Open https://www.onliner.by/
2. Find and open `Canon EOS 1300D` camera
3. Check screen size and matrix size (both quantity-based and physical-based) and compare them with specified values (`3 ''`, `APS-C (1.6 crop)` and `18 Мп` accordingly)
4. Add item to cart
5. Open cart and check that specified item was added to cart

In order to accomplish that you have to use Ruby language and write Cucumber scenario for that.

## Solution
The repository is the solution in Ruby with cucumber scenario.

### Requirements
Сhromedriver for Chrome, geckodriver for Firefox e t.c. should be installed in PATH 

If you have no chromedriver installed, use the chromedriver_install.sh script

Be aware, that by default it will download the latest version of chromedriver and move it to `/usr/local/bin` directory (version only for mac)

```
sh chromedriver_install.sh
```

### Installing

Install required packages through [bundler](http://bundler.io/)
```
bundle install
```

### Running

```
cucumber
```

## Assumptions
1. There is no `Canon EOS 1300D` camera in search results, so I've chosen `Canon EOS 1300D Body`
2. `both quantity-based and physical-based` should have `18 Мп` and `APS-C (1.6 crop)` values accordingly, not vice versa. I assume it's a typo or I'm John Snow in photography :)


## Todo
- [ ] Docker container to minimize installation hassle
- [ ] Exception handling imrovements