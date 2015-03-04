MainViewController
==================

A simple "parent" view controller that handles transitioning between different view controllers.

### Usage

In your application delegate:

```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // ...

    UIViewController *firstViewController = [[UIViewController alloc] init];
    MainViewController *mainViewController = [[MainViewController alloc] initWithViewController:firstViewController];
    self.window.rootViewController = mainViewController;

    // ...

}
```

Then, from your first controller:

```objective-c

#import "MainViewController.h"

// ...

- (void)pushToAnotherController {
  UIViewController *yetAnotherViewController = [[UIViewController alloc] init];
  [(MainViewController *)self.parentViewController transitionToViewController:yetAnotherViewController
                                                                     duration:1.0f
                                                                      options:UIViewAnimationOptionCurveEaseIn
                                                                   animations:nil
                                                                   completion:nil]
}

```

And so on. Once a controller disappears, it's removed from memory (unless it has a strong reference somewhere else).
