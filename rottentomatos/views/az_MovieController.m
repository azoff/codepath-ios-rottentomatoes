//
//  az_MovieController.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/14/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_MovieController.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"

@interface az_MovieController ()

@property (weak, nonatomic) IBOutlet UIImageView *fullImageView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;

@property (nonatomic) az_Movie *movie;

@end

@implementation az_MovieController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _movie.title;
    _synopsisLabel.text = _movie.synopsis;
    _castLabel.text = [_movie.castMemebers componentsJoinedByString:@", "];
    NSURLRequest * request = [NSURLRequest requestWithURL:_movie.posterFull];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.yOffset = -70.0f;
    
    [_fullImageView setImageWithURLRequest:request
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       _fullImageView.image = image;
                                       [hud hide:YES];
                                   }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       // TODO Add network error
                                       NSLog(@"%@", error);
                                       [hud hide:YES];
                                   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
