//
// Created by chris on 18.05.14.
//

#import <Foundation/Foundation.h>

@class CBEWebservicePhoto;


@interface CBEFullScreenPhotoViewController : UIViewController

@property (strong, nonatomic, readonly) IBOutlet UIImageView *photoView;

@property (nonatomic, strong) CBEWebservicePhoto *photo;
@end
