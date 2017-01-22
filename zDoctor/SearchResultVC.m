//
//  SearchResultVC.m
//  zDoctor
//
//  Created by David Iskander on 12/1/16.
//  Copyright © 2016 David Iskander. All rights reserved.
//

#import "SearchResultVC.h"

@interface SearchResultVC ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *searchResult;

@end

@implementation SearchResultVC
{
    NSMutableArray *tableDataArray;
    BOOL searchEnabled;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableDataArray = [[NSMutableArray alloc]initWithObjects:@"Ram",@"Shyam",@"Mohan",@"nilesh", nil];
    self.searchResult = [NSMutableArray arrayWithCapacity:[tableDataArray count]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -  tableView Delagate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (searchEnabled) {
        return [self.searchResult count];
    }
    else{
        return [tableDataArray count];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (searchEnabled) {
        cell.textLabel.text = [self.searchResult objectAtIndex:indexPath.row];
        
    }
    else{
        cell.textLabel.text = [tableDataArray objectAtIndex:indexPath.row];
    }
    return cell;
}



#pragma mark - Search delegate methods

- (void)filterContentForSearchText:(NSString*)searchText
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF CONTAINS %@",
                                    searchText];
    
    _searchResult = [tableDataArray filteredArrayUsingPredicate:resultPredicate];
    [_tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0) {
        searchEnabled = NO;
        [self.tableView reloadData];
    }
    else {
        searchEnabled = YES;
        [self filterContentForSearchText:searchBar.text];
    }
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchEnabled = YES;
    [self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setText:@""];
    searchEnabled = NO;
    [_tableView reloadData];
    
}


@end
