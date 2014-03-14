//
//  az_Movie.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_Movie.h"
#import "az_CastMember.h"

@implementation az_Movie

- (az_Movie *)initWithDictionary:(NSDictionary *)dict
{
    _title        = [dict valueForKey:@"title"];
    _synopsis     = [dict valueForKey:@"synopsis"];
    
    _castMemebers = [[NSMutableArray alloc] init];
    NSDictionary *castMemberDicts = [dict valueForKey:@"abridged_cast"];
    for (NSDictionary *castMemberDict in castMemberDicts)
        [_castMemebers addObject:[[az_CastMember alloc] initWithDictionary:castMemberDict]];
    
    NSDictionary *posters = [dict valueForKey:@"posters"];
    _posterThumb = [NSURL URLWithString:[posters valueForKey:@"thumbnail"]];
    _posterFull  = [NSURL URLWithString:[posters valueForKey:@"original"]];
    
    return self;
}

@end
