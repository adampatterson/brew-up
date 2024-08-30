# Setup

Make sure the scripts are executable

```shell
chmod +x backup_db.sh
chmod +x setup_dev.sh
chmod +x import_db.sh
```

Both export an import will assume your username and password are both `root`. Change them in the scripts if needed.

## Export Existing Databases

```shell
./backup_db.sh
```

This will create a folder `/backups` with a compressed database backup file matching the table name.

## Export DB Connections

**Table Plus**

- Right click on connections and choose **export connections / export all** and enter a password.

**Sequel Ace**

- Right click and export

## Brew - Dev environment

This is only going to install common software, if you require something extra do so at the end.

This is not going to configure anything for you like MySQ or PHP which will need your attention.

- **MySQL:** `mysql_secure_installation`
- **PHP:** Adjust your ports / sockets to run multiple PHP Versions
- **SSH:** Don't forget to export your ssh keys `~/.ssh`

```shell
./setup_dev.sh
```

_Consider making a backup up your Nginx `/servers` directory and your local `hosts` file. and any special terminal and
or .ssh configs._

## Import Databases

Before you import everything, confirm that all the files in `/backups` should be imported.

```shell
./import_db.sh
```

## Export DB Connections

**Table Plus**

- Drag the exported file into the dock icon to import, enter your password when prompted.

**Sequel Ace**

- Open the app, bottom left, click the circle and import the exported file
