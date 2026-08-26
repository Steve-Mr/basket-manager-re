package com.blank.bm15.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.util.Log;
import android.widget.Toast;
import com.blank.bm15.dao.utils.BlankBase;
import com.blank.bm15.dao.utils.BlankObj;
import com.blank.bm15.dao.utils.BlankOrderFieldsByName;
import com.blank.bm15pro.R;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class BlankDao {
    public static final String ID = "id";
    private static final String TEMP = "temp";

    public static <T extends BlankBase> List<T> getAll(SQLiteDatabase db, T obj) {
        ArrayList arrayList = new ArrayList();
        Cursor c = null;
        try {
            try {
                c = db.rawQuery(getQuerySelect(obj), null);
                if (c.moveToFirst()) {
                    do {
                        BlankBase blankBaseCreateNewInstance = createNewInstance(obj);
                        putCursorValuesInObject(c, blankBaseCreateNewInstance);
                        arrayList.add(blankBaseCreateNewInstance);
                    } while (c.moveToNext());
                }
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
                if (c != null) {
                    c.close();
                }
            }
            return arrayList;
        } finally {
            if (c != null) {
                c.close();
            }
        }
    }

    public static <T extends BlankBase> List<T> getAll(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        List<T> list = null;
        try {
            SQLiteDatabase db = database.getReadableDatabase();
            list = getAll(db, obj);
        } catch (Exception e) {
            Log.e(getTableName(obj), e.toString());
        } finally {
            closeDatabase(database);
        }
        return list;
    }

    public static <T extends BlankBase> List<T> getSome(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        ArrayList arrayList = new ArrayList();
        Cursor c = null;
        try {
            try {
                String query = String.valueOf(getQuerySelect(obj)) + getQueryWhere(obj);
                c = database.getReadableDatabase().rawQuery(query, null);
                if (c.moveToFirst()) {
                    do {
                        BlankBase blankBaseCreateNewInstance = createNewInstance(obj);
                        putCursorValuesInObject(c, blankBaseCreateNewInstance);
                        arrayList.add(blankBaseCreateNewInstance);
                    } while (c.moveToNext());
                }
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
            }
            return arrayList;
        } catch (Throwable th) {
            if (c != null) {
                c.close();
            }
            closeDatabase(database);
            throw th;
        }
    }

    public static <T extends BlankBase> List<T> getSomeLike(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        ArrayList arrayList = new ArrayList();
        Cursor c = null;
        try {
            try {
                String query = String.valueOf(getQuerySelect(obj)) + getQueryWhereLike(obj);
                c = database.getReadableDatabase().rawQuery(query, null);
                if (c.moveToFirst()) {
                    do {
                        BlankBase blankBaseCreateNewInstance = createNewInstance(obj);
                        putCursorValuesInObject(c, blankBaseCreateNewInstance);
                        arrayList.add(blankBaseCreateNewInstance);
                    } while (c.moveToNext());
                }
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
            }
            return arrayList;
        } catch (Throwable th) {
            if (c != null) {
                c.close();
            }
            closeDatabase(database);
            throw th;
        }
    }

    public static <T extends BlankBase> void get(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        Cursor c = null;
        try {
            try {
                String query = String.valueOf(getQuerySelect(obj)) + getQueryWhere(obj);
                Cursor c2 = database.getReadableDatabase().rawQuery(query, null);
                if (c2.moveToFirst()) {
                    putCursorValuesInObject(c2, obj);
                } else {
                    obj.setId(null);
                }
                if (c2 != null) {
                    c2.close();
                }
                closeDatabase(database);
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
                if (0 != 0) {
                    c.close();
                }
                closeDatabase(database);
            }
        } catch (Throwable th) {
            if (0 != 0) {
                c.close();
            }
            closeDatabase(database);
            throw th;
        }
    }

    public static <T extends BlankBase> void loadById(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        Cursor c = null;
        if (obj != null) {
            try {
                try {
                    if (obj.getId() != null) {
                        int id = obj.getId().intValue();
                        resetObject(obj);
                        obj.setId(Integer.valueOf(id));
                        c = database.getReadableDatabase().rawQuery(String.valueOf(getQuerySelect(obj)) + getQueryWhere(obj), null);
                        if (c.moveToFirst()) {
                            putCursorValuesInObject(c, obj);
                        } else {
                            obj.setId(null);
                        }
                    }
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                    if (c != null) {
                        c.close();
                    }
                    closeDatabase(database);
                    return;
                }
            } catch (Throwable th) {
                if (c != null) {
                    c.close();
                }
                closeDatabase(database);
                throw th;
            }
        }
        if (c != null) {
            c.close();
        }
        closeDatabase(database);
    }

    public static <T extends BlankBase> void deleteAll(List<T> list) {
        if (list != null && !list.isEmpty()) {
            BlankDatabaseManagement database = openDatabase(list.get(0));
            SQLiteDatabase writableDatabase = database.getWritableDatabase();
            String tableName = getTableName(list.get(0));
            try {
                writableDatabase.beginTransaction();
                for (T obj : list) {
                    if (obj != null && obj.getId() != null) {
                        writableDatabase.delete(tableName, "id = " + obj.getId(), null);
                    }
                }
                writableDatabase.setTransactionSuccessful();
            } catch (Exception e) {
                Log.e(getTableName(list.get(0)), e.toString());
            } finally {
                writableDatabase.endTransaction();
                closeDatabase(database);
            }
        }
    }

    public static <T extends BlankBase> void delete(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        if (obj != null) {
            try {
                if (obj.getId() != null) {
                    database.getWritableDatabase().delete(getTableName(obj), "id = " + obj.getId(), null);
                }
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
            } finally {
                closeDatabase(database);
            }
        }
    }

    public static <T extends BlankBase> void saveOrUpdate(T obj) {
        BlankDatabaseManagement database = openDatabase(obj);
        ContentValues values = getContentValues(obj);
        try {
            if (values != null) {
                if (BlankObj.isNullOrEmpty(BlankObj.toString(values.get(ID))).booleanValue()) {
                    Long newId = Long.valueOf(database.getWritableDatabase().insert(getTableName(obj), null, values));
                    obj.setId(BlankObj.toInteger(newId));
                } else {
                    values.remove(ID);
                    database.getWritableDatabase().update(getTableName(obj), values, "id = " + obj.getId(), null);
                }
            }
        } catch (Exception e) {
            Log.e(getTableName(obj), e.toString());
        } finally {
            closeDatabase(database);
        }
    }

    public static <T extends BlankBase> void saveOrUpdateAll(SQLiteDatabase db, List<T> list) {
        if (list != null && !list.isEmpty()) {
            String tableName = getTableName(list.get(0));
            try {
                db.beginTransaction();
                for (T obj : list) {
                    ContentValues values = getContentValues(obj);
                    if (values != null) {
                        if (BlankObj.isNullOrEmpty(BlankObj.toString(values.get(ID))).booleanValue()) {
                            Long newId = Long.valueOf(db.insert(tableName, null, values));
                            obj.setId(BlankObj.toInteger(newId));
                        } else {
                            values.remove(ID);
                            db.update(getTableName(obj), values, "id = " + obj.getId(), null);
                        }
                    }
                }
                db.setTransactionSuccessful();
            } catch (Exception e) {
                Log.e(getTableName(list.get(0)), e.toString());
            } finally {
                db.endTransaction();
            }
        }
    }

    public static <T extends BlankBase> void saveOrUpdateAll(List<T> list) {
        if (list != null && !list.isEmpty()) {
            BlankDatabaseManagement database = openDatabase(list.get(0));
            try {
                saveOrUpdateAll(database.getWritableDatabase(), list);
            } catch (Exception e) {
                Log.e(getTableName(list.get(0)), e.toString());
            } finally {
                closeDatabase(database);
            }
        }
    }

    public static <T extends BlankBase> String getQueryCreate(T obj) {
        String create = "CREATE TABLE IF NOT EXISTS " + getTableName(obj) + " ( ";
        List<Field> fields = getOrderedFields(obj);
        for (int i = 0; i < fields.size(); i++) {
            String column = fields.get(i).getName();
            if (column.equals(ID)) {
                column = String.valueOf(column) + " INTEGER PRIMARY KEY AUTOINCREMENT ";
            } else if (fields.get(i).getType().equals(Integer.class) || fields.get(i).getType().equals(Long.class) || BlankBase.class.isAssignableFrom(fields.get(i).getType())) {
                column = String.valueOf(column) + " INTEGER ";
            } else if (fields.get(i).getType().equals(Float.class) || fields.get(i).getType().equals(Double.class)) {
                column = String.valueOf(column) + " REAL ";
            } else if (fields.get(i).getType().equals(String.class)) {
                column = String.valueOf(column) + " TEXT ";
            }
            if (i == 0) {
                create = String.valueOf(create) + column;
            } else {
                create = String.valueOf(create) + ", " + column;
            }
        }
        return String.valueOf(create) + " )";
    }

    public static <T extends BlankBase> String getQueryDelete(T obj) {
        return "DROP TABLE IF EXISTS " + getTableName(obj);
    }

    public static <T extends BlankBase> String getQuerySelect(T obj) {
        return "SELECT * FROM " + getTableName(obj);
    }

    public static <T extends BlankBase> String getQueryWhere(T obj) {
        String fieldValue;
        String where = "";
        List<Field> fields = getOrderedFields(obj);
        for (int i = 0; i < fields.size(); i++) {
            try {
                Field field = fields.get(i);
                field.setAccessible(Boolean.TRUE.booleanValue());
                if (field.get(obj) != null) {
                    String fieldName = field.getName();
                    Object value = field.get(obj);
                    if (value instanceof String) {
                        fieldValue = "'" + BlankObj.toString(value) + "'";
                    } else if (value instanceof BlankBase) {
                        Integer id = ((BlankBase) value).getId();
                        if (id != null) {
                            fieldValue = BlankObj.toString(id);
                        }
                    } else {
                        fieldValue = BlankObj.toString(value);
                    }
                    if ("".equals(where)) {
                        where = String.valueOf(where) + " WHERE " + fieldName + " = " + fieldValue;
                    } else {
                        where = String.valueOf(where) + " AND " + fieldName + " = " + fieldValue;
                    }
                }
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
            }
        }
        return where;
    }

    public static <T extends BlankBase> String getQueryWhereLike(T obj) {
        String fieldValue;
        String where = "";
        List<Field> fields = getOrderedFields(obj);
        for (int i = 0; i < fields.size(); i++) {
            try {
                Field field = fields.get(i);
                field.setAccessible(Boolean.TRUE.booleanValue());
                if (field.get(obj) != null) {
                    String fieldName = field.getName();
                    Object value = field.get(obj);
                    if (value instanceof BlankBase) {
                        fieldValue = "'%" + BlankObj.toString(((BlankBase) value).getId()) + "%'";
                    } else {
                        fieldValue = "'%" + BlankObj.toString(value).toUpperCase() + "%'";
                    }
                    if ("".equals(where)) {
                        where = String.valueOf(where) + " WHERE UPPER(" + fieldName + ") LIKE (" + fieldValue + ")";
                    } else {
                        where = String.valueOf(where) + " AND UPPER(" + fieldName + ") LIKE (" + fieldValue + ")";
                    }
                }
            } catch (Exception e) {
                Log.e(getTableName(obj), e.toString());
            }
        }
        return where;
    }

    public static <T extends BlankBase> void insertDefaultRows(SQLiteDatabase db, List<T> list) {
        if (list != null && !list.isEmpty()) {
            String tableName = getTableName(list.get(0));
            if (list != null) {
                for (T obj : list) {
                    ContentValues values = getContentValues(obj);
                    if (values != null) {
                        db.insertOrThrow(tableName, null, values);
                    }
                }
            }
        }
    }

    public static <T extends BlankBase> void exportToCSV(List<T> list) throws Throwable {
        if (!list.isEmpty()) {
            T obj = list.get(0);
            List<Field> fields = getOrderedFields(obj);
            int colCount = fields.size();
            String fileName = String.valueOf(getTableName(obj)) + ".csv";
            String subfolder = obj.getContext().getString(obj.getContext().getApplicationInfo().labelRes);
            BufferedWriter bfw = null;
            File sdCardDir = new File(Environment.getExternalStorageDirectory() + "/" + subfolder);
            if (!sdCardDir.exists()) {
                sdCardDir.mkdir();
            }
            File saveFile = new File(sdCardDir, fileName);
            if (saveFile.exists()) {
                saveFile.delete();
                saveFile = new File(sdCardDir, fileName);
            }
            try {
                try {
                    BufferedWriter bfw2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(saveFile, true)));
                    for (int i = 0; i < colCount; i++) {
                        try {
                            Field field = fields.get(i);
                            field.setAccessible(Boolean.TRUE.booleanValue());
                            String name = field.getName();
                            if (i != colCount - 1) {
                                bfw2.write(String.valueOf(name) + ';');
                            } else {
                                bfw2.write(name);
                            }
                        } catch (Exception e) {
                            e = e;
                            bfw = bfw2;
                            Log.e(getTableName(obj), e.toString());
                            if (bfw != null) {
                                try {
                                    bfw.flush();
                                    bfw.close();
                                    return;
                                } catch (IOException e2) {
                                    Log.e(getTableName(obj), e2.toString());
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
                                    Log.e(getTableName(obj), e3.toString());
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
                            if (value != null && BlankBase.class.isAssignableFrom(field2.getType())) {
                                value = ((BlankBase) value).getId();
                            }
                            if (i2 != colCount - 1) {
                                bfw2.write(String.valueOf(BlankObj.toString(value)) + ';');
                            } else {
                                bfw2.write(BlankObj.toString(value));
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
                            Log.e(getTableName(obj), e4.toString());
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Exception e5) {
                e = e5;
            }
        }
    }

    protected static <T extends BlankBase> T createNewInstance(T obj) {
        try {
            return (T) obj.getClass().getDeclaredConstructor(Context.class).newInstance(obj.getContext());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    protected static <T extends BlankBase> String getTableName(T obj) {
        return obj.getClass().getSimpleName();
    }

    protected static <T extends BlankBase> BlankDatabaseManagement openDatabase(T obj) {
        BlankDatabaseManagement blankDatabaseManagement = new BlankDatabaseManagement(obj.getContext());
        return blankDatabaseManagement;
    }

    protected static void closeDatabase(BlankDatabaseManagement blankDatabaseManagement) {
        if (blankDatabaseManagement != null) {
            blankDatabaseManagement.close();
        }
    }

    public static <T extends BlankBase> List<Field> getOrderedFields(T obj) {
        List<Field> list = getInheritedFields(obj.getClass());
        Collections.sort(list, new BlankOrderFieldsByName());
        return list;
    }

    protected static List<Field> getInheritedFields(Class<?> type) {
        List<Field> fields = new ArrayList<>();
        Class<?> c = type;
        while (true) {
            if (c == null) {
                break;
            }
            if (c.getName().equals(BlankBase.class.getName())) {
                Field[] aux = c.getDeclaredFields();
                for (int i = 0; i < aux.length; i++) {
                    if (aux[i].getName().equals(ID)) {
                        fields.add(aux[i]);
                    }
                }
            } else {
                Field[] aux2 = c.getDeclaredFields();
                for (int i2 = 0; i2 < aux2.length; i2++) {
                    if (!aux2[i2].getName().startsWith(TEMP)) {
                        fields.add(aux2[i2]);
                    }
                }
                c = c.getSuperclass();
            }
        }
        return fields;
    }

    protected static <T extends BlankBase> void resetObject(T obj) {
        List<Field> fields = getOrderedFields(obj);
        if (!fields.isEmpty()) {
            for (Field field : fields) {
                field.setAccessible(Boolean.TRUE.booleanValue());
                try {
                    field.set(obj, null);
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                }
            }
        }
    }

    protected static <T extends BlankBase> ContentValues getContentValues(T obj) {
        ContentValues values = null;
        List<Field> fields = getOrderedFields(obj);
        if (!fields.isEmpty()) {
            values = new ContentValues();
            for (Field field : fields) {
                field.setAccessible(Boolean.TRUE.booleanValue());
                try {
                    String name = field.getName();
                    Object value = field.get(obj);
                    if (value == null) {
                        values.putNull(name);
                    } else if (value instanceof Boolean) {
                        values.put(name, BlankObj.toBoolean(value));
                    } else if (value instanceof String) {
                        values.put(name, BlankObj.toString(value));
                    } else if (value instanceof Integer) {
                        values.put(name, BlankObj.toInteger(value));
                    } else if (value instanceof Long) {
                        values.put(name, BlankObj.toLong(value));
                    } else if (value instanceof Double) {
                        values.put(name, BlankObj.toDouble(value));
                    } else if (value instanceof Float) {
                        values.put(name, BlankObj.toFloat(value));
                    } else if (value instanceof BlankBase) {
                        values.put(name, ((BlankBase) value).getId());
                    }
                } catch (Exception e) {
                    Log.e(getTableName(obj), e.toString());
                }
            }
        }
        return values;
    }

    protected static <T extends BlankBase> void putCursorValuesInObject(Cursor c, T obj) {
        List<Field> fields = getOrderedFields(obj);
        if (!fields.isEmpty()) {
            for (Field field : fields) {
                field.setAccessible(Boolean.TRUE.booleanValue());
                int columIndex = c.getColumnIndex(field.getName());
                if (columIndex != -1) {
                    try {
                        Object value = field.get(obj);
                        if (value == null) {
                            if (c.isNull(columIndex)) {
                                field.set(obj, null);
                            } else if (field.getType().equals(Boolean.class)) {
                                field.set(obj, BlankObj.toBoolean(Integer.valueOf(c.getInt(columIndex))));
                            } else if (field.getType().equals(String.class)) {
                                field.set(obj, c.getString(columIndex));
                            } else if (field.getType().equals(Integer.class)) {
                                field.set(obj, Integer.valueOf(c.getInt(columIndex)));
                            } else if (field.getType().equals(Long.class)) {
                                field.set(obj, BlankObj.toLong(Long.valueOf(c.getLong(columIndex))));
                            } else if (field.getType().equals(Float.class)) {
                                field.set(obj, BlankObj.toFloat(Float.valueOf(c.getFloat(columIndex))));
                            } else if (field.getType().equals(Double.class)) {
                                field.set(obj, BlankObj.toDouble(Double.valueOf(c.getDouble(columIndex))));
                            } else if (BlankBase.class.isAssignableFrom(field.getType())) {
                                Class<?> clazz = field.getType();
                                BlankBase aux = (BlankBase) clazz.getDeclaredConstructor(Context.class).newInstance(obj.getContext());
                                aux.setId(Integer.valueOf(c.getInt(columIndex)));
                                field.set(obj, aux);
                            }
                        }
                    } catch (Exception e) {
                        Log.e(getTableName(obj), e.toString());
                    }
                }
            }
            obj.load();
            return;
        }
        obj.setId(null);
    }
}
