//
// Created by chris on 18.05.14.
//

#import "CBEDetailViewController.h"
#import "CBEWebservicePhoto.h"
#import "CBEFullScreenPhotoViewController.h"
#import "ModelContainer.h"

@interface CBEDetailViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet ModelContainer *modelContainer;

@end

@implementation CBEDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.modelContainer.model = self.photo;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CBEFullScreenPhotoViewController *destination = segue.destinationViewController;
    destination.photo = self.photo;
}


@end
