//
//  az_MoviesViewController.m
//  rottentomatos
//
//  Created by Jonathan Azoff on 3/13/14.
//  Copyright (c) 2014 Jonathan Azoff. All rights reserved.
//

#import "az_MovieCell.h"
#import "az_MoviesController.h"
#import "az_MovieController.h"
#import "az_RottenTomatoClient.h"
#import "MBProgressHUD.h"

static NSString * const CELL_ID  = @"az_MovieCell";

@interface az_MoviesController ()

@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (nonatomic) NSMutableArray* movies;

@end

@implementation az_MoviesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.edgesForExtendedLayout               = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars     = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.title = @"Box Office Movies";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // set up table view
    _moviesTableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 90.0f, 0.0f);
    _moviesTableView.separatorInset = UIEdgeInsetsZero;
    _moviesTableView.dataSource = self;
    _moviesTableView.delegate = self;
    [_moviesTableView registerNib:[UINib nibWithNibName:CELL_ID
                                                     bundle:[NSBundle mainBundle]]
                                     forCellReuseIdentifier:CELL_ID];
    

    // show a loading indicator
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [az_RottenTomatoClient getMoviesWithSuccess:^(NSMutableArray *movies) {
        _movies = movies;
        [_moviesTableView reloadData];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // TODO Add network error
        NSLog(@"%@", error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (_movies == nil) ? 0 : [_movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    az_MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    az_Movie *movie = [_movies objectAtIndex:indexPath.item];
    
    [cell updateContent:movie withFailure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        // TODO Add network error
        NSLog(@"%@", error);
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    az_MovieController *next = [[az_MovieController alloc] init];
    [next setMovie:[_movies objectAtIndex:indexPath.item]];
    [self.navigationController pushViewController:next animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 109;
}

@end
