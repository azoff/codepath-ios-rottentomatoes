//
//  az_CastMember.h
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface az_CastMember : NSObject

@property (nonatomic) NSString *name;

- (az_CastMember *)initWithDictionary:(NSDictionary *)dict;

@end
