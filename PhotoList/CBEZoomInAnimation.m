//
// Created by chris on 18.05.14.
//

#import "CBEZoomInAnimation.h"
#import "CBEDetailViewController.h"
#import "CBEFullScreenPhotoViewController.h"


@implementation CBEZoomInAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CBEFullScreenPhotoViewController* toViewController = (CBEFullScreenPhotoViewController *) [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CBEDetailViewController* fromViewController = (CBEDetailViewController *) [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toViewController.view];

    UIImageView *imageView = fromViewController.imageView;
    CGRect oldFrame = imageView.frame;

    toViewController.view.alpha = 0;

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^
    {
        imageView.frame = toViewController.photoView.frame;
    } completion:^(BOOL finished) {
        imageView.frame = oldFrame;
        toViewController.view.alpha = 1;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

- (void)animationEnded:(BOOL)transitionCompleted
{
}


@end
