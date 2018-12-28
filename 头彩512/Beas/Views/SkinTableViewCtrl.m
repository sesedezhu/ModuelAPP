//
//  SkinTableViewCtrl.m
//  HaiBa
//
//  Created by 涛程 on 17/3/22.
//  Copyright © 2017年 涛程. All rights reserved.
//

#import "SkinTableViewCtrl.h"
#import "ThemeManager.h"
#import "BaseHeader.h"

@interface SkinTableViewCtrl ()

@end

@implementation SkinTableViewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我";
    
    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
    _themeDataSource = [NSMutableArray arrayWithArray:themeManager.themePlistDict.allKeys];
    NSLog(@"SkinTableViewCtrl->_themeDataSource = %@",_themeDataSource);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.themeDataSource.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * Identifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    NSString * text = self.themeDataSource[indexPath.row];
    cell.textLabel.text = text;
    
    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
    NSString * currentTheme = themeManager.themeName;
    if (currentTheme == nil) {
        currentTheme = @"默认";
    }
    if ([currentTheme isEqualToString:text]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ThemeManager * themeManager = [ThemeManager sharedThemeManager];
    NSString * themeName = self.themeDataSource[indexPath.row];
    
    if ([themeName isEqualToString:@"默认"]) {
        themeName = nil;
    }
    
    // 记录当前主题名字
    themeManager.themeName = themeName;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChangedNotification object:nil];
    
    
    // 主题持久化
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:themeName forKey:kThemeNameKey];
    [userDefaults synchronize];
    
    // 重新加载数据显示UITableViewCellAccessoryCheckmark 显示选中的对号 v
    [self.tableView reloadData];
}


@end
