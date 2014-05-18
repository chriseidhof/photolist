//
// Created by chris on 18.05.14.
//

#import <Foundation/Foundation.h>

@class CBEWebservicePhoto;

@interface UITableViewCell (CBEConfigureForPhoto)

- (void)configureForPhoto:(CBEWebservicePhoto *)photo;

@end
