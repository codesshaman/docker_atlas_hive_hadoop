#FROM sburn/apache-atlas
FROM sburn/apache-atlas:2.1.0
#Add atlas hive hook jars
ADD conf/atlas-application.properties /opt/apache-atlas-2.1.0/conf
