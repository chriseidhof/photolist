//
// Created by chris on 18.05.14.
//

#import <Foundation/Foundation.h>


@interface Webservice : NSObject


- (void)loadPhotos:(void (^)(NSArray *))pFunction;
@end
