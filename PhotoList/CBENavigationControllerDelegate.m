//
// Created by chris on 18.05.14.
//

#import "CBENavigationControllerDelegate.h"
#import "CBEZoomInAnimation.h"
#import "CBEFullScreenPhotoViewController.h"
#import "CBEZoomOutAnimation.h"


@implementation CBENavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)
           navigationController:(UINavigationController *)navigationController
animationControllerForOperation:(UINavigationControllerOperation)operation
             fromViewController:(UIViewController*)fromVC
               toViewController:(UIViewController*)toVC
{
    if (operation == UINavigationControllerOperationPush && [toVC isKindOfClass:[CBEFullScreenPhotoViewController class]]) {
        return [[CBEZoomInAnimation alloc] init];
    } else if (operation == UINavigationControllerOperationPop && [fromVC isKindOfClass:[CBEFullScreenPhotoViewController class]]) {
        
        return [[CBEZoomOutAnimation alloc] init];
    }
    return nil;
}

@end
