//
//  az_CastMember.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_CastMember.h"

@implementation az_CastMember

- (az_CastMember *)initWithDictionary:(NSDictionary *)dict
{
    self.name = [dict valueForKey:@"name"];
    return self;
}

- (NSString *)description
{
    return self.name;
}

@end
