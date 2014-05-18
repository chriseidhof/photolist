//
// Created by chris on 18.05.14.
//

#import <Foundation/Foundation.h>


@interface CBEWebservicePhoto : NSObject

@property (nonatomic, copy, readonly) NSString *user;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *imageLocation;
@property (nonatomic, copy, readonly) NSString *descriptionText;
@property (nonatomic, readonly) UIImage *image;

- (instancetype)initWithDictionary:(NSDictionary *)data;

@end
