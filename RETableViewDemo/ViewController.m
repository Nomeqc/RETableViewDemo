//
//  ViewController.m
//  RETableViewDemo
//
//  Created by iOSDeveloper003 on 17/2/14.
//  Copyright © 2017年 Liang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "RETableViewManager.h"
#import "GrowingTextCell.h"
#import "SeparatorLineCell.h"

@interface ViewController ()
<RETableViewManagerDelegate>

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) RETableViewManager *manager;

@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"数据驱动tableView Demo";
    [self setupUI];
    [self registerCell];
    [self loadData];
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [self.tableView reloadData];
    });
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
}

- (void)registerCell {
    /**
      * 注册cell
     **/
    //高度自适应 文本内容cell
    self.manager[NSStringFromClass([GrowingTextItem class])] = NSStringFromClass([GrowingTextCell class]);
    
    //分割线cell
    self.manager[NSStringFromClass([SeparatorLineItem class])] = NSStringFromClass([SeparatorLineCell class]);
}

- (void)loadData {
    
    NSArray<NSString *> *testContents = @[@"党的十八届六中全会聚焦全面从严治党，审议通过了《关于新形势下党内政治生活的若干准则》和《中国共产党党内监督条例》，踏上了全面从严治党的新征程。13日，省部级主要领导干部学习贯彻十八届六中全会精神专题研讨班在中央党校开班。习近平总书记出席并发表重要讲话。新华社《学习进行时》原创品牌栏目“讲习所”今天推出文章，为您解析总书记的讲话，以期更好理解党要管党、从严治党的要义",
                              @"专家：首艘国产航母或今年上半年下水",
                              @"为何要特别针对一季度空气质量开展专项督查?据了解，此次督查主要目的，是“为推动地方党委、政府落实大气污染防治责任，遏制2017年以来京津冀及周边地区重点城市空气质量恶化趋势”。2017年1月，京津冀及周边遭遇跨年重污染，至1月7日方才结束。而此后一周，新一轮重污染再次袭击京津冀及周边区域。",
                                          @"6省空气“惊动”了环保部长 他要亲自带队督查",
                              @"为何要特别针对一季度空气质量开展专项督查?据了解，此次督查主要目的，是“为推动地方党委、政府落实大气污染防治责任，遏制2017年以来京津冀及周边地区重点城市空气质量恶化趋势”。2017年1月，京津冀及周边遭遇跨年重污染，至1月7日方才结束。而此后一周，新一轮重污染再次袭击京津冀及周边区域"];
    /**
      RETableViewSection 对应tableView 的一个 section
      RETableViewItem 对应一行cell
     **/
    [self.manager addSection:({
        RETableViewSection *section = [[RETableViewSection alloc] init];
        [testContents enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [section addItem:({
                GrowingTextItem *item = [[GrowingTextItem alloc] init];
                [item setSelectionHandler:^(GrowingTextItem  *item) {
                    NSLog(@"selected cell at section:%ld row:%ld",item.indexPath.section,item.indexPath.row);
                    [item.section.tableViewManager.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
                }];
                [item setSelectionStyle:UITableViewCellSelectionStyleDefault];
                item.labelContent = obj;
                item;
            })];
            if (idx < testContents.count - 1) {
                [section addItem:({
                    SeparatorLineItem *item = [[SeparatorLineItem alloc] init];
                    item.bgColor = [UIColor cyanColor];
                    item;
                })];
            }
        }];
        section;
    })];
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] init];
	}
	return _tableView;
}

@end
