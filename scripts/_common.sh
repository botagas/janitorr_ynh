#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# App name
app=janitorr

# Leaving Soon directories
leaving_soon_dir="/home/yunohost.multimedia/share/leavingsoon"
media_server_leaving_soon_dir="/home/yunohost.multimedia/share/leavingsoon"

if ls /etc/yunohost/apps | grep -q "radarr"; then
        radarr_port=$(ynh_app_setting_get --app radarr --key port)
        radarr_url="http://127.0.0.1:$radarr_port"
        radarr_api_key=$(ynh_app_setting_get --app radarr --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "sonarr"; then
        sonarr_port=$(ynh_app_setting_get --app sonarr --key port)
        sonarr_url="http://127.0.0.1:$sonarr_port"
        sonarr_api_key=$(ynh_app_setting_get --app sonarr --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "jellystat"; then
        jellystat_port=$(ynh_app_setting_get --app jellystat --key port)
        jellystat_url="http://127.0.0.1:$jellystat_port"
        jellystat_api_key=$(ynh_app_setting_get --app jellystat --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "jellyseerr"; then
        jellyseerr_port=$(ynh_app_setting_get --app jellyseerr --key port)
        jellyseerr_url="http://127.0.0.1:$jellyseerr_port"
        jellyseerr_api_key=$(ynh_app_setting_get --app jellyseerr --key api_key)
fi

#=================================================
# COMMON FUNCTIONS
#=================================================
