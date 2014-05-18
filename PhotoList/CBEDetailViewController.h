//
// Created by chris on 18.05.14.
//

#import <Foundation/Foundation.h>

@class CBEWebservicePhoto;


@interface CBEDetailViewController : UIViewController

@property (strong, nonatomic,readonly) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) CBEWebservicePhoto *photo;

@end
