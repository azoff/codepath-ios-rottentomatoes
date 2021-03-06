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

static NSString * const CELL_ID  = @"az_MovieCell";

@interface az_MoviesController ()

@property (weak, nonatomic) IBOutlet UIView *networkErrorView;
@property (weak, nonatomic) IBOutlet UITableView *moviesTableView;
@property (nonatomic) NSMutableArray* movies;

- (void)fetchContent:(UIRefreshControl*)refreshControl;

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
    
    // pull to refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [_moviesTableView addSubview:refreshControl];

    // set up table view
    _moviesTableView.separatorInset = UIEdgeInsetsZero;
    _moviesTableView.dataSource = self;
    _moviesTableView.delegate = self;
    [_moviesTableView registerNib:[UINib nibWithNibName:CELL_ID
                                                     bundle:[NSBundle mainBundle]]
                                     forCellReuseIdentifier:CELL_ID];
    // show a loading indicator
    [self fetchContent:nil];
    
}

- (void)viewWillAppear:(BOOL)animated
{
	NSIndexPath* selection = [_moviesTableView indexPathForSelectedRow];
	if (selection)
		[_moviesTableView deselectRowAtIndexPath:selection animated:YES];
}

- (void)fetchContent:(UIRefreshControl*)refreshControl
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self getMovies:^(NSMutableArray *movies) {
        _movies = movies;
        [_moviesTableView reloadData];
        if (refreshControl != nil) [refreshControl endRefreshing];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } andFailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // TODO Add network error
        NSLog(@"%@", error);
        CGRect frame = _networkErrorView.frame;
        frame.size.height = 23;
        _networkErrorView.frame = frame;
        if (refreshControl != nil) [refreshControl endRefreshing];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getMovies:(void (^)(NSMutableArray *))success andFailure:(void (^)(AFHTTPRequestOperation *, NSError *))failure {
    
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

- (void)refresh:(UIRefreshControl *)refreshControl {
    [refreshControl endRefreshing];
}

@end
