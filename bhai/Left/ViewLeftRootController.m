//
//  ViewLeftController1.m
//  Baking
//
//  Created by Chang Wei on 15/1/31.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import "TabMainController.h"
#import "ViewRootController.h"
#import "TableViewCell.h"
#import "ViewLeftRootController.h"
#import "ViewMainController.h"
//#import "NavigationSlideController.h"
#import "ViewRootController.h"

@interface ViewLeftRootController () {
    NSArray *arrayRoot, *arraySection, *arrayWithPY, *arrayNoPY;
    NSArray *arrayFavorites, *arrayRecipe, *arrayShare, *arraySystem;
    NSMutableArray *arrayCell;
}

@end

@implementation ViewLeftRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"药师琉璃光如来本愿功德经";
    arraySection = [NSArray arrayWithObjects:@"系统设定", @"简体拼音版", @"简体中文版", nil];
    arrayWithPY = [NSArray arrayWithObjects:@[@"炉香赞", @"55"], @[@"药师琉璃光如来本愿功德经",@"55"], @[@"祈祷加持颂",@"55"], nil];
    arrayNoPY = [NSArray arrayWithObjects:@[@"炉香赞", @"55"], @[@"药师琉璃光如来本愿功德经",@"55"], @[@"祈祷加持颂",@"55"], nil];
    arraySystem = [NSArray arrayWithObjects:@[@"用户设定", @"04"], @[@"关于我们", @"09"], nil];
    arrayRoot = [NSArray arrayWithObjects:arraySystem, arrayWithPY, arrayNoPY, nil];
    
    tableCurrent= [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    tableCurrent.backgroundColor = [UIColor clearColor];
    tableCurrent.delegate = self;
    tableCurrent.dataSource = self;
    [self.view addSubview:tableCurrent];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return arraySection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSArray *)[arrayRoot objectAtIndex:section]).count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *viewHeader;
    UILabel *lblHeader;
    viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    lblHeader = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 21)];
    lblHeader.textColor = [UIColor whiteColor];
    lblHeader.text = [arraySection objectAtIndex:section];
    [viewHeader addSubview:lblHeader];
    return viewHeader;
}

- (TableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    arrayCell = [[arrayRoot objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.imgTitle.image = [UIImage imageNamed:[arrayCell objectAtIndex:1]];
    cell.lblTitle.text = [arrayCell objectAtIndex:0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        //App.contentMode = ContentModeTypeFTPY;
        //App.iPageCurrent = 1;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 2;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        //App.contentMode = ContentModeTypeFTPY;
        //App.iPageCurrent = 2;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 3;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 1 && indexPath.row == 0) {
        App.contentMode = ContentModeTypeFTPY;
        App.iPageCurrent = 1;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        App.contentMode = ContentModeTypeFTPY;
        App.iPageCurrent = 2;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 1 && indexPath.row == 2) {
        App.contentMode = ContentModeTypeFTPY;
        App.iPageCurrent = 38;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        App.contentMode = ContentModeTypeFT;
        App.iPageCurrent = 1;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 2 && indexPath.row == 1) {
        App.contentMode = ContentModeTypeFT;
        App.iPageCurrent = 2;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }else if (indexPath.section == 2 && indexPath.row == 2) {
        App.contentMode = ContentModeTypeFT;
        App.iPageCurrent = 38;
        ViewRootController *rootVC = [ViewRootController sharedInstance];
        rootVC.mainViewController.selectedIndex = 1;
        [rootVC hideSlideViewController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
