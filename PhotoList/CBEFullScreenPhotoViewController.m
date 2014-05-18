//
// Created by chris on 18.05.14.
//

#import "CBEFullScreenPhotoViewController.h"
#import "CBEWebservicePhoto.h"

@interface CBEFullScreenPhotoViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *photoView;

@end

@implementation CBEFullScreenPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.photoView.image = self.photo.image;
   self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
