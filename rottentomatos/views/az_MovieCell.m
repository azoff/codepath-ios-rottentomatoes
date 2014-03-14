//
//  az_MovieCell.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_MovieCell.h"
#import "az_CastMember.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface az_MovieCell ()

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsisLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieThumbView;

@end

@implementation az_MovieCell


- (void)updateContent:(az_Movie *)movie
          withFailure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error))failure
{
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _movieTitleLabel.text = movie.title;
    _movieSynopsisLabel.text = movie.synopsis;
    _movieCastLabel.text = [movie.castMemebers componentsJoinedByString:@", "];

    // load thumbnail
    UIImage *placeholder = [UIImage imageNamed:@"tomato1.png"];
    NSURLRequest * request = [NSURLRequest requestWithURL:movie.posterThumb];
    [_movieThumbView setImageWithURLRequest:request placeholderImage:placeholder success:nil failure:failure];
}

- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
