//
//  ViewRightRootController.m
//  Baking
//
//  Created by Chang Wei on 15/2/3.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewRootController.h"
#import "ViewRightRootController.h"

@interface ViewRightRootController (){
    AppDelegate *App;
    NSMutableDictionary *dict;
    NSString *dataFile, *oldString;
    UITextView *txtMemo;
    UIButton *btnCancel, *btnSubmit;
}

@end

@implementation ViewRightRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    App = [[UIApplication sharedApplication] delegate];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"15"] style:UIBarButtonItemStylePlain target:self action:@selector(editMemo)];
    //self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    self.title = @"药师经注释、读经心得";
    [self createEditableCopyOfDatabaseIfNeeded];
    dataFile = [self applicationDocumentsDirectoryFile];
    //将属性列表文件内容读取到array变量中，也就是获取了属性列表文件中全部的数据集合
    //NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:path];
    dict = [[NSMutableDictionary alloc] initWithContentsOfFile:dataFile];
    
    //UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    //[self.view addSubview:view];
    
    btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 50, SCREEN_WIDTH/2 - 30, 40)];
    btnCancel.backgroundColor = [UIColor colorWithRed:0.8 green:0 blue:0 alpha:1];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnCancel.hidden = TRUE;
    btnCancel.tag = 1;
    [self.view addSubview:btnCancel];
    
    btnSubmit = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2 + 10, SCREEN_HEIGHT - 50, SCREEN_WIDTH/2 - 30, 40)];
    btnSubmit.backgroundColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
    [btnSubmit setTitle:@"确定" forState:UIControlStateNormal];
    [btnSubmit addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnSubmit.hidden = TRUE;
    btnSubmit.tag = 2;
    [self.view addSubview:btnSubmit];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    //gesture.numberOfTapsRequired = 1;
    [self.navigationController.navigationBar addGestureRecognizer:gesture];
}

- (void)viewDidAppear:(BOOL)animated {
    txtMemo = [[UITextView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/8, 20 + 64, 7*SCREEN_WIDTH/8 - 20, SCREEN_HEIGHT - 64-20-60)];
    txtMemo.backgroundColor = [UIColor clearColor];
    txtMemo.font = [UIFont fontWithName:@"Helvetica" size:18];
    txtMemo.editable = FALSE;
    [self.view addSubview:txtMemo];
    
    [self willShow];
}

- (void)willShow {
    if (dict == nil) {
        return;
    }
    ViewRootController *rootVC = [ViewRootController sharedInstance];
    rootVC.currentView = CurrentViewTypeRight;
    NSString *key = [NSString stringWithFormat:@"Page_%i", App.iPageCurrent];
    txtMemo.text = [dict objectForKey:key];
}

- (void)willDisappear {
    ViewRootController *rootVC = [ViewRootController sharedInstance];
    rootVC.currentView = CurrentViewTypeMain;
    if (txtMemo.editable) {
        [self btnClicked:btnSubmit];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClicked:(UIButton *)sender {
    txtMemo.editable = FALSE;
    btnSubmit.hidden = TRUE;
    btnCancel.hidden = TRUE;
    txtMemo.backgroundColor = [UIColor clearColor];
    
    NSString *key;
    switch (sender.tag) {
        case 1:
            txtMemo.text = oldString;
            break;
        case 2:
            key = [NSString stringWithFormat:@"Page_%i", App.iPageCurrent];
            [dict setObject:txtMemo.text forKey:key];
            [dict writeToFile:dataFile atomically:YES];
            break;
        default:
            break;
    }
}

- (void)editMemo {
    oldString = txtMemo.text;
    txtMemo.editable = TRUE;
    btnSubmit.hidden = FALSE;
    btnCancel.hidden = FALSE;
    txtMemo.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
}

//对文件进行预处理，判断在Documents目录下是否存在plist文件，如果不存在则从资源目录下复制一个。
-(void)createEditableCopyOfDatabaseIfNeeded
{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *writableDBPath=[self applicationDocumentsDirectoryFile];
    
    BOOL dbexits=[fileManager fileExistsAtPath:writableDBPath];
    if (!dbexits) {
        NSString *defaultDBPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"memo.plist"];
        NSError *error;
        BOOL success=[fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if (!success) {
            NSAssert1(0,@"错误写入文件：‘%@’",[error localizedDescription]);
        }
    }
}

//获取放置在沙箱Documents目录下的文件的完整路径
-(NSString *)applicationDocumentsDirectoryFile
{
    NSString *documentDirectory=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[documentDirectory stringByAppendingPathComponent:@"memo.plist"];
    return path;
}

- (void)hideKeyboard {
    [txtMemo resignFirstResponder];
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
