package com.blank.bm15.activity;

import android.app.AlertDialog;
import android.app.FragmentTransaction;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.SystemClock;
import android.support.v4.app.ActionBarDrawerToggle;
import android.support.v4.widget.DrawerLayout;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterDrawerItemList;
import com.blank.bm15.activity.adapter.SeparatedListAdapter;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.fragment.CalendarAllFragments;
import com.blank.bm15.activity.fragment.ChallengesFragment;
import com.blank.bm15.activity.fragment.ClassificationAllFragments;
import com.blank.bm15.activity.fragment.DraftFragment;
import com.blank.bm15.activity.fragment.FinancesFragment;
import com.blank.bm15.activity.fragment.FreeAgentsFragment;
import com.blank.bm15.activity.fragment.NewsFragment;
import com.blank.bm15.activity.fragment.PlayerAllFragments;
import com.blank.bm15.activity.fragment.PlayoffsFragment;
import com.blank.bm15.activity.fragment.RenewalsFragment;
import com.blank.bm15.activity.fragment.RookiesAllFragments;
import com.blank.bm15.activity.fragment.TeamAllFragments;
import com.blank.bm15.activity.fragment.Top100AllFragments;
import com.blank.bm15.activity.fragment.TradeFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.comparator.DraftRoundComparator;
import com.blank.bm15.model.core.Lineup;
import com.blank.bm15.model.core.Play;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.other.DrawerItem;
import com.blank.bm15.model.util.Alert;
import com.blank.bm15.model.util.BlankPreferences;
import com.blank.bm15.model.util.Constant;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class HomeActivity extends BaseActivity {
    private DrawerLayout mDrawerLayout;
    private ListView mDrawerList;
    private ActionBarDrawerToggle mDrawerToggle;
    private Play play;
    private Boolean playHome;
    private Team playOpponent;
    private long mLastClickTime = 0;
    private Boolean isDrawerLocked = Boolean.FALSE;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.blank.bm15.activity.base.BaseActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        loadDrawer();
        loadFragment();
        if (!this.isDrawerLocked.booleanValue()) {
            getActionBar().setDisplayHomeAsUpEnabled(Boolean.TRUE.booleanValue());
            getActionBar().setHomeButtonEnabled(Boolean.TRUE.booleanValue());
        }
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        if (this.mDrawerToggle.onOptionsItemSelected(item)) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override // android.app.Activity
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        this.mDrawerToggle.syncState();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        this.mDrawerToggle.onConfigurationChanged(newConfig);
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        if (this.mDrawerLayout != null && this.mDrawerList != null) {
            this.mDrawerLayout.closeDrawer(this.mDrawerList);
        }
        Navigation navigation = BaseActivity.deleteLastNavigation(this);
        if (navigation.getId() == null) {
            AlertDialog.Builder builder = Alert.getBuilder(this);
            builder.setTitle(getString(R.string.info_title)).setMessage(getString(R.string.info_exit)).setCancelable(false).setIcon(R.drawable.ic_info).setPositiveButton(getString(R.string.button_accept), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int id) {
                    HomeActivity.this.startActivity(new Intent(HomeActivity.this, (Class<?>) MainActivity.class));
                }
            }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int id) {
                    dialog.cancel();
                }
            });
            AlertDialog alert = builder.create();
            alert.show();
            return;
        }
        loadFragment();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean validatePlay() {
        if (getGame().getCurrentMatchday().intValue() < 226) {
            Match filter = new Match(this);
            filter.setGame(getGame());
            filter.setMatchday(getGame().getCurrentMatchday());
            List<Match> matchList = BlankDao.getSome(filter);
            for (Match match : matchList) {
                if (match.getTeamLocal().getId() != null && match.getTeamLocal().getId() != null && (getGame().getUserTeam().getId().intValue() == match.getTeamLocal().getId().intValue() || getGame().getUserTeam().getId().intValue() == match.getTeamVisitor().getId().intValue())) {
                    Team team = new Team(this);
                    team.setId(getGame().getUserTeam().getId());
                    BlankDao.loadById(team);
                    if (!Lineup.validateTeam(team)) {
                        AlertDialog.Builder builder = Alert.getBuilder(this);
                        builder.setTitle(getString(R.string.error_title)).setMessage(getString(R.string.error_lineup_incorrect)).setCancelable(false).setIcon(R.drawable.ic_error).setPositiveButton(getString(R.string.button_check), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.3
                            @Override // android.content.DialogInterface.OnClickListener
                            public void onClick(DialogInterface dialog, int id) {
                                BaseActivity.addNavigation(HomeActivity.this, 10, HomeActivity.this.getGame().getUserTeam().getId());
                                HomeActivity.this.loadFragment();
                            }
                        }).setNeutralButton(getString(R.string.team_squad_auto), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.4
                            @Override // android.content.DialogInterface.OnClickListener
                            public void onClick(DialogInterface dialog, int id) {
                                Lineup.setBetterLineup(HomeActivity.this.getGame().getUserTeam());
                                HomeActivity.this.play = new Play(HomeActivity.this.getGame());
                                HomeActivity.this.play.execute(new Void[0]);
                            }
                        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.5
                            @Override // android.content.DialogInterface.OnClickListener
                            public void onClick(DialogInterface dialog, int id) {
                                dialog.cancel();
                            }
                        });
                        AlertDialog alert = builder.create();
                        alert.show();
                        return Boolean.FALSE.booleanValue();
                    }
                }
            }
        } else if (getGame().getCurrentMatchday().intValue() == 232) {
            DraftRound draftRoundFilter = new DraftRound(this);
            draftRoundFilter.setGame(getGame());
            draftRoundFilter.setRound(1);
            List<DraftRound> draftRoundList = BlankDao.getSome(draftRoundFilter);
            Collections.sort(draftRoundList, new DraftRoundComparator(0, 1));
            if (!draftRoundList.isEmpty() && draftRoundList.get(0).getTeamUser().getId().intValue() == getGame().getUserTeam().getId().intValue()) {
                AlertDialog.Builder builder2 = Alert.getBuilder(this);
                builder2.setTitle(getString(R.string.error_title)).setMessage(getString(R.string.error_draft_round)).setCancelable(false).setIcon(R.drawable.ic_error).setPositiveButton(String.format(getString(R.string.button_go), getString(R.string.home_drawer_market_draft)), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.6
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BaseActivity.addNavigation(HomeActivity.this, 21, null);
                        HomeActivity.this.loadFragment();
                    }
                });
                AlertDialog alert2 = builder2.create();
                alert2.show();
                return Boolean.FALSE.booleanValue();
            }
        } else if (getGame().getCurrentMatchday().intValue() == 233) {
            DraftRound draftRoundFilter2 = new DraftRound(this);
            draftRoundFilter2.setGame(getGame());
            draftRoundFilter2.setRound(2);
            List<DraftRound> draftRoundList2 = BlankDao.getSome(draftRoundFilter2);
            Collections.sort(draftRoundList2, new DraftRoundComparator(0, 1));
            if (!draftRoundList2.isEmpty() && draftRoundList2.get(0).getTeamUser().getId().intValue() == getGame().getUserTeam().getId().intValue()) {
                AlertDialog.Builder builder3 = Alert.getBuilder(this);
                builder3.setTitle(getString(R.string.warning_title)).setMessage(getString(R.string.warning_draft_round)).setCancelable(false).setIcon(R.drawable.ic_error).setPositiveButton(String.format(getString(R.string.button_go), getString(R.string.home_drawer_market_draft)), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.7
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BaseActivity.addNavigation(HomeActivity.this, 21, null);
                        HomeActivity.this.loadFragment();
                    }
                }).setNeutralButton(getString(R.string.button_continue), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.8
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        HomeActivity.this.play = new Play(HomeActivity.this.getGame());
                        HomeActivity.this.play.execute(new Void[0]);
                    }
                });
                AlertDialog alert3 = builder3.create();
                alert3.show();
                return Boolean.FALSE.booleanValue();
            }
        } else if (getGame().getCurrentMatchday().intValue() == 228 || getGame().getCurrentMatchday().intValue() == 229) {
            Player filter2 = new Player(this);
            filter2.setGame(getGame());
            filter2.setTeam(getGame().getUserTeam());
            filter2.setYearsContract(0);
            List<Player> playerList = BlankDao.getSome(filter2);
            int text = getGame().getCurrentMatchday().intValue() == 228 ? R.string.warning_players_to_renew1 : R.string.warning_players_to_renew2;
            if (!playerList.isEmpty()) {
                AlertDialog.Builder builder4 = Alert.getBuilder(this);
                builder4.setTitle(getString(R.string.warning_title)).setMessage(getString(text)).setCancelable(false).setIcon(R.drawable.ic_warning).setPositiveButton(String.format(getString(R.string.button_go), getString(R.string.home_drawer_market_renewals)), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.9
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        BaseActivity.addNavigation(HomeActivity.this, 20, null);
                        HomeActivity.this.loadFragment();
                    }
                }).setNeutralButton(getString(R.string.button_continue), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.10
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        HomeActivity.this.play = new Play(HomeActivity.this.getGame());
                        HomeActivity.this.play.execute(new Void[0]);
                    }
                });
                AlertDialog alert4 = builder4.create();
                alert4.show();
                return Boolean.FALSE.booleanValue();
            }
        } else if (getGame().getCurrentMatchday().intValue() == 234) {
            getGame().getUserTeam().getTactic().reloadPlayers();
            AlertDialog.Builder builder5 = Alert.getBuilder(this);
            if (getGame().getUserTeam().getTactic().getPlayers().size() < 13) {
                builder5.setTitle(getString(R.string.error_title)).setMessage(getString(R.string.error_free_agency)).setIcon(R.drawable.ic_error);
            } else {
                builder5.setTitle(getString(R.string.warning_title)).setMessage(getString(R.string.warning_free_agency)).setIcon(R.drawable.ic_warning).setNeutralButton(getString(R.string.button_continue), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.11
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        dialog.cancel();
                        HomeActivity.this.play = new Play(HomeActivity.this.getGame());
                        HomeActivity.this.play.execute(new Void[0]);
                    }
                });
            }
            builder5.setCancelable(false).setPositiveButton(String.format(getString(R.string.button_go), getString(R.string.home_drawer_market_free_agents)), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.12
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int id) {
                    BaseActivity.addNavigation(HomeActivity.this, 23, null);
                    HomeActivity.this.loadFragment();
                }
            });
            AlertDialog alert5 = builder5.create();
            alert5.show();
            return Boolean.FALSE.booleanValue();
        }
        return Boolean.TRUE.booleanValue();
    }

    private void loadDrawer() {
        this.mDrawerLayout = (DrawerLayout) findViewById(R.id.drawer_layout);
        this.mDrawerList = (ListView) findViewById(R.id.home_left_drawer);
        FrameLayout frameLayout = (FrameLayout) findViewById(R.id.home_content_frame);
        if (((ViewGroup.MarginLayoutParams) frameLayout.getLayoutParams()).leftMargin == ((int) getResources().getDimension(R.dimen.drawer_size))) {
            this.mDrawerLayout.setDrawerLockMode(2, this.mDrawerList);
            this.mDrawerLayout.setScrimColor(0);
            this.isDrawerLocked = Boolean.TRUE;
        }
        this.mDrawerList.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.HomeActivity.13
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View view, int position, long arg3) {
                DrawerItem item = (DrawerItem) HomeActivity.this.mDrawerList.getItemAtPosition(position);
                if (!HomeActivity.this.isDrawerLocked.booleanValue()) {
                    HomeActivity.this.mDrawerLayout.closeDrawer(HomeActivity.this.mDrawerList);
                }
                Integer idFragment = item.getId();
                Integer idObject = null;
                if (10 == item.getId().intValue()) {
                    idObject = HomeActivity.this.getGame().getUserTeam().getId();
                } else if (4 == item.getId().intValue() && HomeActivity.this.playOpponent != null) {
                    idObject = HomeActivity.this.playOpponent.getId();
                } else {
                    if (1 == item.getId().intValue()) {
                        if (HomeActivity.this.validatePlay() && SystemClock.elapsedRealtime() - HomeActivity.this.mLastClickTime >= 3000) {
                            HomeActivity.this.mLastClickTime = SystemClock.elapsedRealtime();
                            HomeActivity.this.play = new Play(HomeActivity.this.getGame());
                            HomeActivity.this.play.execute(new Void[0]);
                            return;
                        }
                        return;
                    }
                    if (2 == item.getId().intValue()) {
                        HomeActivity.this.play(HomeActivity.this.getGame().getCurrentMatchday().intValue() + 7);
                        return;
                    }
                    if (3 == item.getId().intValue()) {
                        HomeActivity.this.play(HomeActivity.this.getGame().getCurrentMatchday().intValue() + 30);
                        return;
                    }
                    if (22 == item.getId().intValue()) {
                        if (HomeActivity.this.getGame().getCurrentMatchday().intValue() >= 88 && HomeActivity.this.getGame().getCurrentMatchday().intValue() != 231) {
                            Alert.showWarningDialog(HomeActivity.this, Integer.valueOf(R.string.warning_market_closed));
                            return;
                        }
                    } else if (23 == item.getId().intValue()) {
                        if (HomeActivity.this.getGame().getCurrentMatchday().intValue() >= 88 && HomeActivity.this.getGame().getCurrentMatchday().intValue() < 234) {
                            Alert.showWarningDialog(HomeActivity.this, Integer.valueOf(R.string.warning_market_closed));
                            return;
                        }
                    } else if (40 == item.getId().intValue()) {
                        Intent intent = new Intent(HomeActivity.this, (Class<?>) MainActivity.class);
                        intent.setFlags(268468224);
                        HomeActivity.this.startActivity(intent);
                        return;
                    } else if (42 == item.getId().intValue()) {
                        HomeActivity.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(HomeActivity.this.getResources().getString(R.string.home_drawer_other_guide_url))));
                        return;
                    }
                }
                BaseActivity.addNavigation(HomeActivity.this, idFragment, idObject);
                HomeActivity.this.loadFragment();
            }
        });
        this.mDrawerToggle = new ActionBarDrawerToggle(this, this.mDrawerLayout, R.drawable.ic_drawer, R.string.home_drawer_open, R.string.home_drawer_close) { // from class: com.blank.bm15.activity.HomeActivity.14
            @Override // android.support.v4.app.ActionBarDrawerToggle, android.support.v4.widget.DrawerLayout.DrawerListener
            public void onDrawerClosed(View view) {
                super.onDrawerClosed(view);
            }

            @Override // android.support.v4.app.ActionBarDrawerToggle, android.support.v4.widget.DrawerLayout.DrawerListener
            public void onDrawerOpened(View drawerView) {
                super.onDrawerOpened(drawerView);
            }
        };
        if (!this.isDrawerLocked.booleanValue()) {
            this.mDrawerLayout.closeDrawer(this.mDrawerList);
            this.mDrawerLayout.setDrawerListener(this.mDrawerToggle);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void loadFragment() {
        this.mDrawerList.setAdapter((ListAdapter) getDrawerAdapter());
        Navigation navigation = BaseActivity.getNavigation(this);
        int selectedFragmentId = navigation.getIdFragment().intValue();
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        if (4 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, TeamAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (10 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, TeamAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (11 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, PlayerAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (13 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, ClassificationAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (14 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, CalendarAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (15 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, NewsFragment.newInstance(R.layout.fragment_list, 0));
        } else if (12 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, PlayoffsFragment.newInstance(R.layout.fragment_list, 0));
        } else if (20 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, RenewalsFragment.newInstance(R.layout.fragment_list, 0));
        } else if (21 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, DraftFragment.newInstance(R.layout.fragment_list, 0));
        } else if (22 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, TradeFragment.newInstance(R.layout.fragment_trade, 0));
        } else if (23 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, FreeAgentsFragment.newInstance(R.layout.fragment_top_100, 0));
        } else if (24 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, FinancesFragment.newInstance(R.layout.fragment_team_statistics, 0));
        } else if (30 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, Top100AllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (31 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, RookiesAllFragments.newInstance(R.layout.fragment_tab, 2));
        } else if (41 == selectedFragmentId) {
            ft.replace(R.id.home_content_frame, ChallengesFragment.newInstance(R.layout.fragment_list, 0));
        }
        ft.commit();
    }

    private SeparatedListAdapter getDrawerAdapter() {
        News news = new News(this);
        news.setGame(getGame());
        news.setMatchday(Integer.valueOf(getGame().getCurrentMatchday().intValue() - 1));
        String numOfNews = String.valueOf(BlankDao.getSome(news).size());
        loadOpponent();
        List<DrawerItem> playList = new ArrayList<>();
        playList.add(new DrawerItem(1, Integer.valueOf(R.drawable.drawer_play), getString(R.string.home_drawer_game_play_1), null));
        if (getGame().getCurrentMatchday().intValue() + 7 < 226) {
            playList.add(new DrawerItem(2, Integer.valueOf(R.drawable.drawer_play), getString(R.string.home_drawer_game_play_7), null));
            if (getGame().getCurrentMatchday().intValue() + 30 < 226) {
                playList.add(new DrawerItem(3, Integer.valueOf(R.drawable.drawer_play), getString(R.string.home_drawer_game_play_30), null));
            }
        }
        if (this.playOpponent != null) {
            String analize = (this.playHome == null || !this.playHome.booleanValue()) ? getString(R.string.match_in_home_of) : "";
            playList.add(new DrawerItem(4, Integer.valueOf(R.drawable.drawer_analize), getString(R.string.home_drawer_game_analize), String.valueOf(analize) + this.playOpponent.getShortFullName()));
        }
        List<DrawerItem> teamList = new ArrayList<>();
        teamList.add(new DrawerItem(10, Integer.valueOf(R.drawable.drawer_team), getString(R.string.home_drawer_management_team), null));
        if (getGame().getCurrentMatchday().intValue() >= 168) {
            teamList.add(new DrawerItem(12, Integer.valueOf(R.drawable.drawer_playoffs), getString(R.string.home_drawer_management_playoffs), null));
        }
        teamList.add(new DrawerItem(13, Integer.valueOf(R.drawable.drawer_classification), getString(R.string.home_drawer_management_classification), null));
        teamList.add(new DrawerItem(14, Integer.valueOf(R.drawable.drawer_calendar), getString(R.string.home_drawer_management_calendar), BlankObj.toString(getGame().getCurrentMatchday())));
        teamList.add(new DrawerItem(15, Integer.valueOf(R.drawable.drawer_news), getString(R.string.home_drawer_management_news), numOfNews));
        List<DrawerItem> marketList = new ArrayList<>();
        if (getGame().getCurrentMatchday().intValue() == 228 || getGame().getCurrentMatchday().intValue() == 229 || getGame().getCurrentMatchday().intValue() == 230) {
            marketList.add(new DrawerItem(20, Integer.valueOf(R.drawable.drawer_renewals), getString(R.string.home_drawer_market_renewals), null));
        }
        if (getGame().getCurrentMatchday().intValue() == 232 || getGame().getCurrentMatchday().intValue() == 233) {
            marketList.add(new DrawerItem(21, Integer.valueOf(R.drawable.drawer_draft), getString(R.string.home_drawer_market_draft), getGame().getCurrentMatchday().intValue() == 232 ? "1" : "2"));
        }
        marketList.add(new DrawerItem(22, Integer.valueOf(R.drawable.drawer_trade), getString(R.string.home_drawer_market_trades), null));
        marketList.add(new DrawerItem(23, Integer.valueOf(R.drawable.drawer_free_agents), getString(R.string.home_drawer_market_free_agents), null));
        marketList.add(new DrawerItem(24, Integer.valueOf(R.drawable.drawer_finances), getString(R.string.home_drawer_market_finances), null));
        List<DrawerItem> topList = new ArrayList<>();
        topList.add(new DrawerItem(30, Integer.valueOf(R.drawable.drawer_all_players), getString(R.string.home_drawer_top_100), null));
        if (getGame().getCurrentMatchday().intValue() != 232 && getGame().getCurrentMatchday().intValue() != 233) {
            topList.add(new DrawerItem(31, Integer.valueOf(R.drawable.drawer_all_players), getString(R.string.home_drawer_top_rookies), null));
        }
        List<DrawerItem> otherList = new ArrayList<>();
        otherList.add(new DrawerItem(40, Integer.valueOf(R.drawable.drawer_exit), getString(R.string.home_drawer_other_exit), null));
        otherList.add(new DrawerItem(41, Integer.valueOf(R.drawable.drawer_challenges), getString(R.string.home_drawer_other_challenges), null));
        otherList.add(new DrawerItem(42, Integer.valueOf(R.drawable.drawer_guide), getString(R.string.home_drawer_other_guide), null));
        SeparatedListAdapter separatedAdapter = new SeparatedListAdapter(this, Boolean.TRUE);
        AdapterDrawerItemList adapter = new AdapterDrawerItemList(this, R.layout.spinner_drawer_item, playList);
        separatedAdapter.addSection(getResources().getString(R.string.home_drawer_game), adapter);
        AdapterDrawerItemList adapter2 = new AdapterDrawerItemList(this, R.layout.spinner_drawer_item, teamList);
        separatedAdapter.addSection(getResources().getString(R.string.home_drawer_management), adapter2);
        AdapterDrawerItemList adapter3 = new AdapterDrawerItemList(this, R.layout.spinner_drawer_item, marketList);
        separatedAdapter.addSection(getResources().getString(R.string.home_drawer_market), adapter3);
        AdapterDrawerItemList adapter4 = new AdapterDrawerItemList(this, R.layout.spinner_drawer_item, topList);
        separatedAdapter.addSection(getResources().getString(R.string.home_drawer_top), adapter4);
        AdapterDrawerItemList adapter5 = new AdapterDrawerItemList(this, R.layout.spinner_drawer_item, otherList);
        separatedAdapter.addSection(getResources().getString(R.string.home_drawer_other), adapter5);
        return separatedAdapter;
    }

    public void play(final int matchday) {
        AlertDialog.Builder builder = Alert.getBuilder(this);
        builder.setTitle(getString(R.string.warning_title)).setMessage(String.format(getString(R.string.warning_matchday_play), Integer.valueOf(matchday))).setCancelable(false).setIcon(R.drawable.ic_warning).setPositiveButton(getString(R.string.button_play_auto), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.15
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                Lineup.setBetterLineup(HomeActivity.this.getGame().getUserTeam());
                BlankPreferences.setBoolean(HomeActivity.this, Constant.AUTO_LINEUP, Boolean.TRUE);
                new Play(HomeActivity.this.getGame(), matchday).execute(new Void[0]);
            }
        }).setNeutralButton(getString(R.string.button_play_manual), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.16
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                BlankPreferences.setBoolean(HomeActivity.this, Constant.AUTO_LINEUP, Boolean.FALSE);
                if (HomeActivity.this.validateLineup(matchday).booleanValue()) {
                    new Play(HomeActivity.this.getGame(), matchday).execute(new Void[0]);
                }
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.17
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        this.alertDialog = builder.create();
        this.alertDialog.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Boolean validateLineup(int matchday) {
        if (Lineup.validateTeam(getGame().getUserTeam())) {
            return Boolean.TRUE;
        }
        AlertDialog.Builder builder = Alert.getBuilder(this);
        builder.setTitle(getString(R.string.error_title)).setMessage(getString(R.string.error_lineup_incorrect)).setCancelable(false).setIcon(R.drawable.ic_error).setPositiveButton(getString(R.string.button_check), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.18
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                BaseActivity.addNavigation(HomeActivity.this, 10, HomeActivity.this.getGame().getUserTeam().getId());
                HomeActivity.this.startActivity(new Intent(HomeActivity.this, (Class<?>) HomeActivity.class));
            }
        }).setNegativeButton(getString(R.string.button_cancel), new DialogInterface.OnClickListener() { // from class: com.blank.bm15.activity.HomeActivity.19
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int id) {
                dialog.cancel();
            }
        });
        AlertDialog alert = builder.create();
        alert.show();
        return Boolean.FALSE;
    }

    private void loadOpponent() {
        Match match = new Match(this);
        match.setGame(getGame());
        match.setMatchday(getGame().getCurrentMatchday());
        List<Match> matchList = BlankDaoExtra.getUserMatchCalendar(match);
        if (matchList.size() == 1) {
            Match match2 = matchList.get(0);
            if (match2.getTeamLocal().getId().intValue() == getGame().getUserTeam().getId().intValue()) {
                this.playOpponent = match2.getTeamVisitor();
                this.playHome = Boolean.TRUE;
                return;
            } else {
                this.playOpponent = match2.getTeamLocal();
                this.playHome = Boolean.FALSE;
                return;
            }
        }
        this.playOpponent = null;
        this.playHome = null;
    }
}
