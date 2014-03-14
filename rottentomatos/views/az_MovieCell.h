//
//  az_MovieCell.h
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "az_Movie.h"

@interface az_MovieCell : UITableViewCell

- (void)updateContent:(az_Movie *)movie
          withFailure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure;

@end
