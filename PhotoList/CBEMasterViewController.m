//
//  CBEMasterViewController.m
//  PhotoList
//
//  Created by Chris Eidhof on 18.05.14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//

#import "CBEMasterViewController.h"
#import "Webservice.h"
#import "CBEWebservicePhoto.h"
#import "CBEDetailViewController.h"
#import "UITableViewCell+CBEConfigureForPhoto.h"

@interface CBEMasterViewController ()

@property (nonatomic) Webservice *webservice;
@property (nonatomic, strong) NSArray *photos;
@end

@implementation CBEMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webservice = [[Webservice alloc] init];

    [self.webservice loadPhotos:^(NSArray *photos){
        self.photos = photos;
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    CBEWebservicePhoto * photo = [self photoAtIndexPath:indexPath];
    [cell configureForPhoto:photo];
    return cell;
    
}

- (CBEWebservicePhoto *)photoAtIndexPath:(NSIndexPath *)indexPath
{
    return self.photos[(NSUInteger) indexPath.row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CBEDetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.photo = [self photoAtIndexPath:self.tableView.indexPathForSelectedRow];
}


@end
