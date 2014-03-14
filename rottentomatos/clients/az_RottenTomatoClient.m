//
//  az_RottenTomatoClient.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_RottenTomatoClient.h"
#import "az_Movie.h"
#import <AFNetworking/AFNetworking.h>

static NSString * const BASE_URL = @"http://api.rottentomatoes.com/api/public/v1.0";
static NSString * const API_KEY  = @"azx4yy67n4pf5x6h88x36fjt";

@interface az_RottenTomatoClient ()

+ (void)getJSON:(NSString*)forPath
    withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     andFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end

@implementation az_RottenTomatoClient

+ (void)getJSON:(NSString*)forPath
    withSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     andFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    NSString *url = [NSString stringWithFormat:@"%@%@.json?apikey=%@", BASE_URL, forPath, API_KEY];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:success failure:failure];
    [operation start];
}

+ (void)getMoviesWithSuccess:(void (^)(NSMutableArray/*<az_Movie>*/ * movies))success
     andFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self getJSON:@"/lists/movies/box_office" withSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *movies = [[NSMutableArray alloc] init];
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *moviesArray = [responseDict valueForKey:@"movies"];
        for (NSDictionary *movieDict in moviesArray)
            [movies addObject:[[az_Movie alloc] initWithDictionary:movieDict]];
        success(movies);
    } andFailure:failure];
}

@end
