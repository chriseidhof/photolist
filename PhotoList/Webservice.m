//
// Created by chris on 18.05.14.
//

#import "Webservice.h"
#import "NSArray+Extras.h"
#import "CBEWebservicePhoto.h"


@implementation Webservice


- (void)loadPhotos:(void (^)(NSArray *))callback
{
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:@"https://api.500px.com/v1/photos?feature=popular&consumer_key=0eJ6ywJ0WBACno9hWxqIG2UjLWBnpotZ8hmuBSgG"]
            completionHandler:^(NSData *data,
                    NSURLResponse *response,
                    NSError *error) {
                id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                if (!result) {
                    NSLog(@"%@",error);
                    return;
                }
                NSArray *photos = [result[@"photos"] map:^(id photoData)
                {
                    return [[CBEWebservicePhoto alloc] initWithDictionary:photoData];
                }];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^
                {
                    callback(photos);
                }];

            }] resume];

}
@end
