package re.manager.basket.data

import androidx.room.TypeConverter
import re.manager.basket.domain.model.Conference
import re.manager.basket.domain.model.Division
import re.manager.basket.domain.model.Position

class Converters {
    @TypeConverter
    fun fromPosition(value: Position): Int = value.id

    @TypeConverter
    fun toPosition(value: Int): Position = Position.fromId(value)

    @TypeConverter
    fun fromConference(value: Conference): Int = value.id

    @TypeConverter
    fun toConference(value: Int): Conference = Conference.fromId(value)

    @TypeConverter
    fun fromDivision(value: Division): Int = value.id

    @TypeConverter
    fun toDivision(value: Int): Division = Division.fromId(value)
}
