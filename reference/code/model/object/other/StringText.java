package com.blank.bm15.model.object.other;

import com.blank.bm15.model.object.crud.Player;
import com.blank.bm15pro.R;

/* loaded from: classes.dex */
public class StringText {
    private Integer color;
    private Integer id;
    private String text;

    public StringText() {
    }

    public StringText(Integer id, String text, Player player) {
        this.id = id;
        this.text = text;
        if (player.getPositionFirst().intValue() == id.intValue() || player.getPositionFirst().intValue() == id.intValue() - 5) {
            this.color = Integer.valueOf(player.getContext().getResources().getColor(R.color.holo_blue_dark));
        } else if (player.getPositionSecond().intValue() != 0 && (player.getPositionSecond().intValue() == id.intValue() || player.getPositionSecond().intValue() == id.intValue() - 5)) {
            this.color = Integer.valueOf(player.getContext().getResources().getColor(R.color.holo_green_dark));
        } else {
            this.color = Integer.valueOf(player.getContext().getResources().getColor(R.color.base_gray_very_dark));
        }
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getColor() {
        return this.color;
    }

    public void setColor(Integer color) {
        this.color = color;
    }

    public String getText() {
        return this.text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
