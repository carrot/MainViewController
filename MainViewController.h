#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

- (id)initWithViewController:(UIViewController *)viewController;
- (void)transitionToViewController:(UIViewController *)toViewController
                          duration:(NSTimeInterval)duration
                           options:(UIViewAnimationOptions)options
                        animations:(void (^)(void))animations
                        completion:(void (^)(BOOL))completion;

@end
