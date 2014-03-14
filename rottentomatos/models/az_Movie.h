//
//  az_Movie.h
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface az_Movie : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *synopsis;
@property (nonatomic) NSURL *posterThumb;
@property (nonatomic) NSURL *posterFull;
@property (nonatomic) NSMutableArray* /*<az_CastMember>*/ castMemebers;

- (az_Movie *)initWithDictionary:(NSDictionary*)dict;

@end
