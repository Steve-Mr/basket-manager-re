package com.blank.bm15.activity.fragment;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.blank.bm15.activity.base.BaseActivity;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDao;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.model.object.crud.MatchResult;
import com.blank.bm15.model.object.crud.Navigation;
import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15.model.util.Util;
import com.blank.bm15pro.R;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class PlayerStatisticsFragment extends BaseFragment {
    public static final PlayerStatisticsFragment newInstance(int fragmentLayout) {
        PlayerStatisticsFragment fragment = new PlayerStatisticsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putBoolean(NAVIGATION_MODE_NULL, Boolean.TRUE.booleanValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        createPage();
    }

    private void createPage() {
        Navigation navigation = BaseActivity.getNavigation(getHomeActivity());
        Player player = new Player(getHomeActivity());
        player.setId(navigation.getIdObject());
        BlankDao.loadById(player);
        loadHeader(player);
        MatchResult statisticPlayerMatchResult = getPlayerMatchResult(player);
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewMatch)).setText(String.valueOf(getHomeActivity().getString(R.string.player_statistics_match)) + ": " + statisticPlayerMatchResult.getMatches());
        TextView textView = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPer);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView.setText("PER: " + Util.round(statisticPlayerMatchResult.getPer().doubleValue(), 2));
        } else {
            textView.setText("PER: 0.00");
        }
        TextView textView2 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewMinuteAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView2.setText(String.valueOf(Util.round(((double) statisticPlayerMatchResult.getMinutesPlayed().intValue()) / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1)) + " " + getHomeActivity().getString(R.string.player_statistics_minute));
        } else {
            textView2.setText("0.0 " + getResources().getString(R.string.player_statistics_minute));
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPointTotal)).setText(statisticPlayerMatchResult.getPoints() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView3 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPointAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView3.setText(BlankObj.toString(Double.valueOf(Util.round(((double) statisticPlayerMatchResult.getPoints().intValue()) / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView3.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewBlockTotal)).setText(statisticPlayerMatchResult.getBlocks() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView4 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewBlockAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView4.setText(BlankObj.toString(Double.valueOf(Util.round(statisticPlayerMatchResult.getBlocks().doubleValue() / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView4.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewStealTotal)).setText(statisticPlayerMatchResult.getSteals() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView5 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewStealAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView5.setText(BlankObj.toString(Double.valueOf(Util.round(statisticPlayerMatchResult.getSteals().doubleValue() / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView5.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewReboundTotal)).setText(statisticPlayerMatchResult.getRebounds() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView6 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewReboundAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView6.setText(BlankObj.toString(Double.valueOf(Util.round(statisticPlayerMatchResult.getRebounds().doubleValue() / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView6.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPassKOTotal)).setText(statisticPlayerMatchResult.getPassesKo() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView7 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPassKOAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView7.setText(BlankObj.toString(Double.valueOf(Util.round(statisticPlayerMatchResult.getPassesKo().doubleValue() / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView7.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPassOKTotal)).setText(statisticPlayerMatchResult.getPassesOk() + " " + getResources().getString(R.string.player_statistics_total));
        TextView textView8 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewPassOKAverage);
        if (statisticPlayerMatchResult.getMatches().intValue() > 0) {
            textView8.setText(BlankObj.toString(Double.valueOf(Util.round(statisticPlayerMatchResult.getPassesOk().doubleValue() / ((double) statisticPlayerMatchResult.getMatches().intValue()), 1))));
        } else {
            textView8.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotOnePointOKTotal)).setText(statisticPlayerMatchResult.getShotOnePointOK() + "/" + statisticPlayerMatchResult.getShotOnePointTotals());
        TextView textView9 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotOnePointOKAverage);
        if (statisticPlayerMatchResult.getShotOnePointTotals().intValue() > 0) {
            textView9.setText(BlankObj.toString(Double.valueOf(Util.round(((double) (statisticPlayerMatchResult.getShotOnePointOK().intValue() * 100)) / ((double) statisticPlayerMatchResult.getShotOnePointTotals().intValue()), 1))));
        } else {
            textView9.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotTwoPointsOKTotal)).setText(statisticPlayerMatchResult.getShotTwoPointsOK() + "/" + statisticPlayerMatchResult.getShotTwoPointsTotals());
        TextView textView10 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotTwoPointsOKAverage);
        if (statisticPlayerMatchResult.getShotTwoPointsTotals().intValue() > 0) {
            textView10.setText(BlankObj.toString(Double.valueOf(Util.round(((double) (statisticPlayerMatchResult.getShotTwoPointsOK().intValue() * 100)) / ((double) statisticPlayerMatchResult.getShotTwoPointsTotals().intValue()), 1))));
        } else {
            textView10.setText("0.0");
        }
        ((TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotThreePointsOKTotal)).setText(statisticPlayerMatchResult.getShotThreePointsOK() + "/" + statisticPlayerMatchResult.getShotThreePointsTotals());
        TextView textView11 = (TextView) this.rootView.findViewById(R.id.fragmentPlayerStatisticTextViewShotThreePointsOKAverage);
        if (statisticPlayerMatchResult.getShotThreePointsTotals().intValue() > 0) {
            textView11.setText(BlankObj.toString(Double.valueOf(Util.round(((double) (statisticPlayerMatchResult.getShotThreePointsOK().intValue() * 100)) / ((double) statisticPlayerMatchResult.getShotThreePointsTotals().intValue()), 1))));
        } else {
            textView11.setText("0.0");
        }
    }

    private MatchResult getPlayerMatchResult(Player player) {
        MatchResult filter = new MatchResult(getHomeActivity());
        filter.setPlayer(player);
        List<MatchResult> matchResultList = BlankDao.getSome(filter);
        MatchResult playerMatchResult = new MatchResult(getHomeActivity());
        playerMatchResult.setMatches(0);
        for (MatchResult matchResult : matchResultList) {
            playerMatchResult.addMatchResult(matchResult);
        }
        return playerMatchResult;
    }

    private void loadHeader(Player player) {
        boolean showTeamName = Boolean.FALSE.booleanValue();
        if (player != null && player.getTeam().getId() != null && getGame().getUserTeam().getId() != null) {
            showTeamName = player.getTeam().getId().intValue() != getGame().getUserTeam().getId().intValue();
        }
        ImageView imageViewPotential = (ImageView) this.rootView.findViewById(R.id.playerImageViewPotential);
        TextView textViewName = (TextView) this.rootView.findViewById(R.id.playerTextViewName);
        TextView textViewAge = (TextView) this.rootView.findViewById(R.id.playerTextViewAgeValue);
        TextView textViewPositionFirst = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionFirst);
        TextView textViewSeparatorPositionSecond = (TextView) this.rootView.findViewById(R.id.playerTextViewSeparatorPositionSecond);
        TextView textViewPositionSecond = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionSecond);
        TextView textViewSeparatorPositionMatch = (TextView) this.rootView.findViewById(R.id.playerTextViewSeparatorPositionMatch);
        TextView textViewPositionMatch = (TextView) this.rootView.findViewById(R.id.playerTextViewPositionMatch);
        TextView textViewForm = (TextView) this.rootView.findViewById(R.id.playerTextViewFormValue);
        TextView textViewEnergy = (TextView) this.rootView.findViewById(R.id.playerTextViewEnergyValue);
        TextView textViewAverageText = (TextView) this.rootView.findViewById(R.id.playerTextViewAverageText);
        TextView textViewAverageValue = (TextView) this.rootView.findViewById(R.id.playerTextViewAverageValue);
        if (player.getStateInjury().intValue() > 0) {
            imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.news_injured));
            textViewSeparatorPositionMatch.setVisibility(8);
            textViewPositionMatch.setVisibility(0);
            textViewPositionFirst.setVisibility(8);
            textViewSeparatorPositionSecond.setVisibility(8);
            textViewPositionSecond.setVisibility(8);
            if (player.getStateInjury().intValue() > 1) {
                textViewPositionMatch.setText(String.valueOf(getHomeActivity().getString(R.string.damage)) + " " + player.getStateInjury() + " " + getHomeActivity().getString(R.string.days));
            } else {
                textViewPositionMatch.setText(String.valueOf(getHomeActivity().getString(R.string.damage)) + " " + player.getStateInjury() + " " + getHomeActivity().getString(R.string.day));
            }
        } else {
            int potential = player.getPotential().intValue();
            if (potential >= 9) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star6));
            } else if (potential >= 7) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star5));
            } else if (potential >= 5) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star4));
            } else if (potential >= 3) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star3));
            } else if (potential >= 1) {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star2));
            } else {
                imageViewPotential.setImageDrawable(getHomeActivity().getResources().getDrawable(R.drawable.star1));
            }
            textViewPositionFirst.setText(Util.getLongPositionString(getHomeActivity(), player.getPositionFirst()));
            if (player.getPositionSecond().intValue() != 0) {
                textViewSeparatorPositionSecond.setVisibility(0);
                textViewPositionSecond.setVisibility(0);
                textViewPositionSecond.setText(Util.getLongPositionString(getHomeActivity(), player.getPositionSecond()));
            } else {
                textViewSeparatorPositionSecond.setVisibility(8);
                textViewPositionSecond.setVisibility(8);
            }
            int posTitular = player.getTeam().getTactic().getTitularPosition(player).intValue();
            int posReserve = player.getTeam().getTactic().getReservePosition(player).intValue();
            if (!showTeamName && posTitular != 0) {
                if (posTitular == player.getPositionFirst().intValue()) {
                    textViewPositionFirst.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                } else if (posTitular == player.getPositionSecond().intValue()) {
                    textViewPositionSecond.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                } else {
                    textViewSeparatorPositionMatch.setVisibility(0);
                    textViewPositionMatch.setVisibility(0);
                    textViewPositionMatch.setText(Util.getLongPositionString(getHomeActivity(), Integer.valueOf(posTitular)));
                }
                textViewAverageText.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
                textViewAverageValue.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_blue_dark));
            } else if (!showTeamName && posReserve != 0) {
                if (posReserve == player.getPositionFirst().intValue()) {
                    textViewPositionFirst.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                } else if (posReserve == player.getPositionSecond().intValue()) {
                    textViewPositionSecond.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                } else {
                    textViewSeparatorPositionMatch.setVisibility(0);
                    textViewPositionMatch.setVisibility(0);
                    textViewPositionMatch.setText(Util.getLongPositionString(getHomeActivity(), Integer.valueOf(posReserve)));
                }
                textViewAverageText.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
                textViewAverageValue.setTextColor(getHomeActivity().getResources().getColor(R.color.holo_green_dark));
            }
        }
        String name = "";
        if (showTeamName) {
            if (player.getTeam().getId() == null) {
                name = String.valueOf("") + "(" + player.getContext().getString(R.string.free_agent) + ") ";
            } else {
                name = String.valueOf("") + "(" + player.getTeam().getName() + ") ";
            }
        }
        textViewName.setText(String.valueOf(name) + player.getName());
        textViewAge.setText(BlankObj.toString(player.getAge()));
        textViewForm.setText(BlankObj.toString(player.getStateForm()));
        textViewEnergy.setText(BlankObj.toString(player.getStateEnergy()));
        textViewAverageValue.setText(BlankObj.toInteger(player.getAverageSkillAll()).toString());
    }
}
