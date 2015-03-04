#import "MainViewController.h"

@interface MainViewController()

@property (weak, nonatomic) UIViewController *currentViewController;

@end

@implementation MainViewController

- (id)initWithViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        self.currentViewController = viewController;
        [self addChildViewController:viewController];
        [self.view addSubview:self.currentViewController.view];
        [self.currentViewController didMoveToParentViewController:self];
    }
    return self;
}

- (void)transitionToViewController:(UIViewController *)toViewController
                          duration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                        animations:(void (^)(void))animations
                        completion:(void (^)(BOOL))completion {
    [self addChildViewController:toViewController];
    __weak __block MainViewController *weakSelf = self;
    [self transitionFromViewController:self.currentViewController
                      toViewController:toViewController
                              duration:duration
                               options:options
                            animations:animations
                            completion:^(BOOL finished) {
                                [weakSelf.currentViewController willMoveToParentViewController:nil];
                                [weakSelf.currentViewController removeFromParentViewController];
                                weakSelf.currentViewController = toViewController;
                                if (completion) completion(finished);
                             }];
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers{
    return YES;
}

@end
