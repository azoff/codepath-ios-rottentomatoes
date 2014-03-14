//
//  az_MovieController.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/14/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_MovieController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

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
    [_fullImageView setImageWithURLRequest:request
                          placeholderImage:nil
                                   success:nil
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                       // TODO Add network error
                                       NSLog(@"%@", error);
                                   }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
