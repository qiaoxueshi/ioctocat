#import "GHMilestones.h"
#import "GHMilestone.h"
#import "GHRepository.h"
#import "NSDictionary+Extensions.h"


@interface GHMilestones ()
@property(nonatomic,weak)GHRepository *repository;
@end


@implementation GHMilestones

- (id)initWithResourcePath:(NSString *)path {
	self = [super init];
	if (self) {
		self.resourcePath = path;
	}
	return self;
}

- (id)initWithRepository:(GHRepository *)repo {
	NSString *path = [NSString stringWithFormat:kLabelsFormat, repo.owner, repo.name];
	self = [self initWithResourcePath:path];
	if (self) {
		self.repository = repo;
	}
	return self;
}

- (void)setValues:(id)values {
	self.items = [NSMutableArray array];
	for (NSDictionary *dict in values) {
		GHMilestone *milestone = [[GHMilestone alloc] initWithRepository:self.repository];
		[milestone setValues:dict];
		[self addObject:milestone];
	}
}

@end