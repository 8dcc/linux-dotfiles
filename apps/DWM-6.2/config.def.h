/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 1;  /* border pixel of windows */
static const unsigned int gappx    = 3;  /* gaps between windows */
static const unsigned int snap     = 32; /* snap pixel */
static const int showbar           = 1;  /* 0 means no bar */
static const int topbar            = 1;  /* 0 means bottom bar */
static const int vertpad           = 0;  /* vertical padding of bar */
static const int sidepad           = 0;  /* horizontal padding of bar */

static const char* fonts[] = {
    "dina:pixelsize=10",
    "Cozette:pixelsize=11",
};

static const char dmenufont[] = "dina:pixelsize=10";
static const char dmenux[]    = "0";
static const char dmenuy[]    = "0";
static const char dmenuz[]    = "1920";

static const char col_fg_sel[]        = "#ffffff";
static const char col_bg_sel[]        = "#111111";
static const char col_border_sel[]    = "#999999";
static const char col_fg_unsel[]      = "#777777";
static const char col_bg_unsel[]      = "#111111";
static const char col_border_unsel[]  = "#111111";
static const char col_fg_status[]     = "#999999";
static const char col_bg_status[]     = "#111111";
static const char col_border_status[] = "#111111";
static const char* colors[][3] = {
    /*                 fg             bg             border   */
    [SchemeNorm]   = { col_fg_unsel,  col_bg_unsel,  col_border_unsel },
    [SchemeSel]    = { col_fg_sel,    col_bg_sel,    col_border_sel },
    [SchemeStatus] = { col_fg_status, col_bg_status, col_border_status },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /*
     * xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class       instance    title       tags mask     isfloating   monitor */
    { "ida.exe",   NULL,       NULL,       0,            1,           -1 },
    { "ida64.exe", NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "-  T",     tile },    /* first entry is default */
    { "-  F",     NULL },    /* no layout function means floating behavior */
    { "-  M",     monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                     \
    {                                  \
        .v = (const char*[]) {         \
            "/bin/sh", "-c", cmd, NULL \
        }                              \
    }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char* dmenucmd[] = {
    "dmenu_run",
    "-x",  dmenux,       "-y",  dmenuy,     "-z",  dmenuz,
    "-m",  dmenumon,     "-fn", dmenufont,  "-nb", col_bg_unsel,
    "-nf", col_fg_unsel, "-sb", col_bg_sel, "-sf", col_fg_sel,
    NULL
};
static const char* termcmd[] = { "st", NULL };
static const char* layoutmenu_cmd = "dwm-menu-layout";

static Key keys[] = {
    /* modifier         key        function        argument */
    { MODKEY,           XK_p,      spawn,          {.v = dmenucmd } },
    { MODKEY|ShiftMask, XK_Return, spawn,          {.v = termcmd } },
    { MODKEY,           XK_b,      togglebar,      {0} },
    { MODKEY,           XK_Tab,    focusstack,     {.i = +1 } },
    /*
    { MODKEY|ShiftMask, XK_Tab,    focusstack,     {.i = -1 } },
    { MODKEY,           XK_i,      incnmaster,     {.i = +1 } },
    { MODKEY,           XK_d,      incnmaster,     {.i = -1 } },
    */
    { MODKEY,           XK_Return, zoom,           {0} },
    { MODKEY|ShiftMask, XK_c,      killclient,     {0} },
    { MODKEY,           XK_t,      setlayout,      {.v = &layouts[0]} },
    { MODKEY,           XK_f,      setlayout,      {.v = &layouts[1]} },
    { MODKEY,           XK_m,      setlayout,      {.v = &layouts[2]} },
    /*
    { MODKEY,           XK_space,  setlayout,      {0} },
    */
    { MODKEY|ShiftMask, XK_space,  togglefloating, {0} },
    { MODKEY,           XK_0,      view,           {.ui = ~0 } }, /* Show all windows */
    { MODKEY|ShiftMask, XK_0,      tag,            {.ui = ~0 } }, /* Move to all tags */
    { MODKEY,           XK_comma,  focusmon,       {.i = -1 } },
    { MODKEY,           XK_period, focusmon,       {.i = +1 } },
    { MODKEY|ShiftMask, XK_comma,  tagmon,         {.i = -1 } },
    { MODKEY|ShiftMask, XK_period, tagmon,         {.i = +1 } },
    TAGKEYS(            XK_1,                      0)
    TAGKEYS(            XK_2,                      1)
    TAGKEYS(            XK_3,                      2)
    TAGKEYS(            XK_4,                      3)
    TAGKEYS(            XK_5,                      4)
    TAGKEYS(            XK_6,                      5)
    TAGKEYS(            XK_7,                      6)
    TAGKEYS(            XK_8,                      7)
    TAGKEYS(            XK_9,                      8)
    { MODKEY|ShiftMask, XK_q,      spawn,          SHCMD("dwm-menu-quit") },
    /*
    { MODKEY,           XK_j,      focusstack,     {.i = +1 } },
    { MODKEY,           XK_k,      focusstack,     {.i = -1 } },
    */
    { MODKEY,           XK_h,      setmfact,       {.f = -0.05} },
    { MODKEY,           XK_l,      setmfact,       {.f = +0.05} },
    { MODKEY|ShiftMask, XK_F11,    spawn,          SHCMD("maim --hidecursor -s | tee ~/ss-$(date +%s).png /tmp/highlighted-screenshot.png && hl-png -fF /tmp/highlighted-screenshot.png") },
    { MODKEY,           XK_F12,    spawn,          SHCMD("maim --hidecursor -s | tee ~/ss-$(date +%s).png | xclip -selection clipboard -t image/png") },
    { MODKEY|ShiftMask, XK_F12,    spawn,          SHCMD("maim --hidecursor | tee ~/ss-$(date +%s).png | xclip -selection clipboard -t image/png") },
    { MODKEY|ShiftMask, XK_l,      spawn,          SHCMD("slock") },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
    { ClkLtSymbol,          0,              Button3,        layoutmenu,     {0} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
