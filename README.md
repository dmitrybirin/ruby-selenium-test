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
geckodriver for Firefox and chromedriver for Chrome should be installed in PATH

### Installing
Assuming you have bundler:

```
bundle install
```

### Running

```
cucumber
```

## Assumptions
1. There is no `Canon EOS 1300D` camera in search results, so I've chosen `Canon EOS 1300D Body`
2. `both quantity-based and physical-based` should have `18 Мп` and `APS-C (1.6 crop)` accordingly, not vice versa. I assume it's a typo.


## Todo
- [ ] Docker container run