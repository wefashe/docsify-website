#### 常用SQL整理



##### 	1、备份

备份表结构

```sql
create table new_table as select * from old_table where 1=2;
```

备份表结构和数据

```sql
create table new_table as select * from old_table;
```



##### 2、锁表

```sql
-- 查询锁表记录，里面包含解锁的SQL，可以复制执行，数据可以通过username和osuser进行过滤
-- LOCK_SQL字段值为引起锁表的SQL语句，UNLOCK_SQL的值为解锁的SQL语句，执行该SQL就能解锁该行被锁的表
select distinct a.sid,
                a.serial#,
                to_char(a.logon_time, 'yyyy-mm-dd hh24:mi:ss') login_time,
                a.username,
                a.osuser,
                a.machine,
                a.status,
                d.sql_text lock_sql,
                'alter system kill session ''' || a.sid || ',' || a.serial# || ',@' ||
                a.inst_id || ''';' unlock_sql
from gv$session a, gv$locked_object b, dba_objects c, gv$sqlarea d
where a.sid = b.session_id
  --and username = 'DFDEVDF0114'
  --and osuser = 'wenfs'
  and d.address = a.sql_address
  and a.status = 'ACTIVE'
  and b.object_id = c.object_id
order by login_time asc;
```



##### 3、生成批量语句

```sql
-- 删除视图、表、存储过程、触发器等
select 'drop ' || OBJECT_TYPE || ' ' || OBJECT_NAME || ' ;' as restart_sql
  from user_objects
 where 1 = 1
   and OBJECT_TYPE in ('TABLE', 'VIEW', 'PROCEDURE', 'TRIGGER')
   and (OBJECT_NAME like 'VW_SAL%' or OBJECT_NAME like 'SAL%' or
       OBJECT_NAME like 'PERSON%' or OBJECT_NAME = 'TRG_SAL_TAX' or
       OBJECT_NAME in ('ELE_PERTYPE', 'ELE_SALTYPE'))
 order by OBJECT_TYPE desc;
```



##### 4、获取建表语句

```sql
SELECT DBMS_METADATA.GET_DDL(OBJECT_TYPE,OBJECT_NAME)  FROM USER_OBJECTS
where OBJECT_NAME = UPPER('vw_sal_person');
```



##### 5、数据拼接成一行

```sql
select 'exp dfdevdf0114/crux@10.16.25.27:1521/ufgovdb1 file=d:\test.dmp  statistics=none TABLES=(' || (listagg(OBJECT_NAME, ',') within group (order by OBJECT_NAME)) || ')'
from USER_OBJECTS
where 1 = 1
  and OBJECT_TYPE in ('TABLE', 'VIEW','PROCEDURE')
  and (OBJECT_NAME like 'VW_SAL%'
    or OBJECT_NAME like 'SAL%'
    or OBJECT_NAME like 'PERSON%'
    or OBJECT_NAME in ('ELE_PERTYPE', 'ELE_SALTYPE'))
order by OBJECT_TYPE desc
```



##### 6、约束操作

```sql
-- 查询约束所在的表
select * from user_constraints where constraint_name ='SYS_C0013243';

--禁用该约束
alter table APPMODULE_OPERATION disable constraint SYS_C0013243;
--启用约束
alter table APPMODULE_OPERATION enable constraint SYS_C0013243;

```



##### 7、数据库的编码

```sql
-- 查看value值 AMERICAN 英文、SIMPLIFIED CHINESE 中文
SELECT * FROM v$parameter WHERE name = 'nls_date_language';

-- 修改成英文语言
ALTER SESSION SET NLS_DATE_LANGUAGE='AMERICAN';
-- 地域修改成英文
ALTER SESSION SET NLS_TERRITORY='AMERICA';
-- 修改成中文语言
ALTER SESSION SET NLS_DATE_LANGUAGE='SIMPLIFIED CHINESE';
-- 地域修改成中文
ALTER SESSION SET NLS_TERRITORY='CHINA';
```



##### 8、闪回

​	访问过去某一时间的数据并从人为错误中恢复。闪回技术是Oracle 数据库独有的，支持任何级别的恢复，包括行、事务、表和数据库范围

```sql
-- 先查询要恢复时间的数据是否正确
select count(*) from sys_uimanager as of timestamp to_timestamp('2020-06-12 14:00:00','yyyy-mm-dd HH24:MI:SS')  where rg_code='360192000';

--如果主键重复，或者插入失败可以说使用下面的方法：
--开启行移动功能 
alter table sys_uimanager enable row movement;
--恢复表数据
flashback table sys_uimanager to timestamp to_timestamp('2020-06-11 20:30:00','yyyy-mm-dd HH24:MI:SS') where rg_code='360192000';

-- 恢复完数据后要关闭行移动功能 
alter table sys_uimanager disable row movement;

```



##### 9、恢复删除的表

```sql
--在回收站查看被drop删除的表
select object_name,original_name,partition_name,type,ts_name,createtime,droptime from recyclebin;
--从回收站中恢复被drop删除的PRS_DUTY_GRADE_DATA_CO
flashback table PRS_DUTY_GRADE_DATA_CO to before drop;

```

