package com.blank.bm15.activity.fragment;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.blank.bm15.activity.adapter.AdapterNewsList;
import com.blank.bm15.activity.base.BaseFragment;
import com.blank.bm15.dao.BlankDaoExtra;
import com.blank.bm15.model.comparator.NewsComparator;
import com.blank.bm15.model.object.crud.News;
import com.blank.bm15pro.R;
import java.util.Collections;
import java.util.List;

/* loaded from: classes.dex */
public class NewsFragment extends BaseFragment {
    public static final NewsFragment newInstance(int fragmentLayout, Integer navigationMode) {
        NewsFragment fragment = new NewsFragment();
        Bundle args = new Bundle(2);
        args.putInt(FRAGMENT_LAYOUT, fragmentLayout);
        args.putInt(NAVIGATION_MODE, navigationMode.intValue());
        fragment.setArguments(args);
        return fragment;
    }

    @Override // com.blank.bm15.activity.base.BaseFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        News news = new News(getHomeActivity());
        news.setGame(getHomeActivity().getGame());
        news.setMatchday(getHomeActivity().getGame().getCurrentMatchday());
        List<News> newsList = BlankDaoExtra.getNews(news);
        Collections.sort(newsList, new NewsComparator(0, -1));
        final ListView listView = (ListView) this.rootView.findViewById(R.id.fragmentLisView);
        listView.setAdapter((ListAdapter) new AdapterNewsList(getHomeActivity(), R.layout.spinner_news, newsList));
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() { // from class: com.blank.bm15.activity.fragment.NewsFragment.1
            @Override // android.widget.AdapterView.OnItemClickListener
            public void onItemClick(AdapterView<?> arg0, View arg1, int position, long arg3) {
                News news2 = (News) listView.getItemAtPosition(position);
                if (news2.getTitle().equals(NewsFragment.this.getActivity().getString(R.string.news_reddit_title))) {
                    Intent browserIntent = new Intent("android.intent.action.VIEW", Uri.parse("http://reddit.com/r/basketmanager"));
                    NewsFragment.this.startActivity(browserIntent);
                }
            }
        });
    }
}
