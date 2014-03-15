//
//  az_TopRentalsController.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/14/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_TopRentalsController.h"

@interface az_TopRentalsController ()

@end

@implementation az_TopRentalsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Top DVD Rentals";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Rentals" image:nil tag:2];
        self.tabBarItem.image = [[UIImage imageNamed:@"rentals.png"]
                                 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"rentals_selected.png"]
                                         imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)getMovies:(void (^)(NSMutableArray *))success andFailure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [az_RottenTomatoClient getTopRentalsWithSuccess:success andFailure: failure];
}

@end
