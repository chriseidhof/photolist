//
// Created by chris on 18.05.14.
//

#import "CBEWebservicePhoto.h"


@interface CBEWebservicePhoto ()

@property (nonatomic, copy, readwrite) NSString *user;
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *imageLocation;
@property (nonatomic, copy, readwrite) NSString *descriptionText;
@property (nonatomic, strong) NSURL *downloadedImageURL;
@property (nonatomic) UIImage *image;
@property (nonatomic) BOOL isLoaded;
@end

@implementation CBEWebservicePhoto


- (instancetype)initWithDictionary:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.descriptionText = data[@"description"];
        self.imageLocation = data[@"image_url"];
        self.name = data[@"name"];
        self.user = data[@"user"][@"fullname"];
        //[self startLoading];
    }
    return self;
}

- (void)startLoading
{
    NSURLSession *session = [NSURLSession sharedSession];
    self.isLoaded = NO;
    [[session downloadTaskWithURL:self.imageURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
    {
        self.downloadedImageURL = location;
        UIImage *downloadedImage =
                [UIImage imageWithData:
                        [NSData dataWithContentsOfURL:location]];
        sleep(2);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^
        {
            self.image = downloadedImage;
            self.isLoaded = YES;
        }];

    }] resume];
}

- (NSURL *)imageURL
{
    return [NSURL URLWithString:self.imageLocation];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.user=%@", self.user];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.imageLocation=%@", self.imageLocation];
    [description appendFormat:@", self.descriptionText=%@", self.descriptionText];
    [description appendString:@">"];
    return description;
}

- (UIImage *)image
{
    if (_image == nil) {
        [self startLoading];
    }
    return _image;
}


@end
