# p-awjf_waldplan_fix

```
java -jar /Users/stefan/apps/ili2pg-4.9.0/ili2pg-4.9.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1 --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --schemaimport
```

```
java -jar /Users/stefan/apps/ili2pg-4.9.0/ili2pg-4.9.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1 --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --disableValidation --import wald_bestandeskarte/awjf_waldplan_bestandeskarte_v1.xtf
```
-> v4_9_0 funktioniert nicht wegen falschen Geometrien




```
java -jar /Users/stefan/apps/ili2pg-4.3.1/ili2pg-4.3.1.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1 --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --disableValidation --schemaimport
```

```
java -jar /Users/stefan/apps/ili2pg-4.3.1/ili2pg-4.3.1.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1 --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --disableValidation --import awjf_waldplan_bestandeskarte_v1_alles.xtf
```

```
java -jar /Users/stefan/apps/ili2pg-4.9.0/ili2pg-4.9.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1_fix --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --schemaimport
```

```
java -jar /Users/stefan/apps/ili2pg-4.9.0/ili2pg-4.9.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1_definitiv --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --schemaimport
```


```
java -jar /Users/stefan/apps/ili2pg-4.9.0/ili2pg-4.9.0.jar --dbhost localhost --dbport 54321 --dbdatabase edit --dbusr ddluser --dbpwd ddluser --dbschema awjf_waldplan_v1_definitiv --defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createUnique --createEnumTabs --createMetaInfo --createNumChecks --nameByTopic --strokeArcs --modeldir ".;https://models.geo.admin.ch" --models SO_AWJF_Waldplan_Bestandeskarte_20220510 --disableValidation --export fubar_2.xtf
```