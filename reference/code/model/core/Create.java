package com.blank.bm15.model.core;

import android.app.Activity;
import android.content.Context;
import android.os.Environment;
import android.support.v4.media.TransportMediator;
import android.util.Log;
import android.widget.Toast;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.comparator.TeamComparator;
import com.blank.bm15.model.generator.SeasonCalendar;
import com.blank.bm15.model.object.crud.Challenge;
import com.blank.bm15.model.object.crud.DraftRound;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.League;
import com.blank.bm15.model.object.crud.Match;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Playoffs;
import com.blank.bm15.model.object.crud.Tactic;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.object.crud.Trade;
import com.blank.bm15.model.object.other.Classification;
import com.blank.bm15.model.object.other.Roster;
import com.blank.bm15.model.util.Constant;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

/* loaded from: classes.dex */
public class Create {
    public static Game newGame(Activity activity, String name, InputStream is) {
        Game game = new Game(activity);
        game.setName(name);
        game.setCurrentMatchday(1);
        BlankDao.saveOrUpdate(game);
        List<Team> teamList = createAllTeams(game);
        createAllPlayers(game, teamList, is);
        createAllMatches(game, teamList);
        createFirstNews(activity, game);
        createChallenges(activity, teamList);
        updateDraftRoundValues(game);
        return game;
    }

    public static void deleteGame(Game game) {
        BlankDao.delete(game);
        Team team = new Team(game.getContext());
        team.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(team));
        Tactic tactic = new Tactic(game.getContext());
        tactic.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(tactic));
        League league = new League(game.getContext());
        league.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(league));
        DraftRound draftRound = new DraftRound(game.getContext());
        draftRound.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(draftRound));
        Player player = new Player(game.getContext());
        player.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(player));
        Match match = new Match(game.getContext());
        match.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(match));
        MatchResult matchResult = new MatchResult(game.getContext());
        matchResult.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(matchResult));
        News news = new News(game.getContext());
        news.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(news));
        Offer offer = new Offer(game.getContext());
        offer.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(offer));
        Trade trade = new Trade(game.getContext());
        trade.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(trade));
        Playoffs playoffs = new Playoffs(game.getContext());
        playoffs.setGame(game);
        BlankDao.deleteAll(BlankDao.getSome(playoffs));
    }

    public static void createRosterFile(Context context) {
        Game game = new Game(context);
        List<Player> playerList = createPlayersByFile(game, game.getContext().getResources().openRawResource(R.raw.rosters));
        List<Roster> rosterList = new ArrayList<>();
        for (Player player : playerList) {
            Roster roster = new Roster(context);
            roster.loadPlayer(player);
            rosterList.add(roster);
        }
        createRostersFile(rosterList);
    }

    private static List<Team> createAllTeams(Game game) {
        List<Team> teamList = new ArrayList<>();
        List<League> leagueList = new ArrayList<>();
        List<DraftRound> draftRoundList = new ArrayList<>();
        Team team = new Team(game.getContext());
        team.setGame(game);
        team.setName(Constant.TEAM_E1_T1);
        team.setSalaryCap(Constant.SALARY_CAP_TEAM_E1_T1);
        team.setConference(1);
        team.setDivision(1);
        team.setColor(Integer.valueOf(R.color.team_bos));
        BlankDao.saveOrUpdate(team);
        teamList.add(team);
        createLeagueAndDraft(game, team, leagueList, draftRoundList);
        Team team2 = new Team(game.getContext());
        team2.setGame(game);
        team2.setName(Constant.TEAM_E1_T2);
        team2.setSalaryCap(Constant.SALARY_CAP_TEAM_E1_T2);
        team2.setConference(1);
        team2.setDivision(1);
        team2.setColor(Integer.valueOf(R.color.team_bro));
        BlankDao.saveOrUpdate(team2);
        teamList.add(team2);
        createLeagueAndDraft(game, team2, leagueList, draftRoundList);
        Team team3 = new Team(game.getContext());
        team3.setGame(game);
        team3.setName(Constant.TEAM_E1_T3);
        team3.setSalaryCap(Constant.SALARY_CAP_TEAM_E1_T3);
        team3.setConference(1);
        team3.setDivision(1);
        team3.setColor(Integer.valueOf(R.color.team_nyk));
        BlankDao.saveOrUpdate(team3);
        teamList.add(team3);
        createLeagueAndDraft(game, team3, leagueList, draftRoundList);
        Team team4 = new Team(game.getContext());
        team4.setGame(game);
        team4.setName(Constant.TEAM_E1_T4);
        team4.setSalaryCap(Constant.SALARY_CAP_TEAM_E1_T4);
        team4.setConference(1);
        team4.setDivision(1);
        team4.setColor(Integer.valueOf(R.color.team_phi));
        BlankDao.saveOrUpdate(team4);
        teamList.add(team4);
        createLeagueAndDraft(game, team4, leagueList, draftRoundList);
        Team team5 = new Team(game.getContext());
        team5.setGame(game);
        team5.setName(Constant.TEAM_E1_T5);
        team5.setSalaryCap(Constant.SALARY_CAP_TEAM_E1_T5);
        team5.setConference(1);
        team5.setDivision(1);
        team5.setColor(Integer.valueOf(R.color.team_tor));
        BlankDao.saveOrUpdate(team5);
        teamList.add(team5);
        createLeagueAndDraft(game, team5, leagueList, draftRoundList);
        Team team6 = new Team(game.getContext());
        team6.setGame(game);
        team6.setName(Constant.TEAM_E2_T1);
        team6.setSalaryCap(Constant.SALARY_CAP_TEAM_E2_T1);
        team6.setConference(1);
        team6.setDivision(2);
        team6.setColor(Integer.valueOf(R.color.team_chi));
        BlankDao.saveOrUpdate(team6);
        teamList.add(team6);
        createLeagueAndDraft(game, team6, leagueList, draftRoundList);
        Team team7 = new Team(game.getContext());
        team7.setGame(game);
        team7.setName(Constant.TEAM_E2_T2);
        team7.setSalaryCap(Constant.SALARY_CAP_TEAM_E2_T2);
        team7.setConference(1);
        team7.setDivision(2);
        team7.setColor(Integer.valueOf(R.color.team_cle));
        BlankDao.saveOrUpdate(team7);
        teamList.add(team7);
        createLeagueAndDraft(game, team7, leagueList, draftRoundList);
        Team team8 = new Team(game.getContext());
        team8.setGame(game);
        team8.setName(Constant.TEAM_E2_T3);
        team8.setSalaryCap(Constant.SALARY_CAP_TEAM_E2_T3);
        team8.setConference(1);
        team8.setDivision(2);
        team8.setColor(Integer.valueOf(R.color.team_det));
        BlankDao.saveOrUpdate(team8);
        teamList.add(team8);
        createLeagueAndDraft(game, team8, leagueList, draftRoundList);
        Team team9 = new Team(game.getContext());
        team9.setGame(game);
        team9.setName(Constant.TEAM_E2_T4);
        team9.setSalaryCap(Constant.SALARY_CAP_TEAM_E2_T4);
        team9.setConference(1);
        team9.setDivision(2);
        team9.setColor(Integer.valueOf(R.color.team_ind));
        BlankDao.saveOrUpdate(team9);
        teamList.add(team9);
        createLeagueAndDraft(game, team9, leagueList, draftRoundList);
        Team team10 = new Team(game.getContext());
        team10.setGame(game);
        team10.setName(Constant.TEAM_E2_T5);
        team10.setSalaryCap(Constant.SALARY_CAP_TEAM_E2_T5);
        team10.setConference(1);
        team10.setDivision(2);
        team10.setColor(Integer.valueOf(R.color.team_mil));
        BlankDao.saveOrUpdate(team10);
        teamList.add(team10);
        createLeagueAndDraft(game, team10, leagueList, draftRoundList);
        Team team11 = new Team(game.getContext());
        team11.setGame(game);
        team11.setName(Constant.TEAM_E3_T1);
        team11.setSalaryCap(Constant.SALARY_CAP_TEAM_E3_T1);
        team11.setConference(1);
        team11.setDivision(3);
        team11.setColor(Integer.valueOf(R.color.team_atl));
        BlankDao.saveOrUpdate(team11);
        teamList.add(team11);
        createLeagueAndDraft(game, team11, leagueList, draftRoundList);
        Team team12 = new Team(game.getContext());
        team12.setGame(game);
        team12.setName(Constant.TEAM_E3_T2);
        team12.setSalaryCap(Constant.SALARY_CAP_TEAM_E3_T2);
        team12.setConference(1);
        team12.setDivision(3);
        team12.setColor(Integer.valueOf(R.color.team_cha));
        BlankDao.saveOrUpdate(team12);
        teamList.add(team12);
        createLeagueAndDraft(game, team12, leagueList, draftRoundList);
        Team team13 = new Team(game.getContext());
        team13.setGame(game);
        team13.setName(Constant.TEAM_E3_T3);
        team13.setSalaryCap(Constant.SALARY_CAP_TEAM_E3_T3);
        team13.setConference(1);
        team13.setDivision(3);
        team13.setColor(Integer.valueOf(R.color.team_mia));
        BlankDao.saveOrUpdate(team13);
        teamList.add(team13);
        createLeagueAndDraft(game, team13, leagueList, draftRoundList);
        Team team14 = new Team(game.getContext());
        team14.setGame(game);
        team14.setName(Constant.TEAM_E3_T4);
        team14.setSalaryCap(Constant.SALARY_CAP_TEAM_E3_T4);
        team14.setConference(1);
        team14.setDivision(3);
        team14.setColor(Integer.valueOf(R.color.team_orl));
        BlankDao.saveOrUpdate(team14);
        teamList.add(team14);
        createLeagueAndDraft(game, team14, leagueList, draftRoundList);
        Team team15 = new Team(game.getContext());
        team15.setGame(game);
        team15.setName(Constant.TEAM_E3_T5);
        team15.setSalaryCap(Constant.SALARY_CAP_TEAM_E3_T5);
        team15.setConference(1);
        team15.setDivision(3);
        team15.setColor(Integer.valueOf(R.color.team_was));
        BlankDao.saveOrUpdate(team15);
        teamList.add(team15);
        createLeagueAndDraft(game, team15, leagueList, draftRoundList);
        Team team16 = new Team(game.getContext());
        team16.setGame(game);
        team16.setName(Constant.TEAM_W1_T1);
        team16.setSalaryCap(Constant.SALARY_CAP_TEAM_W1_T1);
        team16.setConference(2);
        team16.setDivision(4);
        team16.setColor(Integer.valueOf(R.color.team_dal));
        BlankDao.saveOrUpdate(team16);
        teamList.add(team16);
        createLeagueAndDraft(game, team16, leagueList, draftRoundList);
        Team team17 = new Team(game.getContext());
        team17.setGame(game);
        team17.setName(Constant.TEAM_W1_T2);
        team17.setSalaryCap(Constant.SALARY_CAP_TEAM_W1_T2);
        team17.setConference(2);
        team17.setDivision(4);
        team17.setColor(Integer.valueOf(R.color.team_hou));
        BlankDao.saveOrUpdate(team17);
        teamList.add(team17);
        createLeagueAndDraft(game, team17, leagueList, draftRoundList);
        Team team18 = new Team(game.getContext());
        team18.setGame(game);
        team18.setName(Constant.TEAM_W1_T3);
        team18.setSalaryCap(Constant.SALARY_CAP_TEAM_W1_T3);
        team18.setConference(2);
        team18.setDivision(4);
        team18.setColor(Integer.valueOf(R.color.team_mem));
        BlankDao.saveOrUpdate(team18);
        teamList.add(team18);
        createLeagueAndDraft(game, team18, leagueList, draftRoundList);
        Team team19 = new Team(game.getContext());
        team19.setGame(game);
        team19.setName(Constant.TEAM_W1_T4);
        team19.setSalaryCap(Constant.SALARY_CAP_TEAM_W1_T4);
        team19.setConference(2);
        team19.setDivision(4);
        team19.setColor(Integer.valueOf(R.color.team_nor));
        BlankDao.saveOrUpdate(team19);
        teamList.add(team19);
        createLeagueAndDraft(game, team19, leagueList, draftRoundList);
        Team team20 = new Team(game.getContext());
        team20.setGame(game);
        team20.setName(Constant.TEAM_W1_T5);
        team20.setSalaryCap(Constant.SALARY_CAP_TEAM_W1_T5);
        team20.setConference(2);
        team20.setDivision(4);
        team20.setColor(Integer.valueOf(R.color.team_san));
        BlankDao.saveOrUpdate(team20);
        teamList.add(team20);
        createLeagueAndDraft(game, team20, leagueList, draftRoundList);
        Team team21 = new Team(game.getContext());
        team21.setGame(game);
        team21.setName(Constant.TEAM_W2_T1);
        team21.setSalaryCap(Constant.SALARY_CAP_TEAM_W2_T1);
        team21.setConference(2);
        team21.setDivision(5);
        team21.setColor(Integer.valueOf(R.color.team_den));
        BlankDao.saveOrUpdate(team21);
        teamList.add(team21);
        createLeagueAndDraft(game, team21, leagueList, draftRoundList);
        Team team22 = new Team(game.getContext());
        team22.setGame(game);
        team22.setName(Constant.TEAM_W2_T2);
        team22.setSalaryCap(Constant.SALARY_CAP_TEAM_W2_T2);
        team22.setConference(2);
        team22.setDivision(5);
        team22.setColor(Integer.valueOf(R.color.team_min));
        BlankDao.saveOrUpdate(team22);
        teamList.add(team22);
        createLeagueAndDraft(game, team22, leagueList, draftRoundList);
        Team team23 = new Team(game.getContext());
        team23.setGame(game);
        team23.setName(Constant.TEAM_W2_T3);
        team23.setSalaryCap(Constant.SALARY_CAP_TEAM_W2_T3);
        team23.setConference(2);
        team23.setDivision(5);
        team23.setColor(Integer.valueOf(R.color.team_por));
        BlankDao.saveOrUpdate(team23);
        teamList.add(team23);
        createLeagueAndDraft(game, team23, leagueList, draftRoundList);
        Team team24 = new Team(game.getContext());
        team24.setGame(game);
        team24.setName(Constant.TEAM_W2_T4);
        team24.setSalaryCap(Constant.SALARY_CAP_TEAM_W2_T4);
        team24.setConference(2);
        team24.setDivision(5);
        team24.setColor(Integer.valueOf(R.color.team_okc));
        BlankDao.saveOrUpdate(team24);
        teamList.add(team24);
        createLeagueAndDraft(game, team24, leagueList, draftRoundList);
        Team team25 = new Team(game.getContext());
        team25.setGame(game);
        team25.setName(Constant.TEAM_W2_T5);
        team25.setSalaryCap(Constant.SALARY_CAP_TEAM_W2_T5);
        team25.setConference(2);
        team25.setDivision(5);
        team25.setColor(Integer.valueOf(R.color.team_uta));
        BlankDao.saveOrUpdate(team25);
        teamList.add(team25);
        createLeagueAndDraft(game, team25, leagueList, draftRoundList);
        Team team26 = new Team(game.getContext());
        team26.setGame(game);
        team26.setName(Constant.TEAM_W3_T1);
        team26.setSalaryCap(Constant.SALARY_CAP_TEAM_W3_T1);
        team26.setConference(2);
        team26.setDivision(6);
        team26.setColor(Integer.valueOf(R.color.team_gsw));
        BlankDao.saveOrUpdate(team26);
        teamList.add(team26);
        createLeagueAndDraft(game, team26, leagueList, draftRoundList);
        Team team27 = new Team(game.getContext());
        team27.setGame(game);
        team27.setName(Constant.TEAM_W3_T2);
        team27.setSalaryCap(Constant.SALARY_CAP_TEAM_W3_T2);
        team27.setConference(2);
        team27.setDivision(6);
        team27.setColor(Integer.valueOf(R.color.team_lac));
        BlankDao.saveOrUpdate(team27);
        teamList.add(team27);
        createLeagueAndDraft(game, team27, leagueList, draftRoundList);
        Team team28 = new Team(game.getContext());
        team28.setGame(game);
        team28.setName(Constant.TEAM_W3_T3);
        team28.setSalaryCap(Constant.SALARY_CAP_TEAM_W3_T3);
        team28.setConference(2);
        team28.setDivision(6);
        team28.setColor(Integer.valueOf(R.color.team_lal));
        BlankDao.saveOrUpdate(team28);
        teamList.add(team28);
        createLeagueAndDraft(game, team28, leagueList, draftRoundList);
        Team team29 = new Team(game.getContext());
        team29.setGame(game);
        team29.setName(Constant.TEAM_W3_T4);
        team29.setSalaryCap(Constant.SALARY_CAP_TEAM_W3_T4);
        team29.setConference(2);
        team29.setDivision(6);
        team29.setColor(Integer.valueOf(R.color.team_pho));
        BlankDao.saveOrUpdate(team29);
        teamList.add(team29);
        createLeagueAndDraft(game, team29, leagueList, draftRoundList);
        Team team30 = new Team(game.getContext());
        team30.setGame(game);
        team30.setName(Constant.TEAM_W3_T5);
        team30.setSalaryCap(Constant.SALARY_CAP_TEAM_W3_T5);
        team30.setConference(2);
        team30.setDivision(6);
        team30.setColor(Integer.valueOf(R.color.team_sac));
        BlankDao.saveOrUpdate(team30);
        teamList.add(team30);
        createLeagueAndDraft(game, team30, leagueList, draftRoundList);
        BlankDao.saveOrUpdateAll(leagueList);
        BlankDao.saveOrUpdateAll(draftRoundList);
        return teamList;
    }

    private static void createLeagueAndDraft(Game game, Team team, List<League> leagueList, List<DraftRound> draftRoundList) {
        League league = new League(game.getContext());
        league.setGame(game);
        league.setTeam(team);
        leagueList.add(league);
        DraftRound draftRound = new DraftRound(game.getContext());
        draftRound.setGame(game);
        draftRound.setTeamOwner(team);
        draftRound.setTeamUser(team);
        draftRound.setRound(1);
        draftRoundList.add(draftRound);
        DraftRound draftRound2 = new DraftRound(game.getContext());
        draftRound2.setGame(game);
        draftRound2.setTeamOwner(team);
        draftRound2.setTeamUser(team);
        draftRound2.setRound(2);
        draftRoundList.add(draftRound2);
    }

    public static void createAllMatches(Game game, List<Team> teamList) {
        List<Match> matchList = SeasonCalendar.getMatchList(game, teamList);
        BlankDao.saveOrUpdateAll(matchList);
    }

    private static void createAllPlayers(Game game, List<Team> teamList, InputStream is) {
        List<Player> playerList = createPlayersByFile(game, is);
        for (Player player : playerList) {
            player.setGame(game);
            if (player.getTeam().getName() != null) {
                Iterator<Team> it = teamList.iterator();
                while (true) {
                    if (it.hasNext()) {
                        Team team = it.next();
                        if (team.getName().equals(player.getTeam().getName())) {
                            player.setTeam(team);
                            break;
                        }
                    }
                }
            }
        }
        if (playerList.isEmpty()) {
            game.setCreateOnlinePlayersOk(Boolean.FALSE);
        }
        BlankDao.saveOrUpdateAll(playerList);
    }

    private static void createFirstNews(Activity activity, Game game) {
        ArrayList<News> newsList = new ArrayList<>();
        News news = new News(activity);
        news.setBody(activity.getString(R.string.news_reddit_body));
        news.setGame(game);
        news.setMatchday(0);
        news.setTitle(activity.getString(R.string.news_reddit_title));
        news.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news);
        News news2 = new News(activity);
        news2.setBody(activity.getString(R.string.news_choose_your_lineup_body));
        news2.setGame(game);
        news2.setMatchday(0);
        news2.setTitle(activity.getString(R.string.news_choose_your_lineup_title));
        news2.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news2);
        News news3 = new News(activity);
        news3.setBody(activity.getString(R.string.news_choose_your_tactics_body));
        news3.setGame(game);
        news3.setMatchday(0);
        news3.setTitle(activity.getString(R.string.news_choose_your_tactics_title));
        news3.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news3);
        News news4 = new News(activity);
        news4.setBody(activity.getString(R.string.news_play_calendar_body));
        news4.setGame(game);
        news4.setMatchday(0);
        news4.setTitle(activity.getString(R.string.news_play_calendar_title));
        news4.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news4);
        News news5 = new News(activity);
        news5.setBody(activity.getString(R.string.news_play_scores_body));
        news5.setGame(game);
        news5.setMatchday(1);
        news5.setTitle(activity.getString(R.string.news_play_scores_title));
        news5.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news5);
        News news6 = new News(activity);
        news6.setBody(activity.getString(R.string.news_trade_your_players_body));
        news6.setGame(game);
        news6.setMatchday(2);
        news6.setTitle(activity.getString(R.string.news_trade_your_players_title));
        news6.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news6);
        News news7 = new News(activity);
        news7.setBody(activity.getString(R.string.news_sign_free_agents_body));
        news7.setGame(game);
        news7.setMatchday(2);
        news7.setTitle(activity.getString(R.string.news_sign_free_agents_title));
        news7.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news7);
        News news8 = new News(activity);
        news8.setBody(activity.getString(R.string.news_look_statistics_body));
        news8.setGame(game);
        news8.setMatchday(4);
        news8.setTitle(activity.getString(R.string.news_look_statistics_title));
        news8.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news8);
        News news9 = new News(activity);
        news9.setBody(activity.getString(R.string.news_per_body));
        news9.setGame(game);
        news9.setMatchday(4);
        news9.setTitle(activity.getString(R.string.news_per_title));
        news9.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news9);
        News news10 = new News(activity);
        news10.setBody(activity.getString(R.string.news_free_agency_trade_body));
        news10.setGame(game);
        news10.setMatchday(6);
        news10.setTitle(activity.getString(R.string.news_free_agency_trade_title));
        news10.setType(Integer.valueOf(R.drawable.news_advice));
        newsList.add(news10);
        BlankDao.saveOrUpdateAll(newsList);
    }

    private static List<Player> createPlayersByFile(Game game, InputStream is) {
        BufferedReader reader;
        List<Player> list = new ArrayList<>();
        List<String> fieldNames = new ArrayList<>();
        BufferedReader reader2 = null;
        try {
            try {
                reader = new BufferedReader(new InputStreamReader(is));
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            String value = null;
            List<Field> fields = BlankDao.getOrderedFields(new Roster(game.getContext()));
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                StringTokenizer st = new StringTokenizer(line, ";");
                if (value == null) {
                    while (st.hasMoreElements()) {
                        value = st.nextToken();
                        fieldNames.add(value);
                    }
                } else {
                    Roster roster = new Roster(game.getContext());
                    int i = 0;
                    while (st.hasMoreElements()) {
                        int i2 = i + 1;
                        String name = fieldNames.get(i);
                        value = st.nextToken();
                        if (!BlankObj.isNullOrEmpty(value).booleanValue()) {
                            Field field = getField(fields, name);
                            if (field.getType().equals(String.class)) {
                                field.set(roster, value);
                                i = i2;
                            } else if (field.getType().equals(Integer.class)) {
                                field.set(roster, BlankObj.toInteger(value));
                            }
                        }
                        i = i2;
                    }
                    list.add(createPlayer(game, roster.getName(), roster.getAge().intValue(), roster.getYearsContract().intValue(), roster.getSalary().intValue(), roster.getPositionFirst().intValue(), roster.getPositionSecond().intValue(), roster.getSkillPhysique().intValue(), roster.getSkillBlock().intValue(), roster.getSkillSteal().intValue(), roster.getSkillRebound().intValue(), roster.getSkillPass().intValue(), roster.getSkillShotInterior().intValue(), roster.getSkillShotExterior().intValue(), roster.getSkillShotFree().intValue(), roster.getPotential().intValue(), roster.getYearsExperience().intValue(), roster.getTeam()));
                }
            }
            reader.close();
        } catch (Exception e2) {
            e = e2;
            reader2 = reader;
            Log.e("createPlayersByFile", e.toString());
            if (reader2 != null) {
                try {
                    reader2.close();
                } catch (IOException e3) {
                    Log.e("createPlayersByFile", e3.toString());
                }
            }
            return list;
        } catch (Throwable th2) {
            th = th2;
            reader2 = reader;
            if (reader2 != null) {
                try {
                    reader2.close();
                } catch (IOException e4) {
                    Log.e("createPlayersByFile", e4.toString());
                }
            }
            throw th;
        }
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e5) {
                Log.e("createPlayersByFile", e5.toString());
            }
            return list;
        }
        return list;
    }

    private static Field getField(List<Field> fields, String name) {
        for (Field field : fields) {
            field.setAccessible(Boolean.TRUE.booleanValue());
            if (field.getName().equals(name)) {
                return field;
            }
        }
        return null;
    }

    private static Player createPlayer(Game game, String name, int age, int yearsContract, int salary, int positionFirst, int positionSecond, int physique, int block, int steal, int rebound, int pass, int shotInt, int shotExt, int shotFre, int potential, int yearsExperience, String team) {
        Player player = new Player(game.getContext());
        player.setName(name);
        player.setYearsContract(Integer.valueOf(yearsContract));
        player.setSalary(Integer.valueOf(salary));
        player.setLoyalty(Util.getRandomValue(1, 5));
        player.setPositionFirst(Integer.valueOf(positionFirst));
        player.setPositionSecond(Integer.valueOf(positionSecond));
        player.getTeam().setName(team);
        player.setAge(Integer.valueOf(age));
        player.setStateInjury(0);
        player.setStateForm(Util.getRandomValue(30, 70));
        player.setStateEnergy(99);
        player.setSkillPhysique(Integer.valueOf(physique));
        player.setSkillBlock(Integer.valueOf(block));
        player.setSkillSteal(Integer.valueOf(steal));
        player.setSkillRebound(Integer.valueOf(rebound));
        player.setSkillPass(Integer.valueOf(pass));
        player.setSkillShotInterior(Integer.valueOf(shotInt));
        player.setSkillShotExterior(Integer.valueOf(shotExt));
        player.setSkillShotFree(Integer.valueOf(shotFre));
        player.setPotential(Integer.valueOf(potential));
        player.setYearsExperience(Integer.valueOf(yearsExperience));
        return player;
    }

    private static <T extends BlankBase> void createRostersFile(List<T> list) {
        if (!list.isEmpty()) {
            T obj = list.get(0);
            List<Field> fields = BlankDao.getOrderedFields(obj);
            int colCount = fields.size();
            String subfolder = obj.getContext().getString(obj.getContext().getApplicationInfo().labelRes);
            BufferedWriter bfw = null;
            File sdCardDir = new File(Environment.getExternalStorageDirectory() + "/" + subfolder);
            if (!sdCardDir.exists()) {
                sdCardDir.mkdir();
            }
            File saveFile = new File(sdCardDir, "rosters.csv");
            if (saveFile.exists()) {
                saveFile.delete();
                saveFile = new File(sdCardDir, "rosters.csv");
            }
            try {
                try {
                    BufferedWriter bfw2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(saveFile, true)));
                    for (int i = 0; i < colCount; i++) {
                        try {
                            Field field = fields.get(i);
                            field.setAccessible(Boolean.TRUE.booleanValue());
                            String name = field.getName();
                            if (!BlankDao.ID.equals(name)) {
                                if (i != colCount - 1) {
                                    bfw2.write(String.valueOf(name) + ';');
                                } else {
                                    bfw2.write(name);
                                }
                            }
                        } catch (Exception e) {
                            e = e;
                            bfw = bfw2;
                            Log.e("createRosterFile", e.toString());
                            if (bfw != null) {
                                try {
                                    bfw.flush();
                                    bfw.close();
                                    return;
                                } catch (IOException e2) {
                                    Log.e("createRosterFile", e2.toString());
                                    return;
                                }
                            }
                            return;
                        } catch (Throwable th) {
                            th = th;
                            bfw = bfw2;
                            if (bfw != null) {
                                try {
                                    bfw.flush();
                                    bfw.close();
                                } catch (IOException e3) {
                                    Log.e("createRosterFile", e3.toString());
                                }
                            }
                            throw th;
                        }
                    }
                    bfw2.newLine();
                    for (T aux : list) {
                        for (int i2 = 0; i2 < colCount; i2++) {
                            Field field2 = fields.get(i2);
                            field2.setAccessible(Boolean.TRUE.booleanValue());
                            Object value = field2.get(aux);
                            if (!BlankDao.ID.equals(field2.getName())) {
                                if (i2 != colCount - 1) {
                                    bfw2.write(String.valueOf(BlankObj.toString(value)) + ';');
                                } else {
                                    bfw2.write(BlankObj.toString(value));
                                }
                            }
                        }
                        bfw2.newLine();
                    }
                    Toast toast = Toast.makeText(obj.getContext(), obj.getContext().getString(R.string.info_export), 0);
                    toast.setGravity(17, 0, 0);
                    toast.show();
                    if (bfw2 != null) {
                        try {
                            bfw2.flush();
                            bfw2.close();
                        } catch (IOException e4) {
                            Log.e("createRosterFile", e4.toString());
                        }
                    }
                } catch (Exception e5) {
                    e = e5;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
    }

    private static void createChallenges(Activity activity, List<Team> teamList) {
        List<Challenge> challengeList = BlankDao.getAll(new Challenge(activity));
        if (challengeList.isEmpty()) {
            for (Team team : teamList) {
                Challenge challenge = new Challenge(activity);
                challenge.setTeamName(team.getName());
                challengeList.add(challenge);
            }
            BlankDao.saveOrUpdateAll(challengeList);
        }
    }

    public static void updateDraftRoundValues(Game game) {
        List<DraftRound> draftRoundList = new ArrayList<>();
        if (game.getCurrentMatchday().intValue() != 230) {
            Team filter = new Team(game.getContext());
            filter.setGame(game);
            List<Team> teamList = BlankDao.getSome(filter);
            Collections.sort(teamList, new TeamComparator(0, -1));
            int marketValue = 1;
            for (Team team : teamList) {
                team.getDraftRound1().setMarketValue(Double.valueOf(marketValue));
                marketValue += 3;
                draftRoundList.add(team.getDraftRound1());
            }
        } else {
            Classification filter2 = new Classification(game.getContext());
            filter2.setGame(game);
            List<Classification> auxAllList = BlankDaoExtra.getDraft(filter2);
            int marketValue2 = TransportMediator.KEYCODE_MEDIA_RECORD;
            for (Classification classification : auxAllList) {
                classification.getTeam().getDraftRound1().setMarketValue(Double.valueOf(marketValue2));
                marketValue2 -= 4;
                draftRoundList.add(classification.getTeam().getDraftRound1());
            }
        }
        BlankDao.saveOrUpdateAll(draftRoundList);
    }
}
