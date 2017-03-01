//
//  ViewController.m
//  SearchText
//
//  Created by Mahaboobsab Nadaf on 16/02/17.
//  Copyright © 2017 Meheboob Nadaf. All rights reserved.
//

#import "ViewController.h"



#define ResultsTableView self.searchResultsTableViewController.tableView

#define Identifier @"Cell"

@interface ViewController ()<UISearchControllerDelegate,UISearchBarDelegate>


@property (strong, nonatomic) UITableViewController *searchResultsTableViewController;

@property (strong, nonatomic) NSArray *cities;
@property (strong, nonatomic) NSArray *results;
@property(strong,nonatomic)NSArray*   headerIndexTitle;
@end
@implementation ViewController {
    //   NSMutableArray *shortResults;
    NSIndexPath *indxPth;
    int decideGlossList;
    int decideHeader;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Arrays init & sorting.
    self.cities = [@[@"Boston", @"New York", @"Oregon", @"Tampa", @"Los Angeles", @"Dallas", @"Miami", @"Olympia", @"Montgomery", @"Washington", @"Orlando", @"Detroit"] sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj2 localizedCaseInsensitiveCompare:obj1] == NSOrderedAscending;
    }];
    
    self.results = [[NSMutableArray alloc] init];
    
    // A table view for results.
    UITableView *searchResultsTableView = [[UITableView alloc] initWithFrame:self.myTableView.frame];
    searchResultsTableView.dataSource = self;
    searchResultsTableView.delegate = self;
    
    // Registration of reuse identifiers.
    [searchResultsTableView registerClass:UITableViewCell.class forCellReuseIdentifier:Identifier];
    [self.myTableView registerClass:UITableViewCell.class forCellReuseIdentifier:Identifier];
    
    // Init a search results table view controller and setting its table view.
    self.searchResultsTableViewController = [[UITableViewController alloc] init];
    self.searchResultsTableViewController.tableView = searchResultsTableView;
    
    // Init a search controller with its table view controller for results.
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchResultsTableViewController];
    self.searchController.searchResultsUpdater = self;
    self.searchController.delegate = self;
    
    // Make an appropriate size for search bar and add it as a header view for initial table view.
    [self.searchController.searchBar sizeToFit];
    self.myTableView.tableHeaderView = self.searchController.searchBar;
    
    // Enable presentation context.
    self.definesPresentationContext = YES;
    
    
    
    
    
    
    decideHeader = 1;
    decideGlossList=0;
    
    self.glossSectionHeaderArray = [[NSArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"F",@"G",@"H",@"I",@"L",@"M",@"N",@"O",@"P",@"R",@"S",@"U",@"X",@"Z", nil];
    self.aArray = [[NSArray alloc]initWithObjects:@"abstract class",@"array",@"Application Kit",@"archiving",@"accessor method",@"Automatic Reference Counting",@"automatic variable",@"autorelease pool", nil];
    self.bArray = [[NSArray alloc]initWithObjects:@"block",@"bitfield", nil];
    self.cArray = [[NSArray alloc]initWithObjects:@"character string",@"category",@"class",@"class method",@"class object",@"Cocoa Touch",@"collection",@"compile time",@"composite class",@"conform", nil];
    self.dArray = [[NSArray alloc]initWithObjects:@"delegate",@"directive",@"dynamic binding",@"data encapsulation",@"designated initializer", nil];
    //   self.eArray = [[NSArray alloc]init];
    self.fArray = [[NSArray alloc]initWithObjects:@"forwarding",@"Foundation Framework",@"function",@"formal protocol", nil];
    self.gArray = [[NSArray alloc]initWithObjects:@"gcc",@"garbage collection",@"getter method",@"gdb",@"global variable", nil];
    self.hArray = [[NSArray alloc]initWithObjects:@"header file", nil];
    self.iArray = [[NSArray alloc]initWithObjects:@"id",@"immutable object",@"informal protocol",@"inheritance",@"implementation section",@"instance method",@"Interface Builder",@"intance",@"interface section", nil];
    //   self.jArray = [[NSArray alloc]init];
    //  self.kArray = [[NSArray alloc]init];
    self.lArray = [[NSArray alloc]initWithObjects:@"local variable",@"localization",@"linking", nil];
    self.mArray = [[NSArray alloc]initWithObjects:@"message",@"method",@"mutable object",@"message expression", nil];
    self.nArray = [[NSArray alloc]initWithObjects:@"nil",@"notification",@"NSObject",@"null character",@"null pointer", nil];
    self.oArray = [[NSArray alloc]initWithObjects:@"object-oriented programming",@"object", nil];
    self.pArray = [[NSArray alloc]initWithObjects:@"property list",@"parent class",@"pointer",@"polymorphism",@"preprocessor",@"protocol", nil];
    //   self.qArray = [[NSArray alloc]init];
    self.rArray = [[NSArray alloc]initWithObjects:@"retain count",@"root object",@"runtime",@"receiver", nil];
    self.sArray = [[NSArray alloc]initWithObjects:@"selector",@"self",@"set",@"setter method",@"static funtion",@"static variable",@"structure",@"super class",@"synthesized method", nil];
    //  self.tArray = [[NSArray alloc]init];
    self.uArray = [[NSArray alloc]initWithObjects:@"UIKit",@"union",@"Unicode Character",nil];
    //  self.vArray = [[NSArray alloc]init];
    //  self.wArray = [[NSArray alloc]init];
    self.xArray = [[NSArray alloc]initWithObjects:@"Xcode",@"XML", nil];
    //  self.yArray = [[NSArray alloc]init];
    self.zArray = [[NSArray alloc]initWithObjects:@"zone", nil];
    
    self.mainArray = [[NSMutableArray alloc] init];
    [self.mainArray addObjectsFromArray:self.aArray];
    [self.mainArray addObjectsFromArray:self.bArray];
    [self.mainArray addObjectsFromArray:self.cArray];
    [self.mainArray addObjectsFromArray:self.dArray];
    [self.mainArray addObjectsFromArray:self.fArray];
    [self.mainArray addObjectsFromArray:self.gArray];
    [self.mainArray addObjectsFromArray:self.hArray];
    [self.mainArray addObjectsFromArray:self.iArray];
    [self.mainArray addObjectsFromArray:self.lArray];
    [self.mainArray addObjectsFromArray:self.mArray];
    [self.mainArray addObjectsFromArray:self.nArray];
    [self.mainArray addObjectsFromArray:self.oArray];
    [self.mainArray addObjectsFromArray:self.pArray];
    [self.mainArray addObjectsFromArray:self.rArray];
    [self.mainArray addObjectsFromArray:self.sArray];
    [self.mainArray addObjectsFromArray:self.uArray];
    [self.mainArray addObjectsFromArray:self.xArray];
    [self.mainArray addObjectsFromArray:self.zArray];
    self.searchResult = [[NSMutableArray alloc] init];
    
    
    // NSLog(@"%ld",self.mainArray.count);
    //[shortResults arrayByAddingObjectsFromArray:mainArray];
    
    // shortResults = mainArray;
    
    self.searchResult = [[NSMutableArray alloc]init];
    
    self.headerIndexTitle = [[NSArray alloc] init];
    self.headerIndexTitle = @[@"A", @"B", @"C", @"D", @"F",@"G", @"H", @"I", @"L", @"M", @"N", @"O", @"P", @"R", @"S", @"U", @"X", @"Z"];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Hide search bar.
    [self dismissSearchBarAnimated:NO];
}

#pragma mark - Util methods

- (void)dismissSearchBarAnimated: (BOOL)animated {
    CGFloat offset = (self.searchController.searchBar.bounds.size.height) - (self.navigationController.navigationBar.bounds.size.height + [UIApplication sharedApplication].statusBarFrame.size.height);
    
    if (animated) {
        [UIView animateWithDuration:0.5 animations:^{
            self.myTableView.contentOffset = CGPointMake(0, offset);
        }];
    } else {
        self.myTableView.contentOffset = CGPointMake(0, offset);
    }
}


#pragma mark - Table View Data Source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if ([tableView isEqual:ResultsTableView]) {
//        if (self.results) {
//            return self.results.count;
//        } else {
//            return 0;
//        }
//    } else {
//        
//        return self.cities.count;
//    }
//}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    decideHeader = 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:ResultsTableView]) {
        return [self.searchResult count];
        
    }
    
    else if(section==0)
    {
        return self.aArray.count;
    }
    else if (section==1)
    {
        return self.bArray.count;
    }
    else if (section==2)
    {
        return self.cArray.count;
    }
    else if (section==3)
    {
        return self.dArray.count;
    }
    else if (section==4)
    {
        return self.fArray.count;
    }
    else if (section==5)
    {
        return self.gArray.count;
    }
    else if (section==6)
    {
        return self.hArray.count;
    }
    else if (section==7)
    {
        return self.iArray.count;
    }
    else if (section==8)
    {
        return self.lArray.count;
    }
    else if (section==9)
    {
        return self.mArray.count;
    }
    else if (section==10)
    {
        return self.nArray.count;
    }
    else if (section==11)
    {
        return self.oArray.count;
    }
    else if (section==12)
    {
        return self.pArray.count;
    }
    else if (section==13)
    {
        return self.rArray.count;
    }else if (section==14)
    {
        return self.sArray.count;
    }
    else if (section==15)
    {
        return self.uArray.count;
    }
    else if (section==16)
    {
        return self.xArray.count;
    }
    else if (section==17)
    {
        return self.zArray.count;
    }
    else {
        //return [self.mainArray count];
        
    }
    return 0;
}







-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    if (decideHeader == 1) {
        
        if(section==0)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==1)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==2)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==3)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==4)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==5)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==6)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==7)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==8)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==9)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==10)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==11)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==12)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==13)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }else if (section==14)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==15)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==16)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
        else if (section==17)
        {
            return [self.headerIndexTitle objectAtIndex:section];
        }
    }
    if (decideHeader ==0) {
        return nil;
        
    }
    return nil;
    //return [self.headerIndexTitle objectAtIndex:section];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([tableView isEqual:ResultsTableView]) {
        return [self.searchResult count];
        
    } else {
        return [self.mainArray count];
        
    }
    //return self.mainArray.count;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
//    
//    NSString *text;
//    if ([tableView isEqual:ResultsTableView]) {
//        text = self.results[indexPath.row];
//    } else {
//        text = self.cities[indexPath.row];
//    }
//    
//    cell.textLabel.text = text;
//    
//    return cell;
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    indxPth=indexPath;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if ([tableView isEqual:ResultsTableView])
    {
        decideGlossList=1;
        // self.string = [self.searchResult objectAtIndex:indexPath.row];
        cell.textLabel.text = [self.searchResult objectAtIndex:indexPath.row];
    }
    
    else {
        //cell.textLabel.text = [self.mainArray objectAtIndex:indexPath.row];
        
        decideGlossList=2;
        if([indexPath section]==0)
        {
            //   self.string =self.aArray[indexPath.row];
            cell.textLabel.text =  self.aArray[indexPath.row];
        }
        else if ([indexPath section]==1)
        {
            //  self.string =self.bArray[indexPath.row];
            cell.textLabel.text = self.bArray[indexPath.row];
        }
        else if ([indexPath section]==2)
        {
            //  self.string=self.cArray[indexPath.row];
            cell.textLabel.text = self.cArray[indexPath.row];
        }
        else if ([indexPath section]==3)
        {
            //  self.string=self.dArray[indexPath.row];
            cell.textLabel.text = self.dArray[indexPath.row];
        }
        else if ([indexPath section]==4)
        {
            //  self.string=self.fArray[indexPath.row];
            cell.textLabel.text = self.fArray[indexPath.row];
        }
        else if ([indexPath section]==5)
        {
            //  self.string=self.gArray[indexPath.row];
            cell.textLabel.text = self.gArray[indexPath.row];
        }
        else if ([indexPath section]==6)
        {
            // self.string=self.hArray[indexPath.row];
            cell.textLabel.text = self.hArray[indexPath.row];
        }
        else if ([indexPath section]==7)
        {
            // self.string=self.iArray[indexPath.row];
            cell.textLabel.text = self.iArray[indexPath.row];
        }
        else if ([indexPath section]==8)
        {
            //  self.string=self.lArray[indexPath.row];
            cell.textLabel.text = self.lArray[indexPath.row];
        }
        else if ([indexPath section]==9)
        {
            //  self.string=self.mArray[indexPath.row];
            cell.textLabel.text = self.mArray[indexPath.row];
        }
        else if ([indexPath section]==10)
        {
            //  self.string =self.nArray[indexPath.row];
            cell.textLabel.text = self.nArray[indexPath.row];
        }
        else if ([indexPath section]==11)
        {
            //  self.string=self.oArray[indexPath.row];
            cell.textLabel.text = self.oArray[indexPath.row];
        }
        else if ([indexPath section]==12)
        {
            //  self.string =self.pArray[indexPath.row];
            cell.textLabel.text = self.pArray[indexPath.row];
        }
        else if ([indexPath section]==13)
        {
            //  self.string =self.rArray[indexPath.row];
            cell.textLabel.text = self.rArray[indexPath.row];
        }else if ([indexPath section]==14)
        {
            //  self.string=self.sArray[indexPath.row];
            cell.textLabel.text = self.sArray[indexPath.row];
        }
        else if ([indexPath section]==15)
        {
            //  self.string=self.uArray[indexPath.row];
            cell.textLabel.text = self.uArray[indexPath.row];
        }
        else if ([indexPath section]==16)
        {
            //  self.string=self.xArray[indexPath.row];
            cell.textLabel.text = self.xArray[indexPath.row];
        }
        else if ([indexPath section]==17)
        {
            //  self.string=self.zArray[indexPath.row];
            cell.textLabel.text = self.zArray[indexPath.row];
        }
        
    }
    
    
    
    
    
    
    return cell;
}


-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.glossSectionHeaderArray;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

#pragma mark - Search Results Updating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    UISearchBar *searchBar = searchController.searchBar;
    if (searchBar.text.length > 0) {
        NSString *text = searchBar.text;
        
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *city, NSDictionary *bindings) {
            NSRange range = [city rangeOfString:text options:NSCaseInsensitiveSearch];
            
            return range.location != NSNotFound;
        }];
        
        // Set up results.
        NSArray *searchResults = [self.mainArray filteredArrayUsingPredicate:predicate];
        self.searchResult = searchResults;
        
        // Reload search table view.
        [self.searchResultsTableViewController.tableView reloadData];
    }
}

#pragma mark - Search Controller Delegate

- (void)didDismissSearchController:(UISearchController *)searchController {
    [self dismissSearchBarAnimated:YES];
}
@end
