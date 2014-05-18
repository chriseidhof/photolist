//
// Created by chris on 18.05.14.
//

#import "CBEZoomOutAnimation.h"
#import "CBEFullScreenPhotoViewController.h"
#import "CBEDetailViewController.h"


@implementation CBEZoomOutAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    CBEFullScreenPhotoViewController* fromViewController = (CBEFullScreenPhotoViewController *) [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CBEDetailViewController* toViewController = (CBEDetailViewController *) [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = transitionContext.containerView;
    [containerView addSubview:toViewController.view];

    UIImageView *imageView = toViewController.imageView;
    CGRect destination = imageView.frame;
    imageView.frame = fromViewController.photoView.frame;

    toViewController.view.alpha = 1;

    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^
    {
        imageView.frame = destination;
    } completion:^(BOOL finished) {
        toViewController.view.alpha = 1;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}

- (void)animationEnded:(BOOL)transitionCompleted
{
}

@end
