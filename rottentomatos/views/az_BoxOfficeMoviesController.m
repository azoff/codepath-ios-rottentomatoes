//
//  az_BoxOfficeMoviesControllerViewController.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/14/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_BoxOfficeMoviesController.h"

@interface az_BoxOfficeMoviesController ()

@end

@implementation az_BoxOfficeMoviesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Box Office Movies";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Box Office" image:nil tag:1];
        self.tabBarItem.image = [[UIImage imageNamed:@"movies.png"]
                                         imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"movies_selected.png"]
                                         imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)getMovies:(void (^)(NSMutableArray *))success andFailure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [az_RottenTomatoClient getBoxOfficeMoviesWithSuccess:success andFailure: failure];
}

@end
