//
//  ViewController.h
//  SearchText
//
//  Created by Mahaboobsab Nadaf on 16/02/17.
//  Copyright © 2017 Meheboob Nadaf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UISearchBarDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@property(nonatomic,strong)NSArray *aArray;
@property(nonatomic,strong)NSArray *bArray;
@property(nonatomic,strong)NSArray *cArray;
@property(nonatomic,strong)NSArray *dArray;
@property(nonatomic,strong)NSArray *fArray;
@property(nonatomic,strong)NSArray *gArray;
@property(nonatomic,strong)NSArray *hArray;
@property(nonatomic,strong)NSArray *iArray;
@property(nonatomic,strong)NSArray *lArray;
@property(nonatomic,strong)NSArray *mArray;
@property(nonatomic,strong)NSArray *nArray;
@property(nonatomic,strong)NSArray *oArray;
@property(nonatomic,strong)NSArray *pArray;
@property(nonatomic,strong)NSArray *rArray;
@property(nonatomic,strong)NSArray *sArray;
@property(nonatomic,strong)NSArray *tArray;
@property(nonatomic,strong)NSArray *uArray;
@property(nonatomic,strong)NSArray *xArray;
@property(nonatomic,strong)NSArray *zArray;

@property(nonatomic,strong)NSArray *searchResult;
@property(nonatomic,strong)NSMutableArray *mainArray;
@property(nonatomic,strong)NSString* string;
@property(nonatomic,strong)NSArray *glossSectionHeaderArray;
@end

