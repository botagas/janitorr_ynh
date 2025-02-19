<!--
N.B.: This README was automatically generated by <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
It shall NOT be edited by hand.
-->

# Janitorr for YunoHost

[![Integration level](https://img.shields.io/endpoint?url=https://yunorunner.tiesiog.lt/api/badge/janitorr/integration)](https://ci-apps.yunohost.org/ci/apps/janitorr/)
![Working status](https://img.shields.io/endpoint?url=https://yunorunner.tiesiog.lt/api/badge/janitorr/status)
![Maintenance status](https://apps.yunohost.org/badge/maintained/janitorr)

[![Install Janitorr with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=janitorr)

*[Read this README in other languages.](./ALL_README.md)*

> *This package allows you to install Janitorr quickly and simply on a YunoHost server.*  
> *If you don't have YunoHost, please consult [the guide](https://yunohost.org/install) to learn how to install it.*

## Overview

This is an application that is meant to be used as a clean-up tool for your Jellyfin media library.

Janitorr makes sure to not only delete unused media - it also deletes leftover requests in Jellyseerr, information on Sonarr and Radarr. 

If paired with Jellystat, it will determine media inactivity based on data recorded by Jellystat (user watch activity). It is highly recommended to use it in pair with Jellystat to ensure only truly not watched media is considered obsolete.


**Shipped version:** 1.0.0~ynh1

## Screenshots

![Screenshot of Janitorr](./doc/screenshots/example.jpg)

## Documentation and resources

- Upstream app code repository: <https://github.com/Schaka/janitorr>
- YunoHost Store: <https://apps.yunohost.org/app/janitorr>
- Report a bug: <https://github.com/YunoHost-Apps/janitorr_ynh/issues>

## Developer info

Please send your pull request to the [`testing` branch](https://github.com/YunoHost-Apps/janitorr_ynh/tree/testing).

To try the `testing` branch, please proceed like that:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/janitorr_ynh/tree/testing --debug
or
sudo yunohost app upgrade janitorr -u https://github.com/YunoHost-Apps/janitorr_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
