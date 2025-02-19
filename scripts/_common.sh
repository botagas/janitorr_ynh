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
        radarr_path=$(ynh_app_setting_get --app radarr --key path)
        radarr_url="http://$radarr_path:$radarr_port"
        radarr_api_key=$(ynh_app_setting_get --app radarr --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "sonarr"; then
        sonarr_port=$(ynh_app_setting_get --app sonarr --key port)
        sonarr_path=$(ynh_app_setting_get --app sonarr --key path)
        sonarr_url="http://$sonarr_path:$sonarr_port"
        sonarr_api_key=$(ynh_app_setting_get --app sonarr --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "jellystat"; then
        jellystat_port=$(ynh_app_setting_get --app jellystat --key port)
        jellystat_path=$(ynh_app_setting_get --app jellystat --key path)
        jellystat_url="http://$jellystat_path:$jellystat_port"
        jellystat_api_key=$(ynh_app_setting_get --app jellystat --key api_key)
fi
if ls /etc/yunohost/apps | grep -q "jellyseerr"; then
        jellyseerr_port=$(ynh_app_setting_get --app jellyseerr --key port)
        jellyseerr_path=$(ynh_app_setting_get --app jellyseerr --key path)
        jellyseerr_url="http://$jellyseerr_path:$jellyseerr_port"
        jellyseerr_api_key=$(ynh_app_setting_get --app jellyseerr --key api_key)
fi

#=================================================
# COMMON FUNCTIONS
#=================================================
