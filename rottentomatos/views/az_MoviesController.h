//
//  az_MoviesViewController.h
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "az_RottenTomatoClient.h"
#import "MBProgressHUD.h"

@interface az_MoviesController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (void)getMovies:(void (^)(NSMutableArray/*<az_Movie>*/ * movies))success
       andFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
