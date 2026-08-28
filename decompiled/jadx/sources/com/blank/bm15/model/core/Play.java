package com.blank.bm15.model.core;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import com.blank.bm15.activity.HomeActivity;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.fragment.FreeAgentsFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.dao.utils.BlankSharedPreferences;
import com.blank.bm15.model.comparator.TeamComparator;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.object.crud.Team;
import com.blank.bm15.model.util.BlankPreferences;
import com.blank.bm15.model.util.Constant;
import com.blank.bm15pro.R;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class Play extends AsyncTask<Void, String, Boolean> {
    private ProgressDialog dialog;
    private Game game;
    private Simulate simulate;
    private int toMatchday;

    public Play(Game game) {
        this(game, game.getCurrentMatchday().intValue() + 1);
    }

    public Play(Game game, int toMatchday) {
        this.game = game;
        this.toMatchday = toMatchday;
    }

    @Override // android.os.AsyncTask
    protected void onPreExecute() {
        this.simulate = new Simulate(this.game);
        this.dialog = new ProgressDialog(this.game.getContext());
        this.dialog.setMessage("...");
        this.dialog.setCancelable(Boolean.FALSE.booleanValue());
        this.dialog.setProgressStyle(1);
        this.dialog.setProgress(0);
        if (this.game.getCurrentMatchday().intValue() == 234) {
            this.dialog.setTitle(String.format(this.game.getContext().getString(R.string.play_progress_dialog_load_new_season), Integer.valueOf(this.game.getCurrentSeason().intValue() + 1)));
            this.dialog.setMax(30);
        } else if (this.game.getCurrentMatchday().intValue() < 226) {
            this.dialog.setTitle(String.format(this.game.getContext().getString(R.string.play_progress_dialog_playing), BlankObj.toString(this.game.getCurrentMatchday()), BlankObj.toString(this.simulate.getMatchListSize())));
            this.dialog.setMax(this.simulate.getMatchListSize().intValue() + 1);
        } else {
            this.dialog.setTitle(this.game.getContext().getString(R.string.play_progress_dialog_finish_season));
            this.dialog.setMax(1);
        }
        this.dialog.show();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Boolean doInBackground(Void... params) {
        int i = 0;
        if (this.game.getCurrentMatchday().intValue() == 226) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_playoffs_end));
            ManageSeasons.updatingPlayers(this.game);
        } else if (this.game.getCurrentMatchday().intValue() == 227) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_renewal));
            ManageRenewals.manage(this.game);
        } else if (this.game.getCurrentMatchday().intValue() == 228 || this.game.getCurrentMatchday().intValue() == 229) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_renewal));
            ManageOffers.manage(this.game);
        } else if (this.game.getCurrentMatchday().intValue() == 230) {
            ManageOffers.manage(this.game);
            ManageRenewals.finishRenewals(this.game);
            Create.updateDraftRoundValues(this.game);
            News news = new News(this.game.getContext());
            news.setGame(this.game);
            news.setMatchday(this.game.getCurrentMatchday());
            news.setType(Integer.valueOf(R.drawable.news_trade));
            news.setTitle(this.game.getContext().getString(R.string.news_trade_day_title));
            news.setBody(this.game.getContext().getString(R.string.news_trade_day_body));
            BlankDao.saveOrUpdate(news);
        } else if (this.game.getCurrentMatchday().intValue() == 231) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_draft));
            ManageDraft.manageRound1(this.game);
        } else if (this.game.getCurrentMatchday().intValue() == 232) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_draft));
            ManageDraft.manageRound2(this.game);
        } else if (this.game.getCurrentMatchday().intValue() == 233) {
            publishProgress(String.valueOf(1), this.game.getContext().getString(R.string.info_free_agents));
            ManageDraft.finishDraft(this.game);
            BlankSharedPreferences.setInt(this.game.getContext(), FreeAgentsFragment.FILTER_SHARED_PREFERENCE, 0);
        } else if (this.game.getCurrentMatchday().intValue() == 234) {
            Team filter = new Team(this.game.getContext());
            filter.setGame(this.game);
            List<Team> teamList = BlankDao.getSome(filter);
            Collections.sort(teamList, new TeamComparator(0, 1));
            for (Team team : teamList) {
                if (team.getId().intValue() != this.game.getUserTeam().getId().intValue()) {
                    i++;
                    publishProgress(String.valueOf(i), String.format(this.game.getContext().getString(R.string.info_validating), team.getName()));
                    ManageFreeAgency.manage(this.game, team);
                }
            }
            this.game.setCurrentMatchday(0);
            this.game.setCurrentSeason(Integer.valueOf(this.game.getCurrentSeason().intValue() + 1));
            publishProgress(String.valueOf(i + 1), this.game.getContext().getString(R.string.info_new_season));
            ManageSeasons.deletingOldSeason(this.game);
            ManageSeasons.creatingNewSeason(this.game);
            this.toMatchday = 0;
        } else {
            int i2 = 0;
            while (i2 < this.simulate.getMatchListSize().intValue()) {
                publishProgress(String.valueOf(i2 + 1), this.simulate.playMatchOfPosition(i2));
                i2++;
            }
            publishProgress(String.valueOf(i2 + 1), this.game.getContext().getString(R.string.info_saving));
            this.simulate.saveAll();
            if (this.game.getCurrentMatchday().intValue() <= 92) {
                ManageOffers.manage(this.game);
            } else if (this.game.getCurrentMatchday().intValue() >= 167) {
                ManagePlayoffs.manage(this.game);
            }
            ManageDevelopment.manage(this.game);
        }
        this.game.setCurrentMatchday(Integer.valueOf(this.game.getCurrentMatchday().intValue() + 1));
        BlankDao.saveOrUpdate(this.game);
        return Boolean.TRUE;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onProgressUpdate(String... values) {
        int progress = Integer.valueOf(values[0]).intValue();
        this.dialog.setProgress(progress);
        if (values.length > 1) {
            this.dialog.setMessage(values[1]);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Boolean result) {
        this.dialog.dismiss();
        if (this.game.getCurrentMatchday().intValue() < this.toMatchday && this.toMatchday <= 234) {
            if (BlankPreferences.getBoolean(this.game.getContext(), Constant.AUTO_LINEUP, Boolean.TRUE).booleanValue()) {
                Lineup.setBetterLineup(this.game.getUserTeam());
                new Play(this.game, this.toMatchday).execute(new Void[0]);
                return;
            } else if (arePlayersInyuredInTeam().booleanValue()) {
                BaseActivity.addNavigation(this.game.getContext(), 15, null);
                this.game.getContext().startActivity(new Intent(this.game.getContext(), (Class<?>) HomeActivity.class));
                return;
            } else {
                new Play(this.game, this.toMatchday).execute(new Void[0]);
                return;
            }
        }
        BaseActivity.addNavigation(this.game.getContext(), 15, null);
        this.game.getContext().startActivity(new Intent(this.game.getContext(), (Class<?>) HomeActivity.class));
    }

    private Boolean arePlayersInyuredInTeam() {
        this.game.getUserTeam().getTactic().reloadPlayers();
        for (Player player : this.game.getUserTeam().getTactic().getPlayersInLineup()) {
            if (player.getStateInjury().intValue() != 0) {
                return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }
}
