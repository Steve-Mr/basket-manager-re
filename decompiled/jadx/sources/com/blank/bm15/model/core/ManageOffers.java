package com.blank.bm15.model.core;

import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.model.object.crud.Game;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15.model.object.crud.Offer;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ManageOffers {
    public static void manage(Game game) {
        int teamSalary;
        List<Player> playerList = new ArrayList<>();
        List<News> newsList = new ArrayList<>();
        List<Offer> offerList = new ArrayList<>();
        Boolean renewal = Boolean.valueOf(game.getCurrentMatchday().intValue() == 228 || game.getCurrentMatchday().intValue() == 229 || game.getCurrentMatchday().intValue() == 230);
        Offer filter = new Offer(game.getContext());
        filter.setGame(game);
        filter.setMatchday(game.getCurrentMatchday());
        List<Offer> currentOfferList = BlankDao.getSome(filter);
        for (Offer offer : currentOfferList) {
            Player player = offer.getPlayer();
            News news = new News(game.getContext());
            news.setGame(game);
            news.setMatchday(game.getCurrentMatchday());
            news.setType(Integer.valueOf(R.drawable.news_trade));
            news.setTitle(game.getContext().getString(R.string.notice_trade));
            int plusSalaryCapRenewal = 0;
            if (renewal.booleanValue()) {
                plusSalaryCapRenewal = (offer.getTeam().getSalaryCap().intValue() * 20) / 100;
                teamSalary = offer.getTeam().getTeamSalary(player).intValue();
            } else {
                teamSalary = offer.getTeam().getTeamSalary(null).intValue();
            }
            if (offer.getAnswer().booleanValue() && offer.getTeam().getSalaryCap().intValue() + plusSalaryCapRenewal > offer.getSalary().intValue() + teamSalary) {
                BlankDao.delete(offer);
                player.setSalary(offer.getSalary());
                player.setYearsContract(offer.getYears());
                player.setTeam(offer.getTeam());
                playerList.add(player);
                news.setBody(String.format(game.getContext().getString(R.string.notice_trade_ok), player.getShortName(), offer.getTeam().getFullName()));
            } else {
                offer.setAnswer(Boolean.FALSE);
                offer.setSalary(Integer.valueOf(game.getCurrentMatchday().intValue() + Util.getRandomValue(10, 20).intValue()));
                if (renewal.booleanValue()) {
                    BlankDao.delete(offer);
                } else {
                    offerList.add(offer);
                }
                news.setBody(String.format(game.getContext().getString(R.string.notice_trade_ko), player.getShortName(), offer.getTeam().getFullName()));
            }
            newsList.add(news);
        }
        BlankDao.saveOrUpdateAll(playerList);
        BlankDao.saveOrUpdateAll(newsList);
        BlankDao.saveOrUpdateAll(offerList);
    }
}
