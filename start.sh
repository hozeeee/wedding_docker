
# 生成 mysql 脚本 
echo -e 'create database wedding;\nuse wedding;\n' >> /init.sql
cat /wedding/wedding.sql >> /init.sql

# 启动 mysqld
mysqld --user=root &

# 导入 sql 脚本
mysqld_inited=0
while(($mysqld_inited==0))
do
  if (mysql < /init.sql)
  then
    mysqld_inited=1
  fi
done

# 启动 node 服务
cd /wedding && sails lift
