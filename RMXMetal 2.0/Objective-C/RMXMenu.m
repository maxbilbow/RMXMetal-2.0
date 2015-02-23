//
//  RMXMenu.h
//  OpenGL 2.0
//
//  Created by Max Bilbow on 24/01/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

#ifndef OpenGL_2_0_Menu_h
#define OpenGL_2_0_Menu_h


#endif

void SelectFromMenu(int idCommand)
{
#if TARGET_OS_IPHONE
    
#else
    switch (idCommand)
    {
        case MENU_LIGHTING:
            g_bLightingEnabled = !g_bLightingEnabled;
            if (g_bLightingEnabled)
                glEnable(GL_LIGHTING);
            else
                glDisable(GL_LIGHTING);
            break;
        case MENU_POLYMODE:
            g_bFillPolygons = !g_bFillPolygons;
            //glPolygonMode (GL_FRONT_AND_BACK, g_bFillPolygons ? GL_FILL : GL_LINE);
            break;
        case MENU_TEXTURING:
            g_bTexture = !g_bTexture;
            if (g_bTexture)
                glEnable(GL_TEXTURE_2D);
            else
                glDisable(GL_TEXTURE_2D);
            break;
        case MENU_EXIT:
            exit (0);
            break;
    }
    // Almost any menu selection requires a redraw
     glutPostRedisplay();
#endif
}

int BuildPopupMenu (void)
{
#if TARGET_OS_IPHONE
#else
    int menu;
    menu = glutCreateMenu (SelectFromMenu);
    glutAddMenuEntry ("Toggle lighting\tl", MENU_LIGHTING);
    glutAddMenuEntry ("Toggle polygon fill\tp", MENU_POLYMODE);
    glutAddMenuEntry ("Toggle texturing\tt", MENU_TEXTURING);
    glutAddMenuEntry ("Exit demo\tEsc", MENU_EXIT);
    return menu;
#endif
}
