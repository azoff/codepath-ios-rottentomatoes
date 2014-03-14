//
//  az_RottenTomatoClient.h
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface az_RottenTomatoClient : NSObject

+ (void)getMoviesWithSuccess:(void (^)(NSMutableArray/*<az_Movie>*/ * movies))success
                  andFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
