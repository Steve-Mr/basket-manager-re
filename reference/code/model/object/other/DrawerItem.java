package com.blank.bm15.model.object.other;

/* loaded from: classes.dex */
public class DrawerItem {
    public static final int ITEM_GAME_ANALIZE = 4;
    public static final int ITEM_GAME_PLAY_1 = 1;
    public static final int ITEM_GAME_PLAY_30 = 3;
    public static final int ITEM_GAME_PLAY_7 = 2;
    public static final int ITEM_MANAGEMENT_CALENDAR = 14;
    public static final int ITEM_MANAGEMENT_CLASSIFICATION = 13;
    public static final int ITEM_MANAGEMENT_NEWS = 15;
    public static final int ITEM_MANAGEMENT_PLAYER = 11;
    public static final int ITEM_MANAGEMENT_PLAYOFFS = 12;
    public static final int ITEM_MANAGEMENT_TEAM = 10;
    public static final int ITEM_MARKET_DRAFT = 21;
    public static final int ITEM_MARKET_FINANCES = 24;
    public static final int ITEM_MARKET_FREE_AGENTS = 23;
    public static final int ITEM_MARKET_RENEWAL = 20;
    public static final int ITEM_MARKET_TRADE = 22;
    public static final int ITEM_OTHER_CHALLENGE = 41;
    public static final int ITEM_OTHER_EXIT = 40;
    public static final int ITEM_OTHER_GUIDE = 42;
    public static final int ITEM_TOP_100 = 30;
    public static final int ITEM_TOP_ROOKIES = 31;
    private Integer icon;
    private Integer id;
    private String text;
    private String title;

    public DrawerItem(Integer id, Integer icon, String title, String text) {
        this.id = id;
        this.icon = icon;
        this.title = title;
        this.text = text;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getIcon() {
        return this.icon;
    }

    public void setIcon(Integer icon) {
        this.icon = icon;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
