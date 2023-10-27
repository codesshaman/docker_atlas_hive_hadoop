# ApacheAtlas

## Установка:

``git clone https://gitlab.askona.ru/dp-data-platform/apacheatlas.git``

``cd apacheatlas`` - переход в папку проекта

``make build`` - сборка проекта

## Взаимодействие:

Подключаемся к данному серверу по порту 21000. Логин и пароль: admin/admin.

Для входа внутрь контейнера есть команда ``make connect``

Остальные команды можно посмотреть по ``make help``

Вот что говорит GPT о соединении hive и atlas

Чтобы Apache Atlas видел базы данных Hive, необходимо настроить интеграцию между Apache Atlas и Hive metastore.

Вот несколько шагов, которые нужно выполнить:

    Установите и настройте Apache Atlas, следуя инструкциям в документации Apache Atlas.

    В конфигурационном файле Apache Atlas (atlas-application.properties), найдите и настройте следующие свойства:

    plaintext

atlas.hook.hive.enabled=true
atlas.hook.hive.synchronous=true

Эти свойства включают Apache Atlas hook для Hive и настраивают его для синхронной интеграции с Hive.

Настройте файл конфигурации Hive (hive-site.xml), чтобы указать Hive для взаимодействия с Apache Atlas. Добавьте или измените следующие свойства:

plaintext

    hive.metastore.event.listeners=org.apache.atlas.hive.hook.HiveHook
    atlas.cluster.name=my_atlas_cluster_name
    atlas.hook.hive.maxThreads=20

    В свойстве hive.metastore.event.listeners указывается класс-слушатель HiveHook, который обеспечивает интеграцию с Apache Atlas. 
    Значение my_atlas_cluster_name должно соответствовать имени вашего кластера Atlas.

    Перезапустите Hive metastore и все Hive сервисы, чтобы применить изменения конфигурации.

После выполнения этих шагов, Apache Atlas будет получать метаданные из Hive metastore и отслеживать изменения в Hive базах данных, 
таблицах и других компонентах. Вы сможете управлять и просматривать это метаданные в Apache Atlas UI и использовать его для управления исходными данными Hive.

Как узнать имя кластера atlas?

Для узнать имя кластера Apache Atlas, вы можете обратиться к конфигурационному файлу atlas-application.properties, который находится в 
директории настройки Apache Atlas.

    Откройте файл atlas-application.properties в текстовом редакторе.

    В файле найдите строку, содержащую свойство atlas.cluster.name. Пример:

    text

    atlas.cluster.name=my_atlas_cluster

    Здесь my_atlas_cluster - это имя кластера Apache Atlas.

Если конфигурационный файл atlas-application.properties не указывает явно имя кластера (т.е. свойство atlas.cluster.name отсутствует), 
то по умолчанию кластер может иметь имя atlas_titan, но это может зависеть от вашей конкретной установки.

Если вы использовали инструменты для установки и настройки Apache Atlas (например, Apache Ambari или Cloudera Manager), 
вы также можете проверить настройки веб-интерфейса этих инструментов, чтобы узнать имя кластера Apache Atlas.