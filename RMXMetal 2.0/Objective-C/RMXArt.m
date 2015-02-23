//
//  Art.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 23/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_Art_h
#define OpenGL_2_0_Art_h

#endif




#import "RMXStandardLib.h"
//#import "RMXDrawShapes.h"
//#import "RMXDrawable.h"
//void RenderObjects(void);
//void DrawCubeWithTextureCoords(float s);

@implementation RMXArt
//#if TARGET_OS_IPHONE
//#else
@synthesize x, y, z, d, r,g, b,k;
//#endif

- (id)initWithName:(NSString*)name  parent:(RMXObject*)parent world:(RMXWorld*)world
{
    self = [super initWithName:name parent:parent world:world];
    
    if (self) {
//#if TARGET_OS_IPHONE
//#else
        self.x = 0;//45.0f;
        self.y = (GLfloat)250/(GLfloat)250;
        self.z = 0.1f;
        self.d = 100.0f;
        self.r = 0.8f;
        self.g = 0.85f;
        self.b = 1.8f;
        self.k = 0.0f;
//#endif
        
    }
    
    return self;
    
    
}

/*

+ (RMXWorld*)initializeTestingEnvironment:(id)sender {

    //if (world == nil){
       RMXWorld* world = [[RMXWorld alloc]initWithName:@"Brave New World" parent:(RMXObject*)sender world:nil];
   // world.uiView = sender;
    //world.observer.uiView = sender;
    if (world.observer == nil )exit(0);
    //}
    
    RMXLightSource * sun = [[RMXLightSource alloc]initWithName:@"SUN" parent:world world:world];
    //[sun setRAxis:GLKVector3Make(0, 0, 1)];
    sun->body.radius = 100;
    [world insertSprite: sun];
    
    
    
    float* axisColors[3] = {colorBlue , colorRed , colorGreen};
    [RMXArt drawAxis:axisColors world:world];
    [sun setRenderer:[RMXDrawShapes class] shape:@selector(DrawSphere:)];
//#if TARGET_OS_IPHONE
//
//#else
    //[sun setShine:glLightfv];
    
    
//#endif
    [RMXArt randomObjects:world];
    
    RMXShapeObject *ZX = [[RMXShapeObject alloc]initWithName:@"ZX PLANE" parent:world world:world];
    [ZX setRenderer:[RMXDrawShapes class] shape:@selector(DrawPlane:)];
    [ZX setColor:GLKVector4Make(0.8,1.2,0.8,1)];
    [ZX setIsAnimated:false];
    ZX->body.position.y = -1;
    [world insertSprite:ZX];
    
    return world;

} */

+ (void)drawAxis:(float**)colors world:(RMXWorld*)world {//xCol y:(float*)yCol z:(float*)zCol{
    //BOOL gravity = false;
    double noOfShapes = world->body.radius / 4;
    float axis[3][3];
    double limit = world->body.radius / noOfShapes;
    int test = 0;
    for (int j=0;j<3;++j) {
        int count = 0;
        for(int i=-world->body.radius;i<world->body.radius;++i) {
            if (count<limit) {
                ++count;
            } else {
                count = 0;
                axis[j][j] = i;
                RMXShapeObject * shape = [[RMXShapeObject alloc]initWithName:[NSString stringWithFormat:@"Shape: %i",i ] parent:world world:world];
                [shape setHasGravity: false];// ? true : false];
                [shape setRenderer:[RMXDrawShapes class] shape:@selector(DrawCubeWithTextureCoords:)];
                shape->body.radius = limit;
                shape->body.position = GLKVector3MakeWithArray(axis[j]);
                [shape setColor:GLKVector4MakeWithArray(colors[j])];
                [shape setIsAnimated:false];
                [world insertSprite:shape];
                test++;
            }
        }
    }
    //[rmxDebugger add:RMX_ERROR n:self t:[NSString stringWithFormat:@"axis shapes: %i, radius: %f",test,self.parent->body.radius ]];
}

+ (void)randomObjects:(RMXWorld*)world
{
    //int max =100, min = -100;
    //BOOL gravity = true;
    double noOfShapes = 1980;
    for(int i=-noOfShapes/2;i<noOfShapes/2;++i) {
        GLKVector4 points = doASum(world->body.radius, i,noOfShapes );
        complex double X = points.x;
        complex double Y = points.y;
        complex double Z = points.z;
        //float randPos[3] = {(rand() % (max + min))-max/2, (rand() % max), (rand() % (max + min))-max/2};
        int chance = 1;//(rand() % 6 + 1);
        float randPos[3] = { X, Y, Z };
        switch (chance) {
            case 1:
                randPos[0] = X;
                randPos[1] = Y;
                randPos[2] = Z;
                break;
            case 2:
                randPos[0] = Z;
                randPos[1] = X;
                randPos[2] = Y;
                break;
            case 3:
                randPos[0] = Y;
                randPos[1] = Z;
                randPos[2] = X;
                break;
            case 4:
                randPos[0] = Y;
                randPos[1] = X;
                randPos[2] = Z;
                break;
            case 5:
                randPos[0] = X;
                randPos[1] = Z;
                randPos[2] = Y;
                break;
            case 6:
                default:
                randPos[0] = Z;
                randPos[1] = Y;
                randPos[2] = X;
                break;
                
            
        }
        randPos[1]+=50;
        
        //gravity = !gravity;
        RMXShapeObject * shape;
        if((rand() % 100 == 1)) {
            shape = [[RMXLightSource alloc]initWithName:[NSString stringWithFormat:@"Sun: %i",i ] parent:world world:world];
            shape->body.radius = 20;
        }
        else {
            shape = [[RMXShapeObject alloc]initWithName:[NSString stringWithFormat:@"Shape: %i",i ] parent:world world:world];
        }
        
        if(rand() % 5 == 1) {
            [shape setRenderer:[RMXDrawShapes class] shape:@selector(DrawSphere:)];
        } else if (rand() % 3 == 1) {
            [shape setRenderer:[RMXDrawShapes class] shape:@selector(DrawTeapot:)];
        } else {
            [shape setRenderer:[RMXDrawShapes class] shape:@selector(DrawCubeWithTextureCoords:)];
        }
        
        [shape setHasGravity: (rand()% 100 + 1)==1];
        shape->body.radius = (rand() % 5 + 4);
        shape->body.position = GLKVector3MakeWithArray(randPos);
        shape->body.mass = (rand()%15)/10;
        shape->body.dragArea = (rand()%10)/40;
        shape->body.dragC = (rand()%10)/200;
        [shape setColor:GLKVector4MakeWithArray([self rColor].v)];
       // shape.rAxis = GLKVector3Make((rand() % 100)/10,(rand() % 100)/10,(rand() % 100)/10);
        
        [world insertSprite:shape];
        
        //free(&shape);

    }
}


+ (GLKVector4)rColor {
    //float rCol[4];
    GLKVector4 rCol;
    //rCol.x = (rand() % 100)/10;
    for (int i = 0; i<3; ++i)
        rCol.v[i] = (rand() % 100)/10;
    
    rCol.v[3] = 1.0;//{ ( ,(rand() % 100)/10,(rand() % 100)/10, 1.0 };
    //if (rCol.v[2] == rCol.z) NSLog(@"Fuck me!");
    return rCol;
}


@end


//#if TARGET_OS_IPHONE
//
//#else
//static RMXArt *art;
//#endif
