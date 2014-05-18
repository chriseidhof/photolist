//
// Created by chris on 18.05.14.
//

#import "UITableViewCell+CBEConfigureForPhoto.h"
#import "CBEWebservicePhoto.h"


@implementation UITableViewCell (CBEConfigureForPhoto)


- (void)configureForPhoto:(CBEWebservicePhoto *)photo
{
    self.textLabel.text = photo.name;
    self.detailTextLabel.text = photo.user;
}
@end
